package me.mcx.blog.service.common;

import me.mcx.blog.domain.BlogSystemConfig;
import me.mcx.common.core.web.domain.AjaxResult;

/**
 * <p>
 * 系统配置表 服务类
 * </p>
 *
 * @author blue
 * @since 2021-11-25
 */
public interface SystemConfigService {

    /**
     * 获取系统配置
     * @return
     */
    AjaxResult getSystemConfig();

    /**
     * 修改
     * @param systemConfig
     * @return
     */
    AjaxResult updateSystemConfig(BlogSystemConfig systemConfig);

    /**
     *
     * @return
     */
    BlogSystemConfig getCustomizeOne();
}
