package me.mcx.blog.service.common.impl;

import me.mcx.blog.common.Constants;
import me.mcx.blog.domain.BlogSystemConfig;
import me.mcx.blog.mapper.BlogSystemConfigMapper;
import me.mcx.blog.service.common.SystemConfigService;
import me.mcx.common.core.web.domain.AjaxResult;
import me.mcx.common.security.auth.AuthUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


/**
 * <p>
 * 系统配置表 服务实现类
 * </p>
 *
 * @author blue
 * @since 2021-11-25
 */
@Service
public class SystemConfigServiceImpl implements SystemConfigService {

    @Autowired
    private BlogSystemConfigMapper blogSystemConfigMapper;

    /**
     * 获取系统配置
     * @return
     */
    @Override
    public AjaxResult getSystemConfig() {

        BlogSystemConfig systemConfig = blogSystemConfigMapper.selectBlogSystemConfigById(1l);

        if (!AuthUtil.hasRole(Constants.ADMIN_CODE)){
            BlogSystemConfig data = new BlogSystemConfig() {{
                setId(systemConfig.getId());setOpenEmail(systemConfig.getOpenEmail());
                setOpenEmailActivate(systemConfig.getOpenEmailActivate());
                setStartEmailNotification(systemConfig.getStartEmailNotification());
                setFileUploadWay(systemConfig.getFileUploadWay());
                setDashboardNotification(systemConfig.getDashboardNotification());
                setDashboardNotificationMd(systemConfig.getDashboardNotificationMd());
                setOpenDashboardNotification(systemConfig.getOpenDashboardNotification());
                setSearchModel(systemConfig.getSearchModel());
                setLocalFileUrl(systemConfig.getLocalFileUrl());
                setEmailHost(systemConfig.getEmailHost());
                setEmailPort(systemConfig.getEmailPort());
            }};
        }

        return AjaxResult.success(systemConfig);
    }

    /**
     * 修改系统配置
     * @param systemConfig
     * @return
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public AjaxResult updateSystemConfig(BlogSystemConfig systemConfig) {
        blogSystemConfigMapper.updateBlogSystemConfig(systemConfig);
        return AjaxResult.success();
    }

    //---------自定义方法----------
    @Override
    public BlogSystemConfig getCustomizeOne() {
        return blogSystemConfigMapper.selectBlogSystemConfigById(1L);
    }
}
