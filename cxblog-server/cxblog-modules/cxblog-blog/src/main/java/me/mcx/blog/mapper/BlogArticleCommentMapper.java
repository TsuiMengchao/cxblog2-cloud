package me.mcx.blog.mapper;

import java.util.List;
import me.mcx.blog.domain.BlogArticleComment;

/**
 * 评论Mapper接口
 * 
 * @author mcx
 * @date 2024-04-28
 */
public interface BlogArticleCommentMapper 
{
    /**
     * 查询评论
     * 
     * @param id 评论主键
     * @return 评论
     */
    public BlogArticleComment selectBlogArticleCommentById(Long id);

    /**
     * 查询评论列表
     * 
     * @param blogArticleComment 评论
     * @return 评论集合
     */
    public List<BlogArticleComment> selectBlogArticleCommentList(BlogArticleComment blogArticleComment);

    /**
     * 新增评论
     * 
     * @param blogArticleComment 评论
     * @return 结果
     */
    public int insertBlogArticleComment(BlogArticleComment blogArticleComment);

    /**
     * 修改评论
     * 
     * @param blogArticleComment 评论
     * @return 结果
     */
    public int updateBlogArticleComment(BlogArticleComment blogArticleComment);

    /**
     * 删除评论
     * 
     * @param id 评论主键
     * @return 结果
     */
    public int deleteBlogArticleCommentById(Long id);

    /**
     * 批量删除评论
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteBlogArticleCommentByIds(Long[] ids);

    Integer selectCount(BlogArticleComment blogArticleComment);
}
