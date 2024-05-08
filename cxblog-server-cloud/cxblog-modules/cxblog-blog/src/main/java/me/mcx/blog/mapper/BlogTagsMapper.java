package me.mcx.blog.mapper;

import java.util.List;
import me.mcx.blog.domain.BlogTags;

/**
 * 博客标签Mapper接口
 * 
 * @author mcx
 * @date 2024-04-28
 */
public interface BlogTagsMapper 
{
    /**
     * 查询博客标签
     * 
     * @param id 博客标签主键
     * @return 博客标签
     */
    public BlogTags selectBlogTagsById(Long id);

    /**
     * 查询博客标签列表
     * 
     * @param blogTags 博客标签
     * @return 博客标签集合
     */
    public List<BlogTags> selectBlogTagsList(BlogTags blogTags);

    /**
     * 新增博客标签
     * 
     * @param blogTags 博客标签
     * @return 结果
     */
    public int insertBlogTags(BlogTags blogTags);

    /**
     * 修改博客标签
     * 
     * @param blogTags 博客标签
     * @return 结果
     */
    public int updateBlogTags(BlogTags blogTags);

    /**
     * 删除博客标签
     * 
     * @param id 博客标签主键
     * @return 结果
     */
    public int deleteBlogTagsById(Long id);

    /**
     * 批量删除博客标签
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteBlogTagsByIds(Long[] ids);
}
