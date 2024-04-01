package cn.mju.wjh.chart.service.impl;

import cn.mju.wjh.chart.service.CategoryService;
import cn.mju.wjh.common.core.entity.param.PageParams;
import cn.mju.wjh.common.core.entity.pojo.category.CivilCategory;
import cn.mju.wjh.chart.mapper.CivilCategoryMapper;
import cn.mju.wjh.common.core.enums.HttpStatus;
import cn.mju.wjh.common.core.utils.Result;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import lombok.Setter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * ClassName: CategoryServiceImpl
 * Package: cn.mju.wjh.chart.service.impl
 * Description: 类别服务实现
 *
 * @Author:wjh
 * @Create:2024-01-2024/1/27--14:25
 */
@Service
public class CategoryServiceImpl implements CategoryService {

    @Setter(onMethod_ = @Autowired)
    private CivilCategoryMapper categoryMapper;

    /**
     * 获取类别名称
     * @param categoryId 类别ID
     * @return 类别名称
     */
    @Override
    public Result getCategoryById(Long categoryId) {
        CivilCategory category = categoryMapper.selectById(categoryId);

        if (category == null) {
            return Result.fail().message("查询类别失败").code(HttpStatus.NOT_FOUND.getCode());
        }
        return Result.ok(category).message("操作成功");
    }

    /**
     * 展示类别信息
     * @return 类别信息
     */
    @Override
    public Result getCategoryInfo() {
        List<CivilCategory> categoryList = categoryMapper.selectList(null);

        // 设置全部类别
        List<Map<String, Object>> categoryVoList = new ArrayList<>();
        categoryVoList.add(
                new HashMap<>() {
                    {
                        put("categoryId", 0);
                        put("categoryName", "全部");
                    }
                }
        );

        // 封装数据
        categoryList.forEach(category -> categoryVoList.add(new HashMap<>() {
            {
                put("categoryId", category.getCategoryId());
                put("categoryName", category.getCategoryName());
            }
        }));

        if (categoryVoList.size() == 0) {
            return Result.fail().message("操作失败").code(HttpStatus.NOT_FOUND.getCode());
        }

        return Result.ok(categoryVoList).message("操作成功");
    }

    /**
     * 获取所有分类信息
     * @param pageParams 分页参数
     * @return 所有分类信息
     */
    @Override
    public Result getAllCategory(PageParams pageParams) {
        // 查询
        IPage<CivilCategory> categoryIpage = categoryMapper.selectPage(
                new Page<>(pageParams.getCurrentPage(), pageParams.getPageSize()),
                new LambdaQueryWrapper<CivilCategory>()
                        .orderByDesc(CivilCategory::getCreateTime)
        );

        // 判断
        if (categoryIpage.getRecords().size() == 0) {
            return Result.fail().message("查询失败").code(HttpStatus.NOT_FOUND.getCode());
        }

        return Result.ok(categoryIpage).message("查询成功");
    }

    /**
     * 添加分类
     * @param category 分类信息
     * @return 操作是否成功
     */
    @Override
    public Result addCategory(CivilCategory category) {
        // 这里默认都是一级菜单
        category.setCategoryParentId(0L);
        if (categoryMapper.insert(category) == 0) {
            return Result.fail().message("操作失败");
        }
        return Result.ok().message("操作成功");
    }

    /**
     * 更新分类
     * @param category 分类信息
     * @return 操作是否成功
     */
    @Override
    public Result updateCategory(CivilCategory category) {
        if (categoryMapper.updateById(category) == 0) {
            return Result.fail().message("操作失败");
        }
        return Result.ok().message("操作成功");
    }

    /**
     * 删除分类
     * @param categoryIds 分类ID
     * @return 操作是否成功
     */
    @Override
    public Result deleteCategory(List<Long> categoryIds) {
        if (categoryMapper.deleteBatchIds(categoryIds) == 0) {
            return Result.fail().message("操作失败");
        }
        return Result.ok().message("操作成功");
    }
}
