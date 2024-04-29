package me.mcx.blog.controller.admin;

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
import me.mcx.blog.domain.BlogUserUserinfo;
import me.mcx.blog.service.IBlogUserUserinfoService;
import me.mcx.common.core.web.controller.BaseController;
import me.mcx.common.core.web.domain.AjaxResult;
import me.mcx.common.core.utils.poi.ExcelUtil;
import me.mcx.common.core.web.page.TableDataInfo;

/**
 * 用户与用户信息Controller
 * 
 * @author mcx
 * @date 2024-04-29
 */
@RestController
@RequestMapping("/userUserinfo")
public class BlogUserUserinfoController extends BaseController
{
    @Autowired
    private IBlogUserUserinfoService blogUserUserinfoService;

    /**
     * 查询用户与用户信息列表
     */
    @RequiresPermissions("blog:userUserinfo:list")
    @GetMapping("/list")
    public TableDataInfo list(BlogUserUserinfo blogUserUserinfo)
    {
        startPage();
        List<BlogUserUserinfo> list = blogUserUserinfoService.selectBlogUserUserinfoList(blogUserUserinfo);
        return getDataTable(list);
    }

    /**
     * 导出用户与用户信息列表
     */
    @RequiresPermissions("blog:userUserinfo:export")
    @Log(title = "用户与用户信息", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, BlogUserUserinfo blogUserUserinfo)
    {
        List<BlogUserUserinfo> list = blogUserUserinfoService.selectBlogUserUserinfoList(blogUserUserinfo);
        ExcelUtil<BlogUserUserinfo> util = new ExcelUtil<BlogUserUserinfo>(BlogUserUserinfo.class);
        util.exportExcel(response, list, "用户与用户信息数据");
    }

    /**
     * 获取用户与用户信息详细信息
     */
    @RequiresPermissions("blog:userUserinfo:query")
    @GetMapping(value = "/{userId}")
    public AjaxResult getInfo(@PathVariable("userId") Long userId)
    {
        return success(blogUserUserinfoService.selectBlogUserUserinfoByUserId(userId));
    }

    /**
     * 新增用户与用户信息
     */
    @RequiresPermissions("blog:userUserinfo:add")
    @Log(title = "用户与用户信息", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody BlogUserUserinfo blogUserUserinfo)
    {
        return toAjax(blogUserUserinfoService.insertBlogUserUserinfo(blogUserUserinfo));
    }

    /**
     * 修改用户与用户信息
     */
    @RequiresPermissions("blog:userUserinfo:edit")
    @Log(title = "用户与用户信息", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody BlogUserUserinfo blogUserUserinfo)
    {
        return toAjax(blogUserUserinfoService.updateBlogUserUserinfo(blogUserUserinfo));
    }

    /**
     * 删除用户与用户信息
     */
    @RequiresPermissions("blog:userUserinfo:remove")
    @Log(title = "用户与用户信息", businessType = BusinessType.DELETE)
	@DeleteMapping("/{userIds}")
    public AjaxResult remove(@PathVariable Long[] userIds)
    {
        return toAjax(blogUserUserinfoService.deleteBlogUserUserinfoByUserIds(userIds));
    }
}
