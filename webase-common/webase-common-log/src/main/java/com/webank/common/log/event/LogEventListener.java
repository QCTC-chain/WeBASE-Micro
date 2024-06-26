package com.webank.common.log.event;

import com.webank.common.core.utils.BeanCopyUtils;
import com.webank.system.api.RemoteLogService;
import com.webank.system.api.domain.SysLogininfor;
import com.webank.system.api.domain.SysOperLog;
import org.apache.dubbo.config.annotation.DubboReference;
import org.springframework.context.event.EventListener;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Component;

/**
 * 异步调用日志服务
 *
 * @author webase
 */
@Component
public class LogEventListener {

    @DubboReference
    private RemoteLogService remoteLogService;

    /**
     * 保存系统日志记录
     */
    @Async
    @EventListener
    public void saveLog(OperLogEvent operLogEvent) {
        SysOperLog sysOperLog = BeanCopyUtils.copy(operLogEvent, SysOperLog.class);
        remoteLogService.saveLog(sysOperLog);
    }

    @Async
    @EventListener
    public void saveLogininfor(LogininforEvent logininforEvent) {
        SysLogininfor sysLogininfor = BeanCopyUtils.copy(logininforEvent, SysLogininfor.class);
        remoteLogService.saveLogininfor(sysLogininfor);
    }

}
