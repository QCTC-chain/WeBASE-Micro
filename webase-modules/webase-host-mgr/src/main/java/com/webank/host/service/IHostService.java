package com.webank.host.service;

import com.webank.common.mybatis.core.page.PageQuery;
import com.webank.common.mybatis.core.page.TableDataInfo;
import com.webank.host.domain.Host;
import com.webank.host.domain.bo.HostBo;
import com.webank.host.domain.vo.HostVo;

import java.util.Collection;
import java.util.List;

/**
 * 物理主机信息Service接口
 *
 * @author webase
 * @date 2023-09-07
 */
public interface IHostService {

    /**
     * 查询主机信息
     */
    HostVo queryById(Integer id);

    /**
     * 查询主机信息列表
     */
    TableDataInfo<HostVo> queryPageList(HostBo bo, PageQuery pageQuery);

    /**
     * 查询主机信息列表
     */
    List<HostVo> queryList(HostBo bo);

    /**
     * 添加主机信息
     */
    Boolean insertByBo(HostBo bo);

    /**
     * 修改主机信息
     */
    Boolean updateByBo(HostBo bo);

    /**
     * 校验并批量删除主机信息信息
     */
    Boolean deleteWithValidByIds(Collection<Long> ids, Boolean isValid);

    /**
     * @description 获取部署主机的ssh公钥信息
     *
     * @return java.lang.String
     * @author 2023/9/15
     * @date zhangyang 09:25:23
     */
    String getSSHRsa();

    /**
     * @description 更新某个主机的状态(bcos节点管理服务在部署时需要更新状态)
     * @param id
     * @param status
     * @param remark
     * @return java.lang.Boolean
     * @author 2023/9/18
     * @date zhangyang 16:39:55
     */
    Boolean updateHostStatus(Integer id, Byte status, String remark);

    Host queryHostById(Integer id);

    Host queryHostByIp(String ip);
}
