package me.mcx.blog.domain;

import me.mcx.common.core.web.domain.BaseEntity;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import me.mcx.common.core.annotation.Excel;

/**
 * 用户信息对象 blog_user_info
 * 
 * @author mcx
 * @date 2024-04-28
 */
public class BlogUserInfo extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 用户ID */
    private Long id;

    /** 邮箱号 */
    @Excel(name = "邮箱号")
    private String email;

    /** 用户昵称 */
    @Excel(name = "用户昵称")
    private String nickname;

    /** 用户头像 */
    @Excel(name = "用户头像")
    private String avatar;

    /** 用户简介 */
    @Excel(name = "用户简介")
    private String intro;

    /** 个人网站 */
    @Excel(name = "个人网站")
    private String webSite;

    /** 是否禁用 */
    @Excel(name = "是否禁用")
    private Integer isDisable;

    /** 个人中心背景图 */
    @Excel(name = "个人中心背景图")
    private String bjCover;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }
    public void setEmail(String email) 
    {
        this.email = email;
    }

    public String getEmail() 
    {
        return email;
    }
    public void setNickname(String nickname) 
    {
        this.nickname = nickname;
    }

    public String getNickname() 
    {
        return nickname;
    }
    public void setAvatar(String avatar) 
    {
        this.avatar = avatar;
    }

    public String getAvatar() 
    {
        return avatar;
    }
    public void setIntro(String intro) 
    {
        this.intro = intro;
    }

    public String getIntro() 
    {
        return intro;
    }
    public void setWebSite(String webSite) 
    {
        this.webSite = webSite;
    }

    public String getWebSite() 
    {
        return webSite;
    }
    public void setIsDisable(Integer isDisable) 
    {
        this.isDisable = isDisable;
    }

    public Integer getIsDisable() 
    {
        return isDisable;
    }
    public void setBjCover(String bjCover) 
    {
        this.bjCover = bjCover;
    }

    public String getBjCover() 
    {
        return bjCover;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("email", getEmail())
            .append("nickname", getNickname())
            .append("avatar", getAvatar())
            .append("intro", getIntro())
            .append("webSite", getWebSite())
            .append("isDisable", getIsDisable())
            .append("bjCover", getBjCover())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .append("remark", getRemark())
            .toString();
    }
}
