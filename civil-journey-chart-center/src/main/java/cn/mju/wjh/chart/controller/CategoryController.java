package cn.mju.wjh.chart.controller;

import cn.dev33.satoken.annotation.SaCheckRole;
import cn.dev33.satoken.annotation.SaMode;
import cn.mju.wjh.chart.service.CategoryService;
import cn.mju.wjh.common.core.constant.UseConstant;
import cn.mju.wjh.common.core.entity.param.PageParams;
import cn.mju.wjh.common.core.entity.pojo.category.CivilCategory;
import cn.mju.wjh.common.core.utils.Result;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.Setter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * ClassName: CategoryController
 * Package: cn.mju.wjh.chart.controller
 * Description: 分类控制层
 *
 * @Author:wjh
 * @Create:2023-12-2023/12/24--10:40
 */
@RestController
@Tag(name = "分类服务")
public class CategoryController {

    @Setter(onMethod_ = @Autowired)
    private CategoryService categoryService;

    @GetMapping("/front/category/getCategoryById/{categoryId}")
    @Operation(summary = "分类--获取类别信息", description = "根据类别ID")
    public Result getCategoryById(@PathVariable("categoryId") Long categoryId) {
        return categoryService.getCategoryById(categoryId);
    }

    @GetMapping("/front/category/getCategoryInfo")
    @Operation(summary = "分类--展示分类信息")
    public Result getCategoryInfo() {
        return categoryService.getCategoryInfo();
    }

    @PostMapping("/backend/category/getAllCategory")
    @Operation(summary = "分类--查询所有分类信息")
    @SaCheckRole(value = {UseConstant.ROLE_SUPER_ADMIN, UseConstant.ADMIN_REAL_CONSTANT}, mode = SaMode.OR)
    private Result getAllCategory(@RequestBody @Validated PageParams pageParams, BindingResult result) {
        if (result.hasErrors()) {
            return Result.validateError(result);
        }
        return categoryService.getAllCategory(pageParams);
    }

    @PostMapping("/backend/category/addCategory")
    @Operation(summary = "分类--添加分类")
    @SaCheckRole(UseConstant.ROLE_SUPER_ADMIN)
    public Result addCategory(@RequestBody @Validated CivilCategory category, BindingResult result) {
        if (result.hasErrors()) {
            return Result.validateError(result);
        }
        return categoryService.addCategory(category);
    }

    @PostMapping("/backend/category/updateCategory")
    @Operation(summary = "分类--修改分类")
    @SaCheckRole(UseConstant.ROLE_SUPER_ADMIN)
    public Result updateCategory(@RequestBody @Validated CivilCategory category, BindingResult result) {
        if (result.hasErrors()) {
            return Result.validateError(result);
        }
        return categoryService.updateCategory(category);
    }

    @DeleteMapping("/backend/category/deleteCategory")
    @Operation(summary = "分类--删除分类")
    @SaCheckRole(UseConstant.ROLE_SUPER_ADMIN)
    public Result deleteCategory(@RequestBody List<Long> categoryIds) {
        return categoryService.deleteCategory(categoryIds);
    }

}
