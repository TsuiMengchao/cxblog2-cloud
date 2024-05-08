package me.mcx.blog.mapper.web;

import me.mcx.blog.domain.BlogCategory;
import me.mcx.blog.domain.vo.category.ApiCategoryListVO;
import me.mcx.blog.domain.vo.category.SystemCategoryCountVO;
import me.mcx.blog.domain.vo.category.SystemCategoryListVO;
import org.apache.ibatis.annotations.Param;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * <p>
 * 博客分类表 Mapper 接口
 * </p>
 *
 * @author blue
 * @since 2021-12-29
 */
@Repository
public interface CategoryMapper {

    /**
     * 分页获取分类
     * @param objectPage 分页对象
     * @param name 分类名
     * @return
     */
    Page<SystemCategoryListVO> selectCategory(@Param("page")Page<BlogCategory> objectPage, @Param("name")String name);

    /**
     * 统计分类
     * @return
     */
    List<SystemCategoryCountVO> countArticle();

    List<ApiCategoryListVO> selectCategoryListApi();


}
