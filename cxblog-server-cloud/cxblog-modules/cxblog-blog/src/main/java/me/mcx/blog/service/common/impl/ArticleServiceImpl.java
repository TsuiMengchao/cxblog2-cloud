package me.mcx.blog.service.common.impl;

import cn.hutool.core.util.ObjectUtil;
import com.alibaba.fastjson.JSON;
import com.vladsch.flexmark.html2md.converter.FlexmarkHtmlConverter;
import com.vladsch.flexmark.util.data.MutableDataSet;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import me.mcx.blog.common.Constants;
import me.mcx.blog.common.ResultCode;
import me.mcx.blog.domain.BlogArticle;
import me.mcx.blog.domain.BlogCategory;
import me.mcx.blog.domain.BlogTags;
import me.mcx.blog.domain.dto.article.ArticleDTO;
import me.mcx.blog.domain.vo.article.SystemArticleListVO;
import me.mcx.blog.enums.DataEventEnum;
import me.mcx.blog.enums.YesOrNoEnum;
import me.mcx.blog.event.DataEventPublisherService;
import me.mcx.blog.mapper.BlogArticleMapper;
import me.mcx.blog.mapper.BlogCategoryMapper;
import me.mcx.blog.mapper.BlogTagsMapper;
import me.mcx.blog.mapper.web.ArticleMapper;
import me.mcx.blog.mapper.web.CategoryMapper;
import me.mcx.blog.mapper.web.TagsMapper;
import me.mcx.blog.mapper.web.UserMapper;
import me.mcx.blog.service.common.ArticleService;
import me.mcx.blog.util.BeanCopyUtil;
import me.mcx.common.core.exception.ServiceException;
import me.mcx.common.core.utils.ip.IpUtils;
import me.mcx.common.core.web.domain.AjaxResult;
import me.mcx.common.security.auth.AuthUtil;
import me.mcx.common.security.utils.SecurityUtils;
import org.apache.commons.lang3.StringUtils;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.client.RestTemplate;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/**
 * <p>
 * 博客文章表 服务实现类
 * </p>
 *
 * @author blue
 * @since 2021-08-18
 */
@Slf4j
@Service
@RequiredArgsConstructor
public class ArticleServiceImpl implements ArticleService {

    private final BlogCategoryMapper categoryMapper;
    private final UserMapper userMapper;

    private final TagsMapper tagsMapper;

    private final BlogTagsMapper blogTagsMapper;

    private final RestTemplate restTemplate;

    private final DataEventPublisherService dataEventPublisherService;

    private final ArticleMapper baseMapper;

    private final BlogArticleMapper blogArticleMapper;

    @Value("${baidu.url}")
    private String baiduUrl;


    /**
     *  后台获取所有文章
     * @return
     */
    @Override
    public List<SystemArticleListVO> selectArticlePage(String title,Integer tagId,Integer categoryId,Integer isPublish) {
        List<SystemArticleListVO> data = baseMapper.selectArticle(title,tagId,categoryId,isPublish);
        return data;
    }

    /**
     *  后台获取文章详情
     * @return
     */
    @Override
    public AjaxResult selectArticleById(Long id) {
        ArticleDTO articleDTO = baseMapper.selectArticlePrimaryKey(id);
        articleDTO.setTags(tagsMapper.selectByArticleId(id));
        return AjaxResult.success(articleDTO);
    }

    /**
     *  添加文章
     * @return
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public AjaxResult addArticle(ArticleDTO article) {
        BlogArticle blogArticle = BeanCopyUtil.copyObject(article, BlogArticle.class);
        blogArticle.setUserId(SecurityUtils.getLoginIdAsString());
        //添加分类
        Long categoryId = savaCategory(article.getCategoryName());
        //添加标签
        List<Long> tagList = getTagsList(article);

        blogArticle.setCategoryId(categoryId);

        String ipAddress = IpUtils.getIpAddr();
        if (StringUtils.isNotBlank(ipAddress)) {
            String address = ipAddress.split("\\|")[1];
            blogArticle.setAddress(address);
        }
        int insert = blogArticleMapper.insertBlogArticle(blogArticle);
        if (insert > 0) {
            tagsMapper.saveArticleTags(blogArticle.getId(),tagList);
        }

        //发布消息去同步es 不进行判断是否是发布状态了，因为后面修改成下架的话就还得去删除es里面的数据，多次一举了，在查询时添加条件发布状态为已发布
        dataEventPublisherService.publishData(DataEventEnum.ES_ADD,blogArticle);
        return AjaxResult.success();
    }

    /**
     *  修改文章
     * @return
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public AjaxResult updateArticle(ArticleDTO article) {
        BlogArticle blogArticle = blogArticleMapper.selectBlogArticleById(article.getId());
        if (ObjectUtil.isNull(blogArticle)) {
            throw new ServiceException(ResultCode.ARTICLE_NOT_EXIST.desc);
        }
        //只能修改属于当前登录用户的文章
        String loginId = SecurityUtils.getLoginIdAsString();
        if (!blogArticle.getUserId().equals(loginId) && !AuthUtil.hasRole(Constants.ADMIN_CODE)){
            throw new ServiceException(ResultCode.NO_PERMISSION.desc);
        }

        //添加分类
        Long categoryId = savaCategory(article.getCategoryName());
        //添加标签
        List<Long> tagList = getTagsList(article);

        blogArticle = BeanCopyUtil.copyObject(article, BlogArticle.class);
        blogArticle.setCategoryId(categoryId);
        blogArticleMapper.updateBlogArticle(blogArticle);

        //先删出所有标签
        tagsMapper.deleteByArticleIds(Collections.singletonList(blogArticle.getId()));
        //然后新增标签
        tagsMapper.saveArticleTags(blogArticle.getId(),tagList);

        //发布消息去同步es
        dataEventPublisherService.publishData(DataEventEnum.ES_UPDATE,blogArticle);
        return AjaxResult.success();
    }


    /**
     * 批量删除文章
     * @param ids
     * @return
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public AjaxResult deleteBatchArticle(List<Long> ids) {
        blogArticleMapper.deleteBlogArticleByIds(ids.toArray(new Long[0]));
        tagsMapper.deleteByArticleIds(ids);

        dataEventPublisherService.publishData(DataEventEnum.ES_DELETE,ids);
        return AjaxResult.success();
    }

    /**
     *  置顶文章
     * @return
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public AjaxResult topArticle(ArticleDTO article) {
        baseMapper.putTopArticle(article);
        return AjaxResult.success();
    }


    /**
     *  文章百度推送
     * @return
     */
    @Override
    public AjaxResult seoArticle(List<Long> ids) {

        HttpHeaders headers = new HttpHeaders();
        headers.add("Host", "data.zz.baidu.com");
        headers.add("User-Agent", "curl/7.12.1");
        headers.add("Content-Length", "83");
        headers.add("Content-Type", "text/plain");

        ids.forEach(item -> {
            String url = "http://www.shiyit.com/article/" + item;
            HttpEntity<String> entity = new HttpEntity<>(url, headers);
            restTemplate.postForObject(baiduUrl, entity, String.class);
        });
        return AjaxResult.success();
    }

    /**
     *  抓取文章
     * @return
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public AjaxResult reptile(String url) {
        try {
            Document document = Jsoup.connect(url).get();
            Elements title  = document.getElementsByClass("title-article");
            Elements tags  = document.getElementsByClass("tag-link");
            Elements content  = document.getElementsByClass("article_content");
            if (StringUtils.isBlank(content.toString())) {
                throw new ServiceException(ResultCode.CRAWLING_ARTICLE_FAILED.getDesc());
            }

            //爬取的是HTML内容，需要转成MD格式的内容
            String newContent = content.get(0).toString().replaceAll("<code>", "<code class=\"lang-java\">");
            MutableDataSet options = new MutableDataSet();
            String markdown = FlexmarkHtmlConverter.builder(options).build().convert(newContent)
                    .replace("lang-java","java");

            BlogArticle entity = new BlogArticle() {{
                setUserId(SecurityUtils.getLoginIdAsString());
                setContentMd(markdown);
                setCategoryId(16L);
                setIsOriginal(Long.valueOf(YesOrNoEnum.NO.getCode()));
                setTitle(title.get(0).text());
                setAddress("https://picsum.photos/500/300");
                setContent(newContent);
            }};

            blogArticleMapper.insertBlogArticle(entity);
            //为该文章添加标签
            List<Long> tagsId = new ArrayList<>();
            tags.forEach(item ->{
                String tag = item.text();
                BlogTags blogTags = new BlogTags() {{setName(tag);}};
                List<BlogTags> result = blogTagsMapper.selectBlogTagsList(blogTags);
                if (result.size() == 0){
                    blogTagsMapper.insertBlogTags(blogTags);
                }
                tagsId.add(result.get(0).getId());
            });
            tagsMapper.saveArticleTags(entity.getId(),tagsId);

            log.info("文章抓取成功，内容为:{}", JSON.toJSONString(entity));
        } catch (IOException e) {
            throw new ServiceException(e.getMessage());
        }
        return AjaxResult.success();
    }

    /**
     *  发布或下架文章
     * @return
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public AjaxResult psArticle(BlogArticle article) {
        blogArticleMapper.updateBlogArticle(article);
        return AjaxResult.success();
    }

    @Override
    public AjaxResult randomImg() {
        return AjaxResult.success("https://picsum.photos/500/300?random=" + System.currentTimeMillis());
    }


    /**
     * 将数据库不存在的标签新增
     * @param article
     * @return
     */
    private List<Long> getTagsList(ArticleDTO article) {
        List<Long> tagList = new ArrayList<>();
        article.getTags().forEach(item ->{
            BlogTags blogTags = new BlogTags() {{setName(item);}};
            List<BlogTags> tags = blogTagsMapper.selectBlogTagsList(blogTags);
            if (tags.size() == 0){
                blogTags.setSort(0L);
                blogTagsMapper.insertBlogTags(blogTags);
            }
            tagList.add(tags.get(0).getId());
        });
        return tagList;
    }

    /**
     * 如果分类不存在则新增
     * @param categoryName
     * @return
     */
    private Long savaCategory(String categoryName) {
        BlogCategory category = new BlogCategory() {{
            setName(categoryName);

        }};
                List<BlogCategory> categorys = categoryMapper.selectBlogCategoryList(category);
        if (categorys == null){
            category.setSort(0L);
            categoryMapper.insertBlogCategory(category);
        }
        return category.getId();
    }
}
