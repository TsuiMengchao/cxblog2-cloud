package me.mcx.blog.service.web.impl;

import cn.hutool.http.useragent.UserAgent;
import cn.hutool.http.useragent.UserAgentParser;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import me.mcx.blog.domain.BlogArticle;
import me.mcx.blog.domain.BlogArticleComment;
import me.mcx.blog.domain.BlogUserInfo;
import me.mcx.blog.domain.vo.article.ApiArticleListVO;
import me.mcx.blog.domain.vo.message.ApiCommentListVO;
import me.mcx.blog.handle.RelativeDateFormat;
import me.mcx.blog.mapper.BlogArticleCommentMapper;
import me.mcx.blog.mapper.BlogArticleMapper;
import me.mcx.blog.mapper.web.ArticleCommentMapper;
import me.mcx.blog.mapper.web.UserInfoMapper;
import me.mcx.blog.service.web.ApiCommentService;
import me.mcx.blog.util.HTMLUtil;
import me.mcx.common.core.context.SecurityContextHolder;
import me.mcx.common.core.exception.ServiceException;
import me.mcx.common.core.utils.ServletUtils;
import me.mcx.common.core.utils.ip.IpUtils;
import me.mcx.common.core.web.domain.AjaxResult;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import java.util.List;


@Slf4j
@Service
@RequiredArgsConstructor
public class ApiCommentServiceImpl implements ApiCommentService {

    private final BlogArticleCommentMapper blogArticleCommentMapper;

    private final ArticleCommentMapper commentMapper;

    private final UserInfoMapper userInfoMapper;

    private final BlogArticleMapper articleMapper;

    /**
     * 发表评论
     * @param comment
     * @return
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public AjaxResult addComment(BlogArticleComment comment) {
        UserAgent userAgent = UserAgentParser.parse(ServletUtils.getRequest().getHeader("user-agent"));
        //获取ip地址
        String ip = IpUtils.getIpAddr();
        String ipAddress = ip;
        String os = userAgent.getOs().getName();
        if (os.contains("mac") || os.contains("Mac")) {
            comment.setSystem("mac");
        } else if (os.contains("Windows")) {
            comment.setSystem("windowns");
        }else {
            comment.setSystem("android");
        }
        //过滤内容 如删除html标签和敏感词替换
        String content = HTMLUtil.deleteTag(comment.getContent());
        comment.setContent(content);
        comment.setSystemVersion(os);
        comment.setIpAddress(ipAddress);
        comment.setUserId(SecurityContextHolder.getLoginIdAsString());
        int insert = blogArticleCommentMapper.insertBlogArticleComment(comment);
        if (insert == 0){
            throw new ServiceException("评论失败");
        }
        String toUserId =  comment.getReplyUserId();
        int mark = toUserId == null ? 2 : 1;
        if (toUserId == null) {
            BlogArticle article = articleMapper.selectBlogArticleById(comment.getArticleId());
            toUserId =  article.getUserId();
        }
        String finalUserId = toUserId;
//        ThreadUtil.execAsync(() -> {
//            SystemNoticeHandle.sendNotice(finalUserId, MessageConstant.MESSAGE_COMMENT_NOTICE, MessageConstant.SYSTEM_MESSAGE_CODE, comment.getArticleId(), mark, comment.getContent());
//        });
        return AjaxResult.success(comment);
    }

    @Override
    public List<ApiCommentListVO> selectCommentByArticleId(Long articleId) {
        //获取评论父级评论
        List<ApiCommentListVO> pageList = commentMapper.selectCommentPage(articleId);
        //获取子级
        for (ApiCommentListVO vo : pageList) {
            List<BlogArticleComment> commentList = blogArticleCommentMapper.selectBlogArticleCommentList(
                    new BlogArticleComment(){{setParentId(Long.valueOf(vo.getId()));}});
            for (BlogArticleComment e : commentList) {
                BlogUserInfo replyUserInfo = userInfoMapper.getByUserId(e.getReplyUserId());
                BlogUserInfo userInfo1 = userInfoMapper.getByUserId(e.getUserId());
                ApiCommentListVO apiCommentListVO = ApiCommentListVO.builder()
                        .id(Math.toIntExact(e.getId()))
                        .userId(e.getUserId())
                        .replyUserId(e.getReplyUserId())
                        .nickname(userInfo1.getNickname())
                        .webSite(userInfo1.getWebSite())
                        .replyNickname(replyUserInfo.getNickname())
                        .replyWebSite(replyUserInfo.getWebSite())
                        .content(e.getContent())
                        .avatar(userInfo1.getAvatar())
                        .createTimeStr(RelativeDateFormat.format(e.getCreateTime()))
                        .browser(e.getBrowser())
                        .browserVersion(e.getBrowserVersion())
                        .system(e.getSystem())
                        .systemVersion(e.getSystemVersion())
                        .ipAddress(e.getIpAddress())
                        .build();
                vo.getChildren().add(apiCommentListVO);
            }
            vo.setCreateTimeStr(RelativeDateFormat.format(vo.getCreateTime()));
        }
        return pageList;
    }

    /**
     * 获取我的评论
     * @return
     */
    @Override
    public List<ApiArticleListVO> selectMyComment() {
        List<ApiArticleListVO> result  = commentMapper.selectMyComment(SecurityContextHolder.getLoginIdAsString());
        return result;
    }
}
