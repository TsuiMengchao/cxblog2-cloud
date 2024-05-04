package me.mcx.file.service;

import java.util.List;
import me.mcx.file.domain.FileQiniuContent;

/**
 * 七牛云文件存储Service接口
 * 
 * @author mcx
 * @date 2024-05-03
 */
public interface IFileQiniuContentService 
{
    /**
     * 查询七牛云文件存储
     * 
     * @param contentId 七牛云文件存储主键
     * @return 七牛云文件存储
     */
    public FileQiniuContent selectFileQiniuContentByContentId(Long contentId);

    /**
     * 查询七牛云文件存储列表
     * 
     * @param fileQiniuContent 七牛云文件存储
     * @return 七牛云文件存储集合
     */
    public List<FileQiniuContent> selectFileQiniuContentList(FileQiniuContent fileQiniuContent);

    /**
     * 新增七牛云文件存储
     * 
     * @param fileQiniuContent 七牛云文件存储
     * @return 结果
     */
    public int insertFileQiniuContent(FileQiniuContent fileQiniuContent);

    /**
     * 修改七牛云文件存储
     * 
     * @param fileQiniuContent 七牛云文件存储
     * @return 结果
     */
    public int updateFileQiniuContent(FileQiniuContent fileQiniuContent);

    /**
     * 批量删除七牛云文件存储
     * 
     * @param contentIds 需要删除的七牛云文件存储主键集合
     * @return 结果
     */
    public int deleteFileQiniuContentByContentIds(Long[] contentIds);

    /**
     * 删除七牛云文件存储信息
     * 
     * @param contentId 七牛云文件存储主键
     * @return 结果
     */
    public int deleteFileQiniuContentByContentId(Long contentId);
}
