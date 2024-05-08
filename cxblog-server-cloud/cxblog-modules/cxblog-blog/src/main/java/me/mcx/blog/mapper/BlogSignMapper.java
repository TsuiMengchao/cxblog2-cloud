package me.mcx.blog.mapper;

import java.util.List;
import me.mcx.blog.domain.BlogSign;

/**
 * 签到Mapper接口
 * 
 * @author mcx
 * @date 2024-04-28
 */
public interface BlogSignMapper 
{
    /**
     * 查询签到
     * 
     * @param id 签到主键
     * @return 签到
     */
    public BlogSign selectBlogSignById(String id);

    /**
     * 查询签到列表
     * 
     * @param blogSign 签到
     * @return 签到集合
     */
    public List<BlogSign> selectBlogSignList(BlogSign blogSign);

    /**
     * 新增签到
     * 
     * @param blogSign 签到
     * @return 结果
     */
    public int insertBlogSign(BlogSign blogSign);

    /**
     * 修改签到
     * 
     * @param blogSign 签到
     * @return 结果
     */
    public int updateBlogSign(BlogSign blogSign);

    /**
     * 删除签到
     * 
     * @param id 签到主键
     * @return 结果
     */
    public int deleteBlogSignById(String id);

    /**
     * 批量删除签到
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteBlogSignByIds(String[] ids);
}
