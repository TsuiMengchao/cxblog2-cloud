package me.mcx.blog.service.common;

import me.mcx.blog.domain.BlogArticle;
import me.mcx.blog.domain.dto.article.ArticleDTO;
import me.mcx.blog.domain.vo.article.SystemArticleListVO;
import me.mcx.common.core.web.domain.AjaxResult;

import java.util.List;

/**
 * <p>
 * 博客文章表 服务类
 * </p>
 *
 * @author blue
 * @since 2021-08-18
 */
public interface ArticleService {

    /**
     * 后台分页获取文章
     * @return
     */
    List<SystemArticleListVO> selectArticlePage(String title, Integer tagId, Integer categoryId, Integer isPublish);

    /**
     * 后台根据主键获取文章详情
     * @param id 主键id
     * @return
     */
    AjaxResult selectArticleById(Long id);

    /**
     * 添加文章
     * @param article 文章对象
     * @return
     */
    AjaxResult addArticle(ArticleDTO article);

    /**
     * 修改文章
     * @param article 文章对象
     * @return
     */
    AjaxResult updateArticle(ArticleDTO article);


    /**
     * 后台批量删除文章
     * @param ids 文章id集合
     * @return
     */
    AjaxResult deleteBatchArticle(List<Long> ids);

    /**
     * 置顶文章
     * @param article 文章对象
     * @return
     */
    AjaxResult topArticle(ArticleDTO article);

    /**
     * 发布或下架文章
     * @param article 文章对象
     * @return
     */
    AjaxResult psArticle(BlogArticle article);

    /**
     * 百度seo
     * @param ids 文章id集合
     * @return
     */
    AjaxResult seoArticle(List<Long> ids);

    /**
     * 爬取文章
     * @param url 文章地址
     * @return
     */
    AjaxResult reptile(String url);

    /**
     * 随机获取图片
     * @return
     */
    AjaxResult randomImg();

}
