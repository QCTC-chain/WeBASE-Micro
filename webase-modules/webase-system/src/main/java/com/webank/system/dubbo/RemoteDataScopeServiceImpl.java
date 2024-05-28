package com.webank.system.dubbo;

import cn.hutool.core.collection.CollUtil;
import cn.hutool.core.convert.Convert;
import cn.hutool.core.util.ObjectUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.webank.common.core.exception.ServiceException;
import com.webank.common.core.utils.SpringUtils;
import com.webank.common.core.utils.StreamUtils;
import com.webank.common.mybatis.enums.DataScopeType;
import com.webank.common.mybatis.helper.DataBaseHelper;
import com.webank.common.satoken.utils.LoginHelper;
import com.webank.system.api.RemoteDataScopeService;
import com.webank.system.api.domain.SysDept;
import com.webank.system.api.model.LoginUser;
import com.webank.system.api.model.RoleDTO;
import com.webank.system.domain.SysRoleDept;
import com.webank.system.mapper.SysDeptMapper;
import com.webank.system.mapper.SysRoleDeptMapper;
import lombok.RequiredArgsConstructor;
import org.apache.dubbo.config.annotation.DubboService;
import org.springframework.context.expression.BeanFactoryResolver;
import org.springframework.expression.BeanResolver;
import org.springframework.expression.ExpressionParser;
import org.springframework.expression.ParserContext;
import org.springframework.expression.common.TemplateParserContext;
import org.springframework.expression.spel.standard.SpelExpressionParser;
import org.springframework.expression.spel.support.StandardEvaluationContext;
import org.springframework.stereotype.Service;

import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.function.Function;

/**
 * 数据权限 实现
 * <p>
 * 注意: 此Service内不允许调用标注`数据权限`注解的方法
 * 例如: deptMapper.selectList 此 selectList 方法标注了`数据权限`注解 会出现循环解析的问题
 *
 * @author QCTC
 */
@RequiredArgsConstructor
@Service
@DubboService
public class RemoteDataScopeServiceImpl implements RemoteDataScopeService {

    private final SysRoleDeptMapper roleDeptMapper;
    private final SysDeptMapper deptMapper;

    /**
     * spel 解析器
     */
    private final ExpressionParser parser = new SpelExpressionParser();
    private final ParserContext parserContext = new TemplateParserContext();
    /**
     * bean解析器 用于处理 spel 表达式中对 bean 的调用
     */
    private final BeanResolver beanResolver = new BeanFactoryResolver(SpringUtils.getBeanFactory());

    @Override
    public String getRoleCustom(Long roleId) {
        List<SysRoleDept> list = roleDeptMapper.selectList(
            new LambdaQueryWrapper<SysRoleDept>()
                .select(SysRoleDept::getDeptId)
                .eq(SysRoleDept::getRoleId, roleId));
        if (CollUtil.isNotEmpty(list)) {
            return StreamUtils.join(list, rd -> Convert.toStr(rd.getDeptId()));
        }
        return "-1";
    }

    @Override
    public String getDeptAndChild(Long deptId) {
        List<SysDept> deptList = deptMapper.selectList(new LambdaQueryWrapper<SysDept>()
            .select(SysDept::getDeptId)
            .apply(DataBaseHelper.findInSet(deptId, "ancestors")));
        List<Long> ids = StreamUtils.toList(deptList, SysDept::getDeptId);
        ids.add(deptId);
        List<SysDept> list = deptMapper.selectList(new LambdaQueryWrapper<SysDept>()
            .select(SysDept::getDeptId)
            .in(SysDept::getDeptId, ids));
        if (CollUtil.isNotEmpty(list)) {
            return StreamUtils.join(list, d -> Convert.toStr(d.getDeptId()));
        }
        return "-1";
    }

    @Override
    public String getDataScopeSql(String token, String deptName, String userName) {
        // 更新或删除需满足所有条件
        //String joinStr = isSelect ? " OR " : " AND ";
        String joinStr = " OR ";
        LoginUser user = LoginHelper.getLoginUser(token);
        // 如果是超级管理员，则不过滤数据
        if (ObjectUtil.isNull(user) || LoginHelper.isAdmin(user.getUserId())) {
            return "";
        }

        StandardEvaluationContext context = new StandardEvaluationContext();
        context.setBeanResolver(beanResolver);
        //DataPermissionHelper.setVariable("user", user);
        //DataPermissionHelper.getContext().forEach(context::setVariable);
        context.setVariable("user", user);
        Set<String> conditions = new HashSet<>();
        for (RoleDTO role : user.getRoles()) {
            user.setRoleId(role.getRoleId());
            // 获取角色权限泛型
            DataScopeType type = DataScopeType.findCode(role.getDataScope());
            if (ObjectUtil.isNull(type)) {
                throw new ServiceException("角色数据范围异常 => " + role.getDataScope());
            }
            // 全部数据权限直接返回
            if (type == DataScopeType.ALL) {
                return "";
            }

            context.setVariable("deptName", deptName);
            context.setVariable("userName", userName);

            // 解析sql模板并填充
            String sql = parser.parseExpression(type.getSqlTemplate(), parserContext).getValue(context, String.class);
            conditions.add(joinStr + sql);
        }

        if (CollUtil.isNotEmpty(conditions)) {
            String sql = StreamUtils.join(conditions, Function.identity(), "");
            return sql.substring(joinStr.length());
        }
        return " 1 = 0 ";
    }

}
