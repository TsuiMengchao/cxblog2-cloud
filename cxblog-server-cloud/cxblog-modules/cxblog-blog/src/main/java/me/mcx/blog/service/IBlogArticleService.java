package me.mcx.blog.service;

import java.util.List;
import me.mcx.blog.domain.BlogArticle;
import me.mcx.common.core.web.domain.AjaxResult;

/**
 * 博客文章Service接口
 * 
 * @author mcx
 * @date 2024-04-28
 */
public interface IBlogArticleService 
{
    /**
     *  后台获取文章详情
     * @return
     */
    public AjaxResult selectArticleById(Long id);
    /**
     * 查询博客文章
     * 
     * @param id 博客文章主键
     * @return 博客文章
     */
    public BlogArticle selectBlogArticleById(Long id);

    /**
     * 查询博客文章列表
     * 
     * @param blogArticle 博客文章
     * @return 博客文章集合
     */
    public List<BlogArticle> selectBlogArticleList(BlogArticle blogArticle);

    /**
     * 新增博客文章
     * 
     * @param blogArticle 博客文章
     * @return 结果
     */
    public int insertBlogArticle(BlogArticle blogArticle);

    /**
     * 修改博客文章
     * 
     * @param blogArticle 博客文章
     * @return 结果
     */
    public int updateBlogArticle(BlogArticle blogArticle);

    /**
     * 批量删除博客文章
     * 
     * @param ids 需要删除的博客文章主键集合
     * @return 结果
     */
    public int deleteBlogArticleByIds(Long[] ids);

    /**
     * 删除博客文章信息
     * 
     * @param id 博客文章主键
     * @return 结果
     */
    public int deleteBlogArticleById(Long id);
}
