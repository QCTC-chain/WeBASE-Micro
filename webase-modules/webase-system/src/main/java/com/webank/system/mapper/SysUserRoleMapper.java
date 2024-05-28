package com.webank.system.mapper;

import com.webank.common.mybatis.core.mapper.BaseMapperPlus;
import com.webank.system.domain.SysUserRole;

import java.util.List;

/**
 * 用户与角色关联表 数据层
 *
 * @author QCTC
 */
public interface SysUserRoleMapper extends BaseMapperPlus<SysUserRoleMapper, SysUserRole, SysUserRole> {

    List<Long> selectUserIdsByRoleId(Long roleId);

}
