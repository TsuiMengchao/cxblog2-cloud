package me.mcx.file.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import me.mcx.file.mapper.FileQiniuConfigMapper;
import me.mcx.file.domain.FileQiniuConfig;
import me.mcx.file.service.IFileQiniuConfigService;

/**
 * 七牛云配置Service业务层处理
 * 
 * @author mcx
 * @date 2024-05-03
 */
@Service
public class FileQiniuConfigServiceImpl implements IFileQiniuConfigService 
{
    @Autowired
    private FileQiniuConfigMapper fileQiniuConfigMapper;

    /**
     * 查询七牛云配置
     * 
     * @param configId 七牛云配置主键
     * @return 七牛云配置
     */
    @Override
    public FileQiniuConfig selectFileQiniuConfigByConfigId(Long configId)
    {
        return fileQiniuConfigMapper.selectFileQiniuConfigByConfigId(configId);
    }

    /**
     * 查询七牛云配置列表
     * 
     * @param fileQiniuConfig 七牛云配置
     * @return 七牛云配置
     */
    @Override
    public List<FileQiniuConfig> selectFileQiniuConfigList(FileQiniuConfig fileQiniuConfig)
    {
        return fileQiniuConfigMapper.selectFileQiniuConfigList(fileQiniuConfig);
    }

    /**
     * 新增七牛云配置
     * 
     * @param fileQiniuConfig 七牛云配置
     * @return 结果
     */
    @Override
    public int insertFileQiniuConfig(FileQiniuConfig fileQiniuConfig)
    {
        return fileQiniuConfigMapper.insertFileQiniuConfig(fileQiniuConfig);
    }

    /**
     * 修改七牛云配置
     * 
     * @param fileQiniuConfig 七牛云配置
     * @return 结果
     */
    @Override
    public int updateFileQiniuConfig(FileQiniuConfig fileQiniuConfig)
    {
        return fileQiniuConfigMapper.updateFileQiniuConfig(fileQiniuConfig);
    }

    /**
     * 批量删除七牛云配置
     * 
     * @param configIds 需要删除的七牛云配置主键
     * @return 结果
     */
    @Override
    public int deleteFileQiniuConfigByConfigIds(Long[] configIds)
    {
        return fileQiniuConfigMapper.deleteFileQiniuConfigByConfigIds(configIds);
    }

    /**
     * 删除七牛云配置信息
     * 
     * @param configId 七牛云配置主键
     * @return 结果
     */
    @Override
    public int deleteFileQiniuConfigByConfigId(Long configId)
    {
        return fileQiniuConfigMapper.deleteFileQiniuConfigByConfigId(configId);
    }
}
