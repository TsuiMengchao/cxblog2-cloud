package me.mcx.blog.mapper;

import java.util.List;
import me.mcx.blog.domain.BlogImMessage;

/**
 * 即时消息Mapper接口
 * 
 * @author mcx
 * @date 2024-04-28
 */
public interface BlogImMessageMapper 
{
    /**
     * 查询即时消息
     * 
     * @param id 即时消息主键
     * @return 即时消息
     */
    public BlogImMessage selectBlogImMessageById(String id);

    /**
     * 查询即时消息列表
     * 
     * @param blogImMessage 即时消息
     * @return 即时消息集合
     */
    public List<BlogImMessage> selectBlogImMessageList(BlogImMessage blogImMessage);

    /**
     * 新增即时消息
     * 
     * @param blogImMessage 即时消息
     * @return 结果
     */
    public int insertBlogImMessage(BlogImMessage blogImMessage);

    /**
     * 修改即时消息
     * 
     * @param blogImMessage 即时消息
     * @return 结果
     */
    public int updateBlogImMessage(BlogImMessage blogImMessage);

    /**
     * 删除即时消息
     * 
     * @param id 即时消息主键
     * @return 结果
     */
    public int deleteBlogImMessageById(String id);

    /**
     * 批量删除即时消息
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteBlogImMessageByIds(String[] ids);
}
