package cn.mju.wjh.chart.controller;

import cn.dev33.satoken.annotation.SaCheckRole;
import cn.dev33.satoken.annotation.SaIgnore;
import cn.dev33.satoken.annotation.SaMode;
import cn.mju.wjh.chart.service.BannerService;
import cn.mju.wjh.common.core.constant.UseConstant;
import cn.mju.wjh.common.core.entity.param.PageParams;
import cn.mju.wjh.common.core.entity.param.UploadParams;
import cn.mju.wjh.common.core.entity.pojo.banner.CivilBanner;
import cn.mju.wjh.common.core.utils.Result;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.Setter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

/**
 * ClassName: BannerController
 * Package: cn.mju.wjh.chart.controller
 * Description: 轮播图控制类
 *
 * @Author:wjh
 * @Create:2024-01-2024/1/22--14:00
 */
@RestController
@Tag(name = "轮播图服务")
public class BannerController {

    @Setter(onMethod_ = @Autowired)
    private BannerService bannerService;

    @GetMapping("/front/banner/showBanner")
    @Operation(summary = "轮播图--首页显示轮播图", description = "(6条,优先级排序)")
    public Result showBanner() {
        return bannerService.showBanner();
    }


    @PostMapping("/backend/banner/getALllBanner")
    @Operation(summary = "轮播图--查询所有轮播图")
    @SaCheckRole(value = {UseConstant.ROLE_SUPER_ADMIN, UseConstant.ADMIN_REAL_CONSTANT}, mode = SaMode.OR)
    public Result getAllBanner(@RequestBody @Validated PageParams pageParams, BindingResult result) {
        if (result.hasErrors()) {
            return Result.validateError(result);
        }
        return bannerService.getAllBanner(pageParams);
    }

    @SaIgnore
    @PostMapping("/backend/banner/submitBanner")
    @Operation(summary = "轮播图--上传轮播图")
    public Result submitBanner(@RequestParam("file") MultipartFile file, UploadParams params) {
        return bannerService.submitBanner(file, params.getUsername());
    }

    @PostMapping("/backend/banner/addBanner")
    @Operation(summary = "轮播图--添加轮播图")
    @SaCheckRole(value = {UseConstant.ROLE_SUPER_ADMIN, UseConstant.ADMIN_REAL_CONSTANT}, mode = SaMode.OR)
    public Result addBanner(@RequestBody @Validated CivilBanner banner, BindingResult result) {
        if (result.hasErrors()) {
            return Result.validateError(result);
        }
        return bannerService.addBanner(banner);
    }

    @PutMapping("/backend/banner/updateBanner")
    @Operation(summary = "轮播图--修改轮播图")
    @SaCheckRole(value = {UseConstant.ROLE_SUPER_ADMIN, UseConstant.ADMIN_REAL_CONSTANT}, mode = SaMode.OR)
    public Result updateBanner(@RequestBody @Validated CivilBanner banner, BindingResult result) {
        if (result.hasErrors()) {
            return Result.validateError(result);
        }
        return bannerService.updateBanner(banner);
    }

    @DeleteMapping("/backend/banner/deleteBanner")
    @Operation(summary = "轮播图--删除轮播图")
    @SaCheckRole(value = {UseConstant.ROLE_SUPER_ADMIN, UseConstant.ADMIN_REAL_CONSTANT}, mode = SaMode.OR)
    public Result deleteBanner(@RequestBody List<Long> bannerIds) {
        return bannerService.deleteBanner(bannerIds);
    }

    @PutMapping("/backend/banner/moveUpBanner/{bannerId}")
    @Operation(summary = "轮播图--上移优先级")
    @SaCheckRole(value = {UseConstant.ROLE_SUPER_ADMIN, UseConstant.ADMIN_REAL_CONSTANT}, mode = SaMode.OR)
    public Result moveUpBanner(@PathVariable("bannerId") Long bannerId) {
        return bannerService.moveUpBanner(bannerId);
    }

    @PutMapping("/backend/banner/moveDownBanner/{bannerId}")
    @Operation(summary = "轮播图--下移优先级")
    @SaCheckRole(value = {UseConstant.ROLE_SUPER_ADMIN, UseConstant.ADMIN_REAL_CONSTANT}, mode = SaMode.OR)
    public Result moveDownBanner(@PathVariable("bannerId") Long bannerId) {
        return bannerService.moveDownBanner(bannerId);
    }
}
