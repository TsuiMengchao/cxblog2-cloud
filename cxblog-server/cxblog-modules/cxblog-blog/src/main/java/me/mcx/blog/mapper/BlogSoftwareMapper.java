package me.mcx.blog.mapper;

import java.util.List;
import me.mcx.blog.domain.BlogSoftware;

/**
 * 开源软件Mapper接口
 * 
 * @author mcx
 * @date 2024-04-29
 */
public interface BlogSoftwareMapper 
{
    /**
     * 查询开源软件
     * 
     * @param id 开源软件主键
     * @return 开源软件
     */
    public BlogSoftware selectBlogSoftwareById(Long id);

    /**
     * 查询开源软件列表
     * 
     * @param blogSoftware 开源软件
     * @return 开源软件集合
     */
    public List<BlogSoftware> selectBlogSoftwareList(BlogSoftware blogSoftware);

    /**
     * 新增开源软件
     * 
     * @param blogSoftware 开源软件
     * @return 结果
     */
    public int insertBlogSoftware(BlogSoftware blogSoftware);

    /**
     * 修改开源软件
     * 
     * @param blogSoftware 开源软件
     * @return 结果
     */
    public int updateBlogSoftware(BlogSoftware blogSoftware);

    /**
     * 删除开源软件
     * 
     * @param id 开源软件主键
     * @return 结果
     */
    public int deleteBlogSoftwareById(Long id);

    /**
     * 批量删除开源软件
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteBlogSoftwareByIds(Long[] ids);
}
