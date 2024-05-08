package me.mcx.blog.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import me.mcx.blog.mapper.BlogUserUserinfoMapper;
import me.mcx.blog.domain.BlogUserUserinfo;
import me.mcx.blog.service.IBlogUserUserinfoService;

/**
 * 用户与用户信息Service业务层处理
 * 
 * @author mcx
 * @date 2024-04-29
 */
@Service
public class BlogUserUserinfoServiceImpl implements IBlogUserUserinfoService 
{
    @Autowired
    private BlogUserUserinfoMapper blogUserUserinfoMapper;

    /**
     * 查询用户与用户信息
     * 
     * @param userId 用户与用户信息主键
     * @return 用户与用户信息
     */
    @Override
    public BlogUserUserinfo selectBlogUserUserinfoByUserId(Long userId)
    {
        return blogUserUserinfoMapper.selectBlogUserUserinfoByUserId(userId);
    }

    /**
     * 查询用户与用户信息列表
     * 
     * @param blogUserUserinfo 用户与用户信息
     * @return 用户与用户信息
     */
    @Override
    public List<BlogUserUserinfo> selectBlogUserUserinfoList(BlogUserUserinfo blogUserUserinfo)
    {
        return blogUserUserinfoMapper.selectBlogUserUserinfoList(blogUserUserinfo);
    }

    /**
     * 新增用户与用户信息
     * 
     * @param blogUserUserinfo 用户与用户信息
     * @return 结果
     */
    @Override
    public int insertBlogUserUserinfo(BlogUserUserinfo blogUserUserinfo)
    {
        return blogUserUserinfoMapper.insertBlogUserUserinfo(blogUserUserinfo);
    }

    /**
     * 修改用户与用户信息
     * 
     * @param blogUserUserinfo 用户与用户信息
     * @return 结果
     */
    @Override
    public int updateBlogUserUserinfo(BlogUserUserinfo blogUserUserinfo)
    {
        return blogUserUserinfoMapper.updateBlogUserUserinfo(blogUserUserinfo);
    }

    /**
     * 批量删除用户与用户信息
     * 
     * @param userIds 需要删除的用户与用户信息主键
     * @return 结果
     */
    @Override
    public int deleteBlogUserUserinfoByUserIds(Long[] userIds)
    {
        return blogUserUserinfoMapper.deleteBlogUserUserinfoByUserIds(userIds);
    }

    /**
     * 删除用户与用户信息信息
     * 
     * @param userId 用户与用户信息主键
     * @return 结果
     */
    @Override
    public int deleteBlogUserUserinfoByUserId(Long userId)
    {
        return blogUserUserinfoMapper.deleteBlogUserUserinfoByUserId(userId);
    }
}
