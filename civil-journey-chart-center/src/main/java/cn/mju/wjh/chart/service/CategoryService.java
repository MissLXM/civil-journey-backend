package cn.mju.wjh.chart.service;

import cn.mju.wjh.common.core.entity.param.PageParams;
import cn.mju.wjh.common.core.entity.pojo.category.CivilCategory;
import cn.mju.wjh.common.core.utils.Result;

import java.util.List;

/**
 * ClassName: CategoryService
 * Package: cn.mju.wjh.chart.service
 * Description: 类别服务接口
 *
 * @Author:wjh
 * @Create:2024-01-2024/1/27--14:24
 */
public interface CategoryService {

    /**
     * 获取类别名称
     * @param categoryId 类别ID
     * @return 类别名称
     */
    Result getCategoryById(Long categoryId);

    /**
     * 展示类别信息
     * @return 类别信息
     */
    Result getCategoryInfo();

    /**
     * 获取所有分类信息
     * @param pageParams 分页参数
     * @return 所有分类信息
     */
    Result getAllCategory(PageParams pageParams);

    /**
     * 添加分类
     * @param category 分类信息
     * @return 操作是否成功
     */
    Result addCategory(CivilCategory category);

    /**
     * 更新分类
     * @param category 分类信息
     * @return 操作是否成功
     */
    Result updateCategory(CivilCategory category);

    /**
     * 删除分类
     * @param categoryIds 分类ID
     * @return 操作是否成功
     */
    Result deleteCategory(List<Long> categoryIds);
}
