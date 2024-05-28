package com.webank.host.domain.dto;

import com.webank.common.core.validate.AddGroup;
import com.webank.common.core.validate.EditGroup;
import lombok.Data;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

/**
 * @author zhangyang
 * @version 1.0
 * @project WeBASE-Micro
 * @description 添加主机时的请求对象
 * @date 2023/9/15 09:02:46
 */
@Data
public class HostDTO {
    /**
     * 主机存放节点配置文件的根目录，可能存放多个节点配置
     */
    @NotBlank(message = "主机存放节点配置文件的根目录，可能存放多个节点配置不能为空", groups = { AddGroup.class, EditGroup.class })
    private String rootDir;

    /**
     * 远程登录用户
     */
    @NotBlank(message = "远程登录用户不能为空", groups = { AddGroup.class, EditGroup.class })
    private String user;

    /**
     * 主机IP
     */
    @NotBlank(message = "主机IP不能为空", groups = { AddGroup.class, EditGroup.class })
    private String ip;

    /**
     * 远程ssh端口
     */
    @NotNull(message = "远程ssh端口不能为空", groups = { AddGroup.class, EditGroup.class })
    private Integer port;

    /**
     * remark
     */
    private String remark;
}
