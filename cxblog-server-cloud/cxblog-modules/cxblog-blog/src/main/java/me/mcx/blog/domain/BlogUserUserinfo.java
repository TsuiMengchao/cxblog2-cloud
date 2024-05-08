package me.mcx.blog.domain;

import me.mcx.common.core.web.domain.BaseEntity;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import me.mcx.common.core.annotation.Excel;

/**
 * 用户与用户信息对象 blog_user_userinfo
 * 
 * @author mcx
 * @date 2024-04-29
 */
public class BlogUserUserinfo extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 用户ID */
    private Long userId;

    /** 用户信息ID */
    @Excel(name = "用户信息ID")
    private Long userInfoId;

    public void setUserId(Long userId) 
    {
        this.userId = userId;
    }

    public Long getUserId() 
    {
        return userId;
    }
    public void setUserInfoId(Long userInfoId) 
    {
        this.userInfoId = userInfoId;
    }

    public Long getUserInfoId() 
    {
        return userInfoId;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("userId", getUserId())
            .append("userInfoId", getUserInfoId())
            .toString();
    }
}
