package me.mcx.blog.service.impl;

import java.util.List;
import me.mcx.common.core.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import me.mcx.blog.mapper.BlogUserInfoMapper;
import me.mcx.blog.domain.BlogUserInfo;
import me.mcx.blog.service.IBlogUserInfoService;

/**
 * 用户信息Service业务层处理
 * 
 * @author mcx
 * @date 2024-04-28
 */
@Service
public class BlogUserInfoServiceImpl implements IBlogUserInfoService 
{
    @Autowired
    private BlogUserInfoMapper blogUserInfoMapper;

    /**
     * 查询用户信息
     * 
     * @param id 用户信息主键
     * @return 用户信息
     */
    @Override
    public BlogUserInfo selectBlogUserInfoById(Long id)
    {
        return blogUserInfoMapper.selectBlogUserInfoById(id);
    }

    /**
     * 查询用户信息列表
     * 
     * @param blogUserInfo 用户信息
     * @return 用户信息
     */
    @Override
    public List<BlogUserInfo> selectBlogUserInfoList(BlogUserInfo blogUserInfo)
    {
        return blogUserInfoMapper.selectBlogUserInfoList(blogUserInfo);
    }

    /**
     * 新增用户信息
     * 
     * @param blogUserInfo 用户信息
     * @return 结果
     */
    @Override
    public int insertBlogUserInfo(BlogUserInfo blogUserInfo)
    {
        blogUserInfo.setCreateTime(DateUtils.getNowDate());
        return blogUserInfoMapper.insertBlogUserInfo(blogUserInfo);
    }

    /**
     * 修改用户信息
     * 
     * @param blogUserInfo 用户信息
     * @return 结果
     */
    @Override
    public int updateBlogUserInfo(BlogUserInfo blogUserInfo)
    {
        blogUserInfo.setUpdateTime(DateUtils.getNowDate());
        return blogUserInfoMapper.updateBlogUserInfo(blogUserInfo);
    }

    /**
     * 批量删除用户信息
     * 
     * @param ids 需要删除的用户信息主键
     * @return 结果
     */
    @Override
    public int deleteBlogUserInfoByIds(Long[] ids)
    {
        return blogUserInfoMapper.deleteBlogUserInfoByIds(ids);
    }

    /**
     * 删除用户信息信息
     * 
     * @param id 用户信息主键
     * @return 结果
     */
    @Override
    public int deleteBlogUserInfoById(Long id)
    {
        return blogUserInfoMapper.deleteBlogUserInfoById(id);
    }
}
