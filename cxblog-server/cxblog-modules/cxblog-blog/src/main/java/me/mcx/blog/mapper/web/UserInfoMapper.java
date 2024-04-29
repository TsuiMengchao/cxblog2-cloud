package me.mcx.blog.mapper.web;

import me.mcx.blog.domain.BlogUserInfo;
import me.mcx.blog.domain.vo.user.UserInfoVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author MCX
 * @since 2021-12-25
 */
@Mapper
public interface UserInfoMapper {

    void deleteByUserIds(@Param("ids") List<String> ids);

    /**
     * 根据用户id获取用户信息
     * @param loginId 用户id
     * @return
     */
    BlogUserInfo getByUserId(String loginId);

    UserInfoVO selectUserInfoByUserId(String userId);

}
