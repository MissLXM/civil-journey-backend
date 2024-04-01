package cn.mju.wjh.user.controller;

import cn.dev33.satoken.annotation.SaCheckLogin;
import cn.dev33.satoken.annotation.SaCheckRole;
import cn.mju.wjh.common.core.constant.UseConstant;
import cn.mju.wjh.common.core.entity.param.PageParams;
import cn.mju.wjh.common.core.entity.param.menu.RoleMenuParams;
import cn.mju.wjh.common.core.entity.pojo.user.MenuAuthority;
import cn.mju.wjh.common.core.utils.Result;
import cn.mju.wjh.user.service.MenuService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.media.Schema;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.Setter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

/**
 * ClassName: MenuController
 * Package: cn.mju.wjh.user.controller
 * Description: 菜单控制层
 *
 * @Author:wjh
 * @Create:2023-12-2023/12/18--14:34
 */
@RestController
@Tag(name = "菜单权限服务")
@RequestMapping("/backend/admin/menu/")
public class MenuController {

    @Setter(onMethod_ = @Autowired)
    private MenuService menuService;

    @GetMapping("getLevelMenuInfo")
    @Operation(summary = "菜单--获取一级菜单")
    @SaCheckRole(value = UseConstant.ROLE_SUPER_ADMIN)
    public Result getLevelMenuInfo() {
        return menuService.getLevelMenuInfo();
    }

    @SaCheckLogin
    @GetMapping("showAsideMenu")
    @Operation(summary = "菜单--展示菜单(侧边栏)")
    public Result showAsideMenu() {
        return menuService.showAsideMenu();
    }

    @PostMapping("getAllMenu")
    @SaCheckRole(UseConstant.ROLE_SUPER_ADMIN)
    @Operation(summary = "菜单--获取所有菜单信息")
    public Result getAllMenu(@RequestBody @Validated PageParams pageParams, BindingResult result) {
        if (result.hasErrors()) {
            return Result.validateError(result);
        }
        return menuService.getAllMenu(pageParams);
    }

    @GetMapping("submitMenuIcon")
    @Operation(summary = "菜单--上传菜单图标")
    @SaCheckRole(value = UseConstant.ROLE_SUPER_ADMIN)
    public Result submitMenuIcon(@RequestParam("icon") @Schema(name = "icon", description = "菜单图标") MultipartFile icon) {
        return menuService.submitMenuIcon(icon);
    }

    @PostMapping("insertMenu")
    @Operation(summary = "菜单--新增菜单信息")
    @SaCheckRole(value = UseConstant.ROLE_SUPER_ADMIN)
    public Result insertMenu(@RequestBody @Validated MenuAuthority menuAuthority, BindingResult result) {
        if (result.hasErrors()) {
            return Result.validateError(result);
        }
        return menuService.insertMenu(menuAuthority);
    }

    @PutMapping("updateMenu")
    @Operation(summary = "菜单--修改菜单信息")
    @SaCheckRole(value = UseConstant.ROLE_SUPER_ADMIN)
    public Result updateMenu(@RequestBody @Validated MenuAuthority menuAuthority, BindingResult result) {
        if (result.hasErrors()) {
            return Result.validateError(result);
        }
        return menuService.updateMenu(menuAuthority);
    }

    @PutMapping("hiddenMenu/{menuId}/{visible}")
    @Operation(summary = "菜单--显示/隐藏菜单")
    @SaCheckRole(value = UseConstant.ROLE_SUPER_ADMIN)
    public Result hiddenMenu(
            @PathVariable("menuId") @Schema(name = "menuId", description = "菜单ID") Long menuId,
            @PathVariable("visible") @Schema(name = "visible", description = "显示/隐藏") Byte visible
    ) {
        return menuService.hiddenMenu(menuId, visible);
    }

    @DeleteMapping("deleteMenu")
    @Operation(summary = "菜单--删除菜单")
    @SaCheckRole(value = UseConstant.ROLE_SUPER_ADMIN)
    public Result deleteMenu(@RequestBody List<Long> menuIds) {
        return menuService.deleteMenu(menuIds);
    }

    @PostMapping("giveRoleMenu")
    @Operation(summary = "菜单--赋予角色菜单权限")
    @SaCheckRole(value = UseConstant.ROLE_SUPER_ADMIN)
    public Result giveRoleMenu(@RequestBody @Validated RoleMenuParams roleMenuParams, BindingResult result) {
        if (result.hasErrors()) {
            return Result.validateError(result);
        }
        return menuService.giveRoleMenu(roleMenuParams);
    }
}
