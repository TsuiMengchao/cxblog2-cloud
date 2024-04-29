package me.mcx.blog.mapper;

import java.util.List;
import me.mcx.blog.domain.BlogUserInfo;

/**
 * 用户信息Mapper接口
 * 
 * @author mcx
 * @date 2024-04-28
 */
public interface BlogUserInfoMapper 
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
     * 删除用户信息
     * 
     * @param id 用户信息主键
     * @return 结果
     */
    public int deleteBlogUserInfoById(Long id);

    /**
     * 批量删除用户信息
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteBlogUserInfoByIds(Long[] ids);
}
