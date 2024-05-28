package com.webank.host.service.impl;

import cn.hutool.core.bean.BeanUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.webank.common.core.exception.ServiceException;
import com.webank.common.core.utils.StringUtils;
import com.webank.common.mybatis.core.page.PageQuery;
import com.webank.common.mybatis.core.page.TableDataInfo;
import com.webank.common.satoken.utils.LoginHelper;
import com.webank.host.constants.ErrMsg;
import com.webank.host.domain.Host;
import com.webank.host.domain.bo.HostBo;
import com.webank.host.domain.vo.HostVo;
import com.webank.host.mapper.HostMapper;
import com.webank.host.service.IHostService;
import com.webank.host.tools.ValidateUtil;
import com.webank.system.api.model.LoginUser;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Service;

import java.util.Collection;
import java.util.List;
import java.util.Map;

/**
 * 物理主机信息Service业务层处理
 *
 * @author webase
 * @date 2023-09-07
 */
@RequiredArgsConstructor
@Service
@Slf4j
public class HostServiceImpl implements IHostService {

    private final HostMapper baseMapper;

    private final Environment env;

    /**
     * 查询主机信息
     */
    @Override
    public HostVo queryById(Integer id) {
        return baseMapper.selectVoById(id);
    }

    /**
     * 查询主机信息列表
     */
    @Override
    public TableDataInfo<HostVo> queryPageList(HostBo bo, PageQuery pageQuery) {
        LambdaQueryWrapper<Host> lqw = buildQueryWrapper(bo);
        Page<HostVo> result = baseMapper.selectVoPage(pageQuery.build(), lqw);
        return TableDataInfo.build(result);
    }

    /**
     * 查询主机信息列表
     */
    @Override
    public List<HostVo> queryList(HostBo bo) {
        LambdaQueryWrapper<Host> lqw = buildQueryWrapper(bo);
        return baseMapper.selectVoList(lqw);
    }

    private LambdaQueryWrapper<Host> buildQueryWrapper(HostBo bo) {
        Map<String, Object> params = bo.getParams();
        LambdaQueryWrapper<Host> lqw = Wrappers.lambdaQuery();
        lqw.eq(StringUtils.isNotBlank(bo.getRootDir()), Host::getRootDir, bo.getRootDir());
        lqw.eq(StringUtils.isNotBlank(bo.getUser()), Host::getUser, bo.getUser());
        lqw.eq(StringUtils.isNotBlank(bo.getIp()), Host::getIp, bo.getIp());
        lqw.eq(bo.getPort() != null, Host::getPort, bo.getPort());
        lqw.eq(bo.getStatus() != null, Host::getStatus, bo.getStatus());
        return lqw;
    }

    /**
     * 新增主机信息
     */
    @Override
    public Boolean insertByBo(HostBo bo) {
        Host host = BeanUtil.toBean(bo, Host.class);
        validEntityBeforeSave(host);
        LoginUser curUser = LoginHelper.getLoginUser();
        if (curUser != null) {
            host.setUserId(curUser.getUserId());
            host.setDeptId(curUser.getDeptId());
        }

        boolean flag = baseMapper.insert(host) > 0;
//        if (flag) {
//            bo.setId(add.getId());
//        }
        return flag;
    }

    /**
     * 修改主机信息
     */
    @Override
    public Boolean updateByBo(HostBo bo) {
        Host update = BeanUtil.toBean(bo, Host.class);
        validEntityBeforeSave(update);
        return baseMapper.updateById(update) > 0;
    }

    /**
     * 保存前的数据校验
     */
    private void validEntityBeforeSave(Host entity){
        if(!ValidateUtil.ipv4Valid(entity.getIp())) {
            log.error("not valid ip!:{}", entity.getIp());
            throw new ServiceException(ErrMsg.IP_FORMAT_ERROR);
        }

        if (!entity.getRootDir().startsWith("/")) {
            log.error("not valid rootDir, must be absolute path!:{}", entity.getRootDir());
            throw new ServiceException(ErrMsg.HOST_DIR_REQUIRE_ABSOLUTE);
        }

        Host host = baseMapper.getByIp(entity.getIp());
        if (host != null){
            log.error("host already exist ip:{}", entity.getIp());
            throw new ServiceException(ErrMsg.HOST_ALREADY_EXIST);
        }
    }

    /**
     * 批量删除主机信息
     */
    @Override
    public Boolean deleteWithValidByIds(Collection<Long> ids, Boolean isValid) {
        if (isValid) {
            for (Long id : ids) {
                Host host = baseMapper.selectById(id);
                if (host == null) {
                    log.warn("Host:[{}] not exists.", id);
                    throw new ServiceException(ErrMsg.HOST_NOT_EXIST);
                }
            }
        }
        return baseMapper.deleteBatchIds(ids) > 0;
    }

    @Override
    public String getSSHRsa() {
        return env.getProperty("host-mgr.ssh-rsa");
    }

    @Override
    public Boolean updateHostStatus(Integer id, Byte status, String remark) {
        Host host = baseMapper.selectById(id);
        if (host == null) {
            return false;
        }

        host.setStatus(status);
        host.setRemark(remark);

        return baseMapper.updateById(host) > 0;
    }

    @Override
    public Host queryHostById(Integer id) {
        return baseMapper.selectById(id);
    }

    @Override
    public Host queryHostByIp(String ip) {
        return baseMapper.getByIp(ip);
    }
}
