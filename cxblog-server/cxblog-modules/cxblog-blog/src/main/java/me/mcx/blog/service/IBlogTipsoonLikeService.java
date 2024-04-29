package me.mcx.blog.service;

import java.util.List;
import me.mcx.blog.domain.BlogTipsoonLike;

/**
 * 简讯点赞Service接口
 * 
 * @author mcx
 * @date 2024-04-28
 */
public interface IBlogTipsoonLikeService 
{
    /**
     * 查询简讯点赞
     * 
     * @param id 简讯点赞主键
     * @return 简讯点赞
     */
    public BlogTipsoonLike selectBlogTipsoonLikeById(Long id);

    /**
     * 查询简讯点赞列表
     * 
     * @param blogTipsoonLike 简讯点赞
     * @return 简讯点赞集合
     */
    public List<BlogTipsoonLike> selectBlogTipsoonLikeList(BlogTipsoonLike blogTipsoonLike);

    /**
     * 新增简讯点赞
     * 
     * @param blogTipsoonLike 简讯点赞
     * @return 结果
     */
    public int insertBlogTipsoonLike(BlogTipsoonLike blogTipsoonLike);

    /**
     * 修改简讯点赞
     * 
     * @param blogTipsoonLike 简讯点赞
     * @return 结果
     */
    public int updateBlogTipsoonLike(BlogTipsoonLike blogTipsoonLike);

    /**
     * 批量删除简讯点赞
     * 
     * @param ids 需要删除的简讯点赞主键集合
     * @return 结果
     */
    public int deleteBlogTipsoonLikeByIds(Long[] ids);

    /**
     * 删除简讯点赞信息
     * 
     * @param id 简讯点赞主键
     * @return 结果
     */
    public int deleteBlogTipsoonLikeById(Long id);
}
