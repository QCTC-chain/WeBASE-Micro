package com.webank.host.api.model;

import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.util.Date;

/**
 * @author zhangyang
 * @version 1.0
 * @project WeBASE-Micro
 * @description 主机信息
 * @date 2023/9/8 14:48:13
 */
@Data
@NoArgsConstructor
public class HostDTO implements Serializable {
    private static final long serialVersionUID = 1L;

    /**
     * 主键 ID
     */
    private Integer id;

    /**
     * 主机存放节点配置文件的根目录，可能存放多个节点配置
     */
    private String rootDir;

    /**
     * 远程登录用户
     */
    private String user;

    /**
     * 主机IP
     */
    private String ip;

    /**
     * 远程ssh端口
     */
    private Integer port;

    /**
     * 主机状态：0，新建；1，初始化；2，运行等等
     */
    private Byte status;

    /**
     * remark
     */
    private String remark;

    /**
     * 创建时间
     */
    private Date createTime;

    /**
     * 更新时间
     */
    private Date updateTime;
}
