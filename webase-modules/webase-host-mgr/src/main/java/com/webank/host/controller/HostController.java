package com.webank.host.controller;

import cn.dev33.satoken.annotation.SaCheckPermission;
import com.webank.common.core.domain.R;
import com.webank.common.core.utils.BeanCopyUtils;
import com.webank.common.core.validate.AddGroup;
import com.webank.common.core.web.controller.BaseController;
import com.webank.common.excel.utils.ExcelUtil;
import com.webank.common.log.annotation.Log;
import com.webank.common.log.enums.BusinessType;
import com.webank.common.mybatis.core.page.PageQuery;
import com.webank.common.mybatis.core.page.TableDataInfo;
import com.webank.host.domain.bo.HostBo;
import com.webank.host.domain.dto.HostDTO;
import com.webank.host.domain.vo.HostVo;
import com.webank.host.service.IHostService;
import lombok.RequiredArgsConstructor;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import java.util.Arrays;
import java.util.List;

/**
 * 主机管理
 * 前端访问路由地址为:/host-mgr/host
 *
 * @author webase
 * @date 2023-09-07
 */
@Validated
@RequiredArgsConstructor
@RestController
@RequestMapping("/host")
public class HostController extends BaseController {

    private final IHostService iSysHostService;

    /**
     * 查询主机列表
     */
    @SaCheckPermission("host:list")
    @GetMapping("/list")
    public TableDataInfo<HostVo> list(HostBo bo, PageQuery pageQuery) {
        return iSysHostService.queryPageList(bo, pageQuery);
    }

    /**
     * 新增主机信息
     */
    @SaCheckPermission("host:add")
    @Log(title = "主机管理", businessType = BusinessType.INSERT)
    @PostMapping()
    public R<Void> add(@Validated(AddGroup.class) @RequestBody HostDTO dto) {
        HostBo bo = new HostBo();
        BeanCopyUtils.copy(dto, bo);
        return toAjax(iSysHostService.insertByBo(bo));
    }

    /**
     * 导出主机信息列表
     */
    @SaCheckPermission("host:list")
    @Log(title = "主机管理", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HostBo bo, HttpServletResponse response) {
        List<HostVo> list = iSysHostService.queryList(bo);
        ExcelUtil.exportExcel(list, "主机信息", HostVo.class, response);
    }

//    /**
//     * 修改主机信息
//     */
//    @SaCheckPermission("host-mgr:host:edit")
//    @Log(title = "主机信息", businessType = BusinessType.UPDATE)
//    @PutMapping()
//    public R<Void> edit(@Validated(EditGroup.class) @RequestBody HostBo bo) {
//        return toAjax(iSysHostService.updateByBo(bo));
//    }

    /**
     * 删除主机信息
     *
     * @param ids 主键串
     */
    @SaCheckPermission("host:delete")
    @Log(title = "主机管理", businessType = BusinessType.DELETE)
    @PostMapping("/{ids}")
    public R<Void> remove(@NotEmpty(message = "主键不能为空") @PathVariable Long[] ids) {
        return toAjax(iSysHostService.deleteWithValidByIds(Arrays.asList(ids), true));
    }

    /**
     * 获取主机详细信息
     *
     * @param id 主键
     */
    @SaCheckPermission("host:list")
    @GetMapping("/{id}")
    public R<HostVo> getInfo(@NotNull(message = "主键不能为空") @PathVariable Integer id) {
        return R.ok(iSysHostService.queryById(id));
    }

    /**
     * 获取部署主机的公钥信息
     *
     */
    @SaCheckPermission("host:list")
    @GetMapping("/sshRsa")
    public R<HostVo> getSSHRsa() {
        return R.ok(iSysHostService.getSSHRsa());
    }
}
