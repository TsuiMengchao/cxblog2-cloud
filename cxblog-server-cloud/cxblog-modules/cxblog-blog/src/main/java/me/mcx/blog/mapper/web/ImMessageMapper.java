package me.mcx.blog.mapper.web;

import me.mcx.blog.domain.vo.message.ImMessageVO;
import me.mcx.blog.domain.vo.user.ImOnlineUserVO;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Set;

/**
 * <p>
 * </p>
 *
 * @author blue
 * @since 2021-08-18
 */
@Repository
public interface ImMessageMapper {

    /**
     * 获取历史聊天记录
     * @return
     */
    List<ImMessageVO> selectPublicHistoryList();

    /**
     * 获取在线用户列表
     */
    List<ImOnlineUserVO> selectPublicOnlineUserList(@Param("keys") Set<String> keys);

    /**
     * 获取单聊历史聊天记录
     * @return
     */
    List<ImMessageVO> selectPublicUserImHistoryList(@Param("fromUserId") String fromUserId,@Param("toUserId")String toUserId);

    int selectListReadByUserId(@Param("toUserId") String toUserId, @Param("fromUserId")String fromUserId);

    /**
     * 已读消息
     * @param userId
     * @param loginIdAsString
     */
    void updateRead(@Param("fromUserId") String userId, @Param("toUserId") String loginIdAsString);

    List<ImMessageVO> getMessageNotice(@Param("userId")String userId
            , @Param("noticeType")Integer noticeType);

}
