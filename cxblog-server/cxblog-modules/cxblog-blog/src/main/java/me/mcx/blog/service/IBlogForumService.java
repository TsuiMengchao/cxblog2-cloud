package me.mcx.blog.service;

import java.util.List;
import me.mcx.blog.domain.BlogForum;

/**
 * 圈子话题Service接口
 * 
 * @author mcx
 * @date 2024-04-28
 */
public interface IBlogForumService 
{
    /**
     * 查询圈子话题
     * 
     * @param id 圈子话题主键
     * @return 圈子话题
     */
    public BlogForum selectBlogForumById(Long id);

    /**
     * 查询圈子话题列表
     * 
     * @param blogForum 圈子话题
     * @return 圈子话题集合
     */
    public List<BlogForum> selectBlogForumList(BlogForum blogForum);

    /**
     * 新增圈子话题
     * 
     * @param blogForum 圈子话题
     * @return 结果
     */
    public int insertBlogForum(BlogForum blogForum);

    /**
     * 修改圈子话题
     * 
     * @param blogForum 圈子话题
     * @return 结果
     */
    public int updateBlogForum(BlogForum blogForum);

    /**
     * 批量删除圈子话题
     * 
     * @param ids 需要删除的圈子话题主键集合
     * @return 结果
     */
    public int deleteBlogForumByIds(Long[] ids);

    /**
     * 删除圈子话题信息
     * 
     * @param id 圈子话题主键
     * @return 结果
     */
    public int deleteBlogForumById(Long id);
}
