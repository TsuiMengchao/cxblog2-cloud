package me.mcx.blog.handle;

import cn.hutool.extra.spring.SpringUtil;
import lombok.extern.slf4j.Slf4j;
import me.mcx.blog.domain.BlogImMessage;
import me.mcx.blog.mapper.BlogImMessageMapper;
import me.mcx.blog.mapper.web.ImMessageMapper;
import me.mcx.common.core.context.SecurityContextHolder;
import me.mcx.common.core.utils.ip.IpUtils;


@Slf4j
public class SystemNoticeHandle {


    /**
     *
     * 发送系统通知
     * @param toUserId
     * @param noticeType
     * @param noticeCode
     */
    public static void sendNotice(String toUserId,Integer noticeType,Integer noticeCode,Integer articleId,Integer commentMark,String content) {
        BlogImMessageMapper imMessageMapper = SpringUtil.getBean(BlogImMessageMapper.class);
        try {
            String ip = IpUtils.getIpAddr();

            BlogImMessage message = new BlogImMessage(){{
                setFromUserId(SecurityContextHolder.getLoginIdAsString());
                setToUserId(toUserId);
                setCommentMark(Long.valueOf(commentMark));
                setNoticeType(Long.valueOf(noticeType));
                setIp(ip);
                setIpSource(ip);
                setArticleId(Long.valueOf(articleId));
            }};
            imMessageMapper.insertBlogImMessage(message);
        } catch (Exception e) {
            //添加失败的话不抛异常，还是要执行成功
            log.error("生成消息通知失败，错误原因：{}",e.getMessage());
        }
    }
}
