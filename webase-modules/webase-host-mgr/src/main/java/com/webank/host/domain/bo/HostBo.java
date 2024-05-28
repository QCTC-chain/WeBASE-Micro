package com.webank.host.domain.bo;

import com.webank.common.core.validate.AddGroup;
import com.webank.common.core.validate.EditGroup;
import com.webank.common.core.web.domain.BaseEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

/**
 * 物理主机信息业务对象
 *
 * @author webase
 * @date 2023-09-07
 */

@Data
@EqualsAndHashCode(callSuper = true)
public class HostBo extends BaseEntity {

//    /**
//     * 自增长 ID
//     */
//    @NotBlank(message = "自增长 ID不能为空", groups = { EditGroup.class })
//    private String id;

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
     * 主机状态：0，新建；1，初始化；2，运行等等
     */
    @NotBlank(message = "主机状态：0，新建；1，初始化；2，运行等等不能为空", groups = { AddGroup.class, EditGroup.class })
    private Byte status;

    /**
     * remark
     */
    private String remark;


}
