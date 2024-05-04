package me.mcx.blog.service.common.impl;

import me.mcx.blog.common.Constants;
import me.mcx.blog.domain.BlogWebConfig;
import me.mcx.blog.mapper.BlogWebConfigMapper;
import me.mcx.blog.service.common.WebConfigService;
import me.mcx.common.core.web.domain.AjaxResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * <p>
 * 网站配置表 服务实现类
 * </p>
 *
 * @author blue
 * @since 2021-11-27
 */
@Service
public class WebConfigServiceImpl implements WebConfigService {
    @Autowired
    private BlogWebConfigMapper baseMapper;
    /**
     * 网站配置
     * @return
     */
    @Override
    public AjaxResult getWebConfig() {
        BlogWebConfig webConfig = baseMapper.selectBlogWebConfigById(1L);
        return AjaxResult.success(webConfig);
    }

    /**
     * 修改网站配置
     * @param webConfig
     * @return
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public AjaxResult updateWebConfig(BlogWebConfig webConfig) {
        baseMapper.updateBlogWebConfig(webConfig);
        return AjaxResult.success();
    }
}
