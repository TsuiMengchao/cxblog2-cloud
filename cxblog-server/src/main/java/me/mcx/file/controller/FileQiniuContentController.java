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
import me.mcx.file.domain.FileQiniuContent;
import me.mcx.file.service.IFileQiniuContentService;
import me.mcx.common.core.web.controller.BaseController;
import me.mcx.common.core.web.domain.AjaxResult;
import me.mcx.common.core.utils.poi.ExcelUtil;
import me.mcx.common.core.web.page.TableDataInfo;

/**
 * 七牛云文件存储Controller
 * 
 * @author mcx
 * @date 2024-05-03
 */
@RestController
@RequestMapping("/content")
public class FileQiniuContentController extends BaseController
{
    @Autowired
    private IFileQiniuContentService fileQiniuContentService;

    /**
     * 查询七牛云文件存储列表
     */
    @RequiresPermissions("file:content:list")
    @GetMapping("/list")
    public TableDataInfo list(FileQiniuContent fileQiniuContent)
    {
        startPage();
        List<FileQiniuContent> list = fileQiniuContentService.selectFileQiniuContentList(fileQiniuContent);
        return getDataTable(list);
    }

    /**
     * 导出七牛云文件存储列表
     */
    @RequiresPermissions("file:content:export")
    @Log(title = "七牛云文件存储", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, FileQiniuContent fileQiniuContent)
    {
        List<FileQiniuContent> list = fileQiniuContentService.selectFileQiniuContentList(fileQiniuContent);
        ExcelUtil<FileQiniuContent> util = new ExcelUtil<FileQiniuContent>(FileQiniuContent.class);
        util.exportExcel(response, list, "七牛云文件存储数据");
    }

    /**
     * 获取七牛云文件存储详细信息
     */
    @RequiresPermissions("file:content:query")
    @GetMapping(value = "/{contentId}")
    public AjaxResult getInfo(@PathVariable("contentId") Long contentId)
    {
        return success(fileQiniuContentService.selectFileQiniuContentByContentId(contentId));
    }

    /**
     * 新增七牛云文件存储
     */
    @RequiresPermissions("file:content:add")
    @Log(title = "七牛云文件存储", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody FileQiniuContent fileQiniuContent)
    {
        return toAjax(fileQiniuContentService.insertFileQiniuContent(fileQiniuContent));
    }

    /**
     * 修改七牛云文件存储
     */
    @RequiresPermissions("file:content:edit")
    @Log(title = "七牛云文件存储", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody FileQiniuContent fileQiniuContent)
    {
        return toAjax(fileQiniuContentService.updateFileQiniuContent(fileQiniuContent));
    }

    /**
     * 删除七牛云文件存储
     */
    @RequiresPermissions("file:content:remove")
    @Log(title = "七牛云文件存储", businessType = BusinessType.DELETE)
	@DeleteMapping("/{contentIds}")
    public AjaxResult remove(@PathVariable Long[] contentIds)
    {
        return toAjax(fileQiniuContentService.deleteFileQiniuContentByContentIds(contentIds));
    }
}
