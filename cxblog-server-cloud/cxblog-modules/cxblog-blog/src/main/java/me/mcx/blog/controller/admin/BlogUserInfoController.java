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
import me.mcx.blog.domain.BlogUserInfo;
import me.mcx.blog.service.IBlogUserInfoService;
import me.mcx.common.core.web.controller.BaseController;
import me.mcx.common.core.web.domain.AjaxResult;
import me.mcx.common.core.utils.poi.ExcelUtil;
import me.mcx.common.core.web.page.TableDataInfo;

/**
 * 用户信息Controller
 * 
 * @author mcx
 * @date 2024-04-28
 */
@RestController
@RequestMapping("/userInfo")
public class BlogUserInfoController extends BaseController
{
    @Autowired
    private IBlogUserInfoService blogUserInfoService;

    /**
     * 查询用户信息列表
     */
    @RequiresPermissions("blog:userInfo:list")
    @GetMapping("/list")
    public TableDataInfo list(BlogUserInfo blogUserInfo)
    {
        startPage();
        List<BlogUserInfo> list = blogUserInfoService.selectBlogUserInfoList(blogUserInfo);
        return getDataTable(list);
    }

    /**
     * 导出用户信息列表
     */
    @RequiresPermissions("blog:userInfo:export")
    @Log(title = "用户信息", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, BlogUserInfo blogUserInfo)
    {
        List<BlogUserInfo> list = blogUserInfoService.selectBlogUserInfoList(blogUserInfo);
        ExcelUtil<BlogUserInfo> util = new ExcelUtil<BlogUserInfo>(BlogUserInfo.class);
        util.exportExcel(response, list, "用户信息数据");
    }

    /**
     * 获取用户信息详细信息
     */
    @RequiresPermissions("blog:userInfo:query")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(blogUserInfoService.selectBlogUserInfoById(id));
    }

    /**
     * 新增用户信息
     */
    @RequiresPermissions("blog:userInfo:add")
    @Log(title = "用户信息", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody BlogUserInfo blogUserInfo)
    {
        return toAjax(blogUserInfoService.insertBlogUserInfo(blogUserInfo));
    }

    /**
     * 修改用户信息
     */
    @RequiresPermissions("blog:userInfo:edit")
    @Log(title = "用户信息", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody BlogUserInfo blogUserInfo)
    {
        return toAjax(blogUserInfoService.updateBlogUserInfo(blogUserInfo));
    }

    /**
     * 删除用户信息
     */
    @RequiresPermissions("blog:userInfo:remove")
    @Log(title = "用户信息", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(blogUserInfoService.deleteBlogUserInfoByIds(ids));
    }
}
