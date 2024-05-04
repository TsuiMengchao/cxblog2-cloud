package me.mcx.blog.service.web.impl;

import me.mcx.blog.common.RedisConstants;
import me.mcx.blog.common.ResultCode;
import me.mcx.blog.domain.BlogSay;
import me.mcx.blog.domain.BlogSayComment;
import me.mcx.blog.domain.vo.say.ApiSayCommentVO;
import me.mcx.blog.domain.vo.say.ApiSayVO;
import me.mcx.blog.domain.vo.user.UserInfoVO;
import me.mcx.blog.handle.RelativeDateFormat;
import me.mcx.blog.mapper.BlogSayCommentMapper;
import me.mcx.blog.mapper.BlogSayMapper;
import me.mcx.blog.mapper.web.SayMapper;
import me.mcx.blog.mapper.web.UserMapper;
import me.mcx.blog.service.web.ApiSayService;
import me.mcx.blog.service.common.RedisService;
import me.mcx.common.security.utils.SecurityUtils;
import me.mcx.common.core.exception.ServiceException;
import me.mcx.common.core.web.domain.AjaxResult;
import me.mcx.common.security.auth.AuthUtil;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import me.mcx.common.core.utils.ip.IpUtils;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;


@Service
public class ApiSayServiceImpl implements ApiSayService {

    @Autowired
    private SayMapper sayMapper;

    @Autowired
    private BlogSayMapper blogSayMapper;

    @Autowired
    private RedisService redisService;

    @Autowired
    private UserMapper userMapper;

    @Autowired
    private BlogSayCommentMapper sayCommentMapper;


    @Override
    public List<ApiSayVO> selectSayList() {

        //是否显示未公开的说说 登录用户id为1时显示所有说说
        boolean showPrivate = AuthUtil.isLogin()  && SecurityUtils.getLoginIdAsString().equals("1");

        List<ApiSayVO> sayPage = sayMapper.selectPublicSayList(showPrivate);
        for (ApiSayVO item : sayPage) {
            //获取点赞用户信息
            Set<Object> userIdList = redisService.getCacheSet(RedisConstants.SAY_LIKE_KEY + item.getId());
            List<UserInfoVO> likeUserList = new ArrayList<>();
            for (Object userId : userIdList) {
                UserInfoVO userInfoVO = userMapper.selectInfoByUserIdTwo(userId);
                likeUserList.add(userInfoVO);
            }
            item.setCreateTimeStr(RelativeDateFormat.format(item.getCreateTime()));
            item.setUserLikeList(likeUserList);
            if (AuthUtil.isLogin()){
                item.setIsLike(redisService.sIsMember(RedisConstants.SAY_LIKE_USER + SecurityUtils.getLoginIdAsString(), item.getId()));
            }

            List<BlogSayComment> sayComments = sayCommentMapper.selectBlogSayCommentList(new BlogSayComment() {{setSayId(item.getId());}});
            List<ApiSayCommentVO> sayCommentVOList = new ArrayList<>();
            for (BlogSayComment sayComment : sayComments) {
                UserInfoVO userInfoVO = userMapper.selectInfoByUserIdTwo(sayComment.getUserId());
                ApiSayCommentVO apiSayCommentVO = ApiSayCommentVO.builder().userId(sayComment.getUserId()).nickname(userInfoVO.getNickname()).replyUserId(sayComment.getReplyUserId())
                        .content(sayComment.getContent()).ipAddress(sayComment.getIpAddress()).createTime(sayComment.getCreateTime()).build();
                if (StringUtils.isNotBlank(sayComment.getReplyUserId())) {
                    userInfoVO = userMapper.selectInfoByUserIdTwo(sayComment.getReplyUserId());
                    apiSayCommentVO.setReplyUserNickname(userInfoVO.getNickname());
                }
                sayCommentVOList.add(apiSayCommentVO);
            }
            item.setSayCommentVOList(sayCommentVOList);
        }

        return sayPage;
    }

    @Override
    public AjaxResult like(String sayId) {
        String userId = SecurityUtils.getLoginIdAsString();
        // 判断是否点赞
        String sayLikeUser = RedisConstants.SAY_LIKE_USER + userId;
        String sayLike = RedisConstants.SAY_LIKE_KEY + sayId;
        if (redisService.sIsMember(sayLikeUser, sayId)) {
            // 点过赞则删除说说id
            redisService.sRemove(sayLikeUser, sayId);
            redisService.sRemove(sayLike, userId);
            return AjaxResult.success("取消点赞成功");
        }
            // 未点赞则增加说说id
            redisService.sAdd(sayLikeUser, sayId);
            // 说说点赞量+1
            redisService.sAdd(sayLike, userId);

            //构建通知消息
//            Article article = articleMapper.selectById(articleId);
//            SystemNoticeHandle.sendNotice(article.getUserId(), MessageConstant.MESSAGE_LIKE_NOTICE,MessageConstant.SYSTEM_MESSAGE_CODE,articleId,null,null);
        return AjaxResult.success("点赞成功");
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public AjaxResult comment(BlogSayComment sayComment) {
        sayComment.setUserId(SecurityUtils.getLoginIdAsString());
        sayComment.setIp(IpUtils.getIpAddr());
        sayComment.setIpAddress(sayComment.getIp());
        sayCommentMapper.insertBlogSayComment(sayComment);
        return AjaxResult.success();
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public AjaxResult insertSay(BlogSay say) {
        String userId = SecurityUtils.getLoginIdAsString();
        if (!userId.equals("1")) {
            throw new ServiceException(ResultCode.NO_PERMISSION.desc);
        }
        say.setUserId(userId);
        blogSayMapper.insertBlogSay(say);
        return AjaxResult.success();
    }
}
