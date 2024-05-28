package com.webank.host.mapper;

import com.webank.common.mybatis.annotation.DataColumn;
import com.webank.common.mybatis.annotation.DataPermission;
import com.webank.common.mybatis.core.mapper.BaseMapperPlus;
import com.webank.host.domain.Host;
import com.webank.host.domain.vo.HostVo;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

/**
 * 物理主机信息Mapper接口
 *
 * @author webase
 * @date 2023-09-07
 */
@DataPermission({
    @DataColumn(key = "deptName", value = "dept_id"),
    @DataColumn(key = "userName", value = "user_id")
})
public interface HostMapper extends BaseMapperPlus<HostMapper, Host, HostVo> {
    @Select({
        "select * ",
        "from host",
        "where ip = #{ip,jdbcType=VARCHAR}"
    })
    Host getByIp(@Param("ip") String ip);
}
