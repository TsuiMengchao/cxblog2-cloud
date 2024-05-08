package me.mcx.blog.service;

import java.util.List;
import me.mcx.blog.domain.BlogUserUserinfo;

/**
 * 用户与用户信息Service接口
 * 
 * @author mcx
 * @date 2024-04-29
 */
public interface IBlogUserUserinfoService 
{
    /**
     * 查询用户与用户信息
     * 
     * @param userId 用户与用户信息主键
     * @return 用户与用户信息
     */
    public BlogUserUserinfo selectBlogUserUserinfoByUserId(Long userId);

    /**
     * 查询用户与用户信息列表
     * 
     * @param blogUserUserinfo 用户与用户信息
     * @return 用户与用户信息集合
     */
    public List<BlogUserUserinfo> selectBlogUserUserinfoList(BlogUserUserinfo blogUserUserinfo);

    /**
     * 新增用户与用户信息
     * 
     * @param blogUserUserinfo 用户与用户信息
     * @return 结果
     */
    public int insertBlogUserUserinfo(BlogUserUserinfo blogUserUserinfo);

    /**
     * 修改用户与用户信息
     * 
     * @param blogUserUserinfo 用户与用户信息
     * @return 结果
     */
    public int updateBlogUserUserinfo(BlogUserUserinfo blogUserUserinfo);

    /**
     * 批量删除用户与用户信息
     * 
     * @param userIds 需要删除的用户与用户信息主键集合
     * @return 结果
     */
    public int deleteBlogUserUserinfoByUserIds(Long[] userIds);

    /**
     * 删除用户与用户信息信息
     * 
     * @param userId 用户与用户信息主键
     * @return 结果
     */
    public int deleteBlogUserUserinfoByUserId(Long userId);
}
