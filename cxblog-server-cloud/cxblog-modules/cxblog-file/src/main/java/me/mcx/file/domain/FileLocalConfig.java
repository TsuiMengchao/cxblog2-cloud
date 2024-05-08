package me.mcx.file.domain;

import me.mcx.common.core.annotation.Excel;
import me.mcx.common.core.web.domain.BaseEntity;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

/**
 * 本地配置对象 file_local_config
 * 
 * @author mcx
 * @date 2024-05-08
 */
public class FileLocalConfig extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** ID */
    private Long configId;

    /** 外链域名 */
    @Excel(name = "外链域名")
    private String localFileUrl;

    public void setConfigId(Long configId) 
    {
        this.configId = configId;
    }

    public Long getConfigId() 
    {
        return configId;
    }
    public void setLocalFileUrl(String localFileUrl) 
    {
        this.localFileUrl = localFileUrl;
    }

    public String getLocalFileUrl() 
    {
        return localFileUrl;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("configId", getConfigId())
            .append("localFileUrl", getLocalFileUrl())
            .toString();
    }
}
