package me.mcx.blog.mapper.web;

import me.mcx.blog.domain.dto.article.ArticleDTO;
import me.mcx.blog.domain.dto.article.ArticlePostDTO;
import me.mcx.blog.domain.BlogArticle;
import me.mcx.blog.domain.vo.article.*;
import org.apache.ibatis.annotations.Param;
import org.springframework.data.domain.Page;

import java.util.List;

/**
 * 文章 Mapper 接口
 * @author blue
 * @since 2021-08-18
 */
public interface ArticleMapper {

    /**
     * 后台分页获取文章
     * @return
     */
    List<SystemArticleListVO> selectArticle(@Param("title")String title, @Param("tagId")Integer tagId,
                                            @Param("categoryId")Integer categoryId, @Param("isPublish")Integer isPublish);

    /**
     * 后台根据主键获取文章详情
     * @param id 主键id
     * @return
     */
    ArticleDTO selectArticlePrimaryKey(Long id);

    /**
     * 置顶文章
     * @param article 文章对象
     */
    void putTopArticle(@Param("article") ArticleDTO article);


    /**
     * 文章贡献度
     * @param lastTime 开始时间
     * @param nowTime 结束时间
     * @return
     */
    List<SystemArticleContributeVO> contribute(@Param("lastTime") String lastTime, @Param("nowTime")String nowTime);



    //-----------------------门户端方法分割线-------------------------------
    /**
     * 首页分页获取归档
     * @return
     */
    List<ApiArchiveVO> selectListArchive();

    /**
     * 首页分页获取文章
     * @param categoryId 分类id
     * @param tagId 标签id
     * @return
     */
    List<ApiArticleListVO> selectPublicArticleList(@Param("categoryId")Integer categoryId, @Param("tagId")Integer tagId,
                                                   @Param("orderByDescColumn")String orderByDescColumn);


    /**
     * 获取文章详情
     * @param id
     * @return
     */
    ApiArticleInfoVO selectArticleByIdToVO(Integer id);

    /**
     * 获取推荐的文章
     * @return
     */
    List<SystemArticleListVO> selectListByBanner();

    /**
     * 获取推荐文章
     * @return
     */
    List<ApiArticleListVO> selectRecommendArticle();

    /**
     * 获取所搜框热门文章
     * @return
     */
    List<ApiArticleListVO> selectHotArticleList();

    /**
     * 根据关键词分页搜索文章
     * @param keywords
     * @return
     */
    List<ApiArticleSearchVO> selectSearchArticle(@Param("keywords") String keywords);


    /**
     * 查询我的文章
     * @return
     */
    List<ApiArticleListVO> selectMyArticle(@Param("userId") String userId,@Param("type") Integer type);

    /**
     * 获取我的文章详情
     * @param id
     * @return
     */
    ArticlePostDTO selectMyArticleInfo(Long id);
}
