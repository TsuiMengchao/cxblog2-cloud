package me.mcx.blog.mapper.web;

import me.mcx.blog.domain.BlogArticleComment;
import me.mcx.blog.domain.vo.article.ApiArticleListVO;
import me.mcx.blog.domain.vo.message.ApiCommentListVO;
import me.mcx.blog.domain.vo.message.SystemCommentVO;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * <p>
 * 博客评论表 Mapper 接口
 * </p>
 *
 * @author blue
 * @since 2021-07-19
 */
@Repository
public interface ArticleCommentMapper {


    List<SystemCommentVO> selectPageList(@Param("keywords")String keywords);

    List<ApiCommentListVO> selectCommentPage(@Param("articleId") Long articleId);

    /**
     * 获取我的文章
     * @param loginIdAsString 登录用户id
     * @return
     */
    List<ApiArticleListVO> selectMyComment(@Param("userId") String loginIdAsString);
}
