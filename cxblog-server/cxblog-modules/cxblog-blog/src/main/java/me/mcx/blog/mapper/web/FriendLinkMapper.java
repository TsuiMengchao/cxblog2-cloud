package me.mcx.blog.mapper.web;

import me.mcx.blog.domain.vo.friendLink.ApiFriendLinkVO;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * <p>
 * 友情链接表 Mapper 接口
 * </p>
 *
 * @author blue
 * @since 2021-08-18
 */
@Repository
public interface FriendLinkMapper {

    Integer getMaxSort();

    void top(@Param("id") Integer id, @Param("sort") int sort);

    List<ApiFriendLinkVO> selectLinkList(@Param("status") Integer status);

}
