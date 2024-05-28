package com.webank.host.domain.vo;

import com.alibaba.excel.annotation.ExcelIgnoreUnannotated;
import com.alibaba.excel.annotation.ExcelProperty;
import lombok.Data;



/**
 * 物理主机信息视图对象
 *
 * @author webase
 * @date 2023-09-07
 */
@Data
@ExcelIgnoreUnannotated
public class HostVo {

    private static final long serialVersionUID = 1L;

    /**
     * 主键 ID
     */
    @ExcelProperty(value = "自增长 ID")
    private Integer id;

    /**
     * 主机存放节点配置文件的根目录，可能存放多个节点配置
     */
    @ExcelProperty(value = "主机存放节点配置文件的根目录，可能存放多个节点配置")
    private String rootDir;

    /**
     * 远程登录用户
     */
    @ExcelProperty(value = "远程登录用户")
    private String user;

    /**
     * 主机IP
     */
    @ExcelProperty(value = "主机IP")
    private String ip;

    /**
     * 远程ssh端口
     */
    @ExcelProperty(value = "远程ssh端口")
    private Integer port;

    /**
     * 主机状态：0，新建；1，初始化；2，运行等等
     */
    @ExcelProperty(value = "主机状态：0，新建；1，初始化；2，运行等等")
    private Byte status;

    /**
     * remark
     */
    @ExcelProperty(value = "remark")
    private String remark;


}
