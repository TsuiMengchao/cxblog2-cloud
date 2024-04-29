package me.mcx.blog.mapper.web;

import me.mcx.blog.domain.vo.user.UserInfoVO;
import me.mcx.system.api.domain.SysUser;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * <p>
 * 系统管理-用户基础信息表 Mapper 接口
 * </p>
 *
 * @author blue
 * @since 2021-07-30
 */
public interface UserMapper {
    /**
     * 根据用户名查询
     * @param username
     * @return
     */
    UserInfoVO selectByUserName(String username);

    /**
     * 根据用户id查询
     * @param userId
     * @return
     */
    UserInfoVO selectInfoByUserId(Object userId);


    /**
     * 根据用户id查询-2
     * @param userId
     * @return
     */
    UserInfoVO selectInfoByUserIdTwo(Object userId);

    UserInfoVO selectInfoByUserIdNew(Object userId);

}
