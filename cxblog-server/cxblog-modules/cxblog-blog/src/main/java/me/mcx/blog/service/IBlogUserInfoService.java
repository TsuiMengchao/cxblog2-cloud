package me.mcx.blog.service;

import java.util.List;
import me.mcx.blog.domain.BlogUserInfo;

/**
 * 用户信息Service接口
 * 
 * @author mcx
 * @date 2024-04-28
 */
public interface IBlogUserInfoService 
{
    /**
     * 查询用户信息
     * 
     * @param id 用户信息主键
     * @return 用户信息
     */
    public BlogUserInfo selectBlogUserInfoById(Long id);

    /**
     * 查询用户信息列表
     * 
     * @param blogUserInfo 用户信息
     * @return 用户信息集合
     */
    public List<BlogUserInfo> selectBlogUserInfoList(BlogUserInfo blogUserInfo);

    /**
     * 新增用户信息
     * 
     * @param blogUserInfo 用户信息
     * @return 结果
     */
    public int insertBlogUserInfo(BlogUserInfo blogUserInfo);

    /**
     * 修改用户信息
     * 
     * @param blogUserInfo 用户信息
     * @return 结果
     */
    public int updateBlogUserInfo(BlogUserInfo blogUserInfo);

    /**
     * 批量删除用户信息
     * 
     * @param ids 需要删除的用户信息主键集合
     * @return 结果
     */
    public int deleteBlogUserInfoByIds(Long[] ids);

    /**
     * 删除用户信息信息
     * 
     * @param id 用户信息主键
     * @return 结果
     */
    public int deleteBlogUserInfoById(Long id);
}
