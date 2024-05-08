package me.mcx.blog.mapper.web;

import me.mcx.blog.domain.vo.say.ApiSayVO;

import java.util.List;

/**
 * <p>
 * </p>
 *
 * @author blue
 * @since 2021-08-18
 */
public interface SayMapper {

    List<ApiSayVO> selectPublicSayList(boolean showPrivate);
}
