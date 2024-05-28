package com.webank.host.dubbo;

import com.webank.common.core.utils.BeanCopyUtils;
import com.webank.common.mybatis.helper.DataPermissionHelper;
import com.webank.host.api.RemoteHostService;
import com.webank.host.api.model.HostDTO;
import com.webank.host.domain.Host;
import com.webank.host.domain.bo.HostBo;
import com.webank.host.domain.vo.HostVo;
import com.webank.host.service.IHostService;
import lombok.RequiredArgsConstructor;
import org.apache.dubbo.config.annotation.DubboService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * 主机服务
 *
 * @author QCTC
 */
@RequiredArgsConstructor
@Service
@DubboService
public class RemoteHostServiceImpl implements RemoteHostService {
    private final IHostService hostService;

    @Override
    public List<HostDTO> getHostList() {
        List<HostVo> hostSrcList = DataPermissionHelper.ignore(() -> hostService.queryList(new HostBo()));
        return BeanCopyUtils.copyList(hostSrcList, HostDTO.class);
    }

    @Override
    public HostDTO getHostById(Integer id) {
        Host host = DataPermissionHelper.ignore(() -> hostService.queryHostById(id));
        if (null == host) {
            return null;
        }
        HostDTO hostDTO = new HostDTO();
        BeanCopyUtils.copy(host, hostDTO);

        return hostDTO;
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED)
    public Boolean updateHostStatus(Integer id, Byte status, String remark) {
        return DataPermissionHelper.ignore(() -> hostService.updateHostStatus(id, status, remark));
    }

    @Override
    public HostDTO getHostByIp(String ip) {
        Host host = DataPermissionHelper.ignore(() -> hostService.queryHostByIp(ip));

        if (null == host) {
            return null;
        }

        HostDTO hostDTO = new HostDTO();
        BeanCopyUtils.copy(host, hostDTO);

        return hostDTO;
    }
}
