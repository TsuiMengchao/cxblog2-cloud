package me.mcx.blog.mapper.web;

import me.mcx.blog.domain.vo.message.ImRoomListVO;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * <p>
 * </p>
 *
 * @author blue
 * @since 2021-08-18
 */
@Repository
public interface ImRoomMapper {


    List<ImRoomListVO> selectListByUserId(String userId);
}
