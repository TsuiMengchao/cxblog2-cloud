package me.mcx.file.controller;

import java.util.List;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import me.mcx.common.log.annotation.Log;
import me.mcx.common.log.enums.BusinessType;
import me.mcx.common.security.annotation.RequiresPermissions;
import me.mcx.file.domain.FileQiniuConfig;
import me.mcx.file.service.IFileQiniuConfigService;
import me.mcx.common.core.web.controller.BaseController;
import me.mcx.common.core.web.domain.AjaxResult;
import me.mcx.common.core.utils.poi.ExcelUtil;
import me.mcx.common.core.web.page.TableDataInfo;

/**
 * 七牛云配置Controller
 * 
 * @author mcx
 * @date 2024-05-03
 */
@RestController
@RequestMapping("/config")
public class FileQiniuConfigController extends BaseController
{
    @Autowired
    private IFileQiniuConfigService fileQiniuConfigService;

    /**
     * 查询七牛云配置列表
     */
    @RequiresPermissions("file:config:list")
    @GetMapping("/list")
    public TableDataInfo list(FileQiniuConfig fileQiniuConfig)
    {
        startPage();
        List<FileQiniuConfig> list = fileQiniuConfigService.selectFileQiniuConfigList(fileQiniuConfig);
        return getDataTable(list);
    }

    /**
     * 导出七牛云配置列表
     */
    @RequiresPermissions("file:config:export")
    @Log(title = "七牛云配置", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, FileQiniuConfig fileQiniuConfig)
    {
        List<FileQiniuConfig> list = fileQiniuConfigService.selectFileQiniuConfigList(fileQiniuConfig);
        ExcelUtil<FileQiniuConfig> util = new ExcelUtil<FileQiniuConfig>(FileQiniuConfig.class);
        util.exportExcel(response, list, "七牛云配置数据");
    }

    /**
     * 获取七牛云配置详细信息
     */
    @RequiresPermissions("file:config:query")
    @GetMapping(value = "/{configId}")
    public AjaxResult getInfo(@PathVariable("configId") Long configId)
    {
        return success(fileQiniuConfigService.selectFileQiniuConfigByConfigId(configId));
    }

    /**
     * 新增七牛云配置
     */
    @RequiresPermissions("file:config:add")
    @Log(title = "七牛云配置", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody FileQiniuConfig fileQiniuConfig)
    {
        return toAjax(fileQiniuConfigService.insertFileQiniuConfig(fileQiniuConfig));
    }

    /**
     * 修改七牛云配置
     */
    @RequiresPermissions("file:config:edit")
    @Log(title = "七牛云配置", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody FileQiniuConfig fileQiniuConfig)
    {
        return toAjax(fileQiniuConfigService.updateFileQiniuConfig(fileQiniuConfig));
    }

    /**
     * 删除七牛云配置
     */
    @RequiresPermissions("file:config:remove")
    @Log(title = "七牛云配置", businessType = BusinessType.DELETE)
	@DeleteMapping("/{configIds}")
    public AjaxResult remove(@PathVariable Long[] configIds)
    {
        return toAjax(fileQiniuConfigService.deleteFileQiniuConfigByConfigIds(configIds));
    }
}
