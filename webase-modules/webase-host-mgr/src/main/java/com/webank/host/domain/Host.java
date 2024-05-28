package com.webank.host.domain;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.webank.common.core.web.domain.BaseEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * 物理主机信息对象 sys_host
 *
 * @author webase
 * @date 2023-09-07
 */
@Data
@EqualsAndHashCode(callSuper = true)
@TableName("host")
public class Host extends BaseEntity {

    private static final long serialVersionUID=1L;

    /**
     * 主键 ID
     */
    @TableId(type= IdType.AUTO)
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
     * 用户id
     */
    private Long userId;
    /**
     * 部门id
     */
    private Long deptId;
}
