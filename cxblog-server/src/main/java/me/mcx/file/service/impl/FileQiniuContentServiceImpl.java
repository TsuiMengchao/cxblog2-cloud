package me.mcx.file.service.impl;

import java.util.List;
import me.mcx.common.core.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import me.mcx.file.mapper.FileQiniuContentMapper;
import me.mcx.file.domain.FileQiniuContent;
import me.mcx.file.service.IFileQiniuContentService;

/**
 * 七牛云文件存储Service业务层处理
 * 
 * @author mcx
 * @date 2024-05-03
 */
@Service
public class FileQiniuContentServiceImpl implements IFileQiniuContentService 
{
    @Autowired
    private FileQiniuContentMapper fileQiniuContentMapper;

    /**
     * 查询七牛云文件存储
     * 
     * @param contentId 七牛云文件存储主键
     * @return 七牛云文件存储
     */
    @Override
    public FileQiniuContent selectFileQiniuContentByContentId(Long contentId)
    {
        return fileQiniuContentMapper.selectFileQiniuContentByContentId(contentId);
    }

    /**
     * 查询七牛云文件存储列表
     * 
     * @param fileQiniuContent 七牛云文件存储
     * @return 七牛云文件存储
     */
    @Override
    public List<FileQiniuContent> selectFileQiniuContentList(FileQiniuContent fileQiniuContent)
    {
        return fileQiniuContentMapper.selectFileQiniuContentList(fileQiniuContent);
    }

    /**
     * 新增七牛云文件存储
     * 
     * @param fileQiniuContent 七牛云文件存储
     * @return 结果
     */
    @Override
    public int insertFileQiniuContent(FileQiniuContent fileQiniuContent)
    {
        return fileQiniuContentMapper.insertFileQiniuContent(fileQiniuContent);
    }

    /**
     * 修改七牛云文件存储
     * 
     * @param fileQiniuContent 七牛云文件存储
     * @return 结果
     */
    @Override
    public int updateFileQiniuContent(FileQiniuContent fileQiniuContent)
    {
        fileQiniuContent.setUpdateTime(DateUtils.getNowDate());
        return fileQiniuContentMapper.updateFileQiniuContent(fileQiniuContent);
    }

    /**
     * 批量删除七牛云文件存储
     * 
     * @param contentIds 需要删除的七牛云文件存储主键
     * @return 结果
     */
    @Override
    public int deleteFileQiniuContentByContentIds(Long[] contentIds)
    {
        return fileQiniuContentMapper.deleteFileQiniuContentByContentIds(contentIds);
    }

    /**
     * 删除七牛云文件存储信息
     * 
     * @param contentId 七牛云文件存储主键
     * @return 结果
     */
    @Override
    public int deleteFileQiniuContentByContentId(Long contentId)
    {
        return fileQiniuContentMapper.deleteFileQiniuContentByContentId(contentId);
    }
}
