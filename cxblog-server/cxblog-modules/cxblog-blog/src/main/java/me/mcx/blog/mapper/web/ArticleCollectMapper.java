package me.mcx.blog.mapper.web;

import me.mcx.blog.domain.vo.article.ApiArticleListVO;
import org.apache.ibatis.annotations.Param;
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
public interface ArticleCollectMapper {

    /**
     * 我的收藏列表
     * @return
     */
    List<ApiArticleListVO> selectCollectList(@Param("userId") String userId);
}
