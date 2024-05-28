package com.webank.host.api;

import com.webank.host.api.model.HostDTO;

import java.util.List;

/**
 * 主机管理服务
 *
 * @author QCTC
 */
public interface RemoteHostService {

    /**
     * 获取主机列表所有数据
     *
     * @return 主机列表信息
     */
    List<HostDTO> getHostList();

    /**
     * 根据主机主键id获取主机信息
     *
     * @param id 主机id
     * @return 主机信息
     */
    HostDTO getHostById(Integer id);

    /**
     * 更新某个主机的状态
     *
     * @param id 主机id
     * @param status 状态
     * @param remark 备注
     * @return void
     */
    Boolean updateHostStatus(Integer id, Byte status, String remark);

    /**
     * 根据主机ip获取主机信息
     *
     * @param ip 主机ip
     * @return 主机信息
     */
    HostDTO getHostByIp(String ip);
}
