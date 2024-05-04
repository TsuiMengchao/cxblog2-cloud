package me.mcx.blog.service.web.impl;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import me.mcx.blog.domain.BlogArticle;
import me.mcx.blog.domain.BlogArticleCollect;
import me.mcx.blog.domain.BlogFollowed;
import me.mcx.blog.domain.BlogUserUserinfo;
import me.mcx.blog.domain.dto.user.UserInfoDTO;
import me.mcx.blog.domain.vo.user.UserInfoVO;
import me.mcx.blog.mapper.BlogArticleCollectMapper;
import me.mcx.blog.mapper.BlogArticleMapper;
import me.mcx.blog.mapper.BlogFollowedMapper;
import me.mcx.blog.mapper.BlogUserUserinfoMapper;
import me.mcx.blog.mapper.web.UserInfoMapper;
import me.mcx.blog.mapper.web.UserMapper;
import me.mcx.blog.service.web.ApiUserService;
import me.mcx.common.security.utils.SecurityUtils;
import me.mcx.common.core.exception.ServiceException;
import me.mcx.common.core.web.domain.AjaxResult;
import org.apache.commons.lang3.ObjectUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Slf4j
@Service
@RequiredArgsConstructor
public class ApiUserServiceImpl implements ApiUserService {

    private final UserMapper userMapper;

    private final BlogUserUserinfoMapper blogUserUserinfoMapper;

    private final BlogArticleMapper articleMapper;

    private final BlogArticleCollectMapper collectMapper;

    private final UserInfoMapper userInfoMapper;

    private final BlogFollowedMapper followedMapper;

    private final String[] userAvatarList = {"http://img.shiyit.com/avatars/buxie.png","http://img.shiyit.com/avatars/daizhi.png",
            "http://img.shiyit.com/avatars/fennu.png","http://img.shiyit.com/avatars/jingxi.png","http://img.shiyit.com/avatars/kaixin.png",
            "http://img.shiyit.com/avatars/shuanshuai.png"};


    /**
     * 获取用户信息
     *
     * @return
     */
    @Override
    public AjaxResult selectUserInfo(String userId) {
        userId = StringUtils.isNotBlank(userId) ? userId : SecurityUtils.getLoginIdAsString();
        UserInfoVO userInfo = userInfoMapper.selectUserInfoByUserId(userId);
        return AjaxResult.success(userInfo);
    }

    /**
     * 修改用户信息
     *
     * @param vo
     * @return
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public AjaxResult updateUser(UserInfoDTO vo) {
        BlogUserUserinfo user = blogUserUserinfoMapper.selectBlogUserUserinfoByUserId(Long.valueOf(SecurityUtils.getLoginIdAsString()));
        if (ObjectUtils.isEmpty(user)) {
            throw  new ServiceException("用户不存在");
        }
//        BlogUserInfo userInfo = BeanCopyUtil.copyObject(vo, BlogUserInfo.class);
//        userInfo.setId(user.getUserInfoId());
//        userInfoMapper.updateById(userInfo);
        return AjaxResult.success("修改信息成功");
    }

    /**
     * 根据token获取用户信息
     *
     * @param token
     * @return
     */
    @Override
    public AjaxResult selectUserInfoByToken(String token) {
        Object userId = SecurityUtils.getUserId();
        UserInfoVO userInfoVO = userMapper.selectInfoByUserIdNew(userId);
        return AjaxResult.success(userInfoVO);
    }

    @Override
    public AjaxResult getUserCount(String id) {
        id = StringUtils.isBlank(id) ? SecurityUtils.getLoginIdAsString() : id;
        String finalId = id;
        Integer articleCount = articleMapper.selectCount(new BlogArticle(){{setUserId(finalId);}});
        Integer collectCount = collectMapper.selectCount(new BlogArticleCollect(){{setUserId(finalId);}});
        Integer followedCount = followedMapper.selectCount(new BlogFollowed(){{setUserId(finalId);}});
        return AjaxResult.success().put("articleCount", articleCount).put("collectCount", collectCount)
                .put("followedCount", followedCount);
    }
}
