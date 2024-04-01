package cn.mju.wjh.common.core.entity.param.menu;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

/**
 * ClassName: MenuInsertParams
 * Package: cn.mju.wjh.common.core.entity.param
 * Description: 新增菜单参数
 *
 * @Author:wjh
 * @Create:2023-12-2023/12/19--9:45
 */
@Data
@Schema(name = "MenuInsertParams", description = "新增菜单参数")
public class MenuInsertParams {

    @Schema(name = "menuParentId", description = "父菜单ID")
    private Long menuParentId;

    @Schema(name = "menuName", description = "菜单名称")
    private String menuName;

    @Schema(name = "permission", description = "权限标识")
    private String permission;

    @Schema(name = "menuType", description = "菜单类型(0:目录、1:菜单)")
    private Byte menuType;

    @Schema(name = "routerPath", description = "路由路径")
    private String routerPath;

    @Schema(name = "menuIcon", description = "菜单图标")
    private String menuIcon;

}
