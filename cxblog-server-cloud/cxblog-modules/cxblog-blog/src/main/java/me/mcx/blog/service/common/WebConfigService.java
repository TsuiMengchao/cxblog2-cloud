package me.mcx.blog.service.common;

import me.mcx.blog.domain.BlogWebConfig;
import me.mcx.common.core.web.domain.AjaxResult;

/**
 * <p>
 * 网站配置表 服务类
 * </p>
 *
 * @author blue
 * @since 2021-11-27
 */
public interface WebConfigService {

    /**
     * 获取网站配置详情
     * @return
     */
    AjaxResult getWebConfig();

    /**
     * 修改
     * @param webConfig
     * @return
     */
    AjaxResult updateWebConfig(BlogWebConfig webConfig);
}
