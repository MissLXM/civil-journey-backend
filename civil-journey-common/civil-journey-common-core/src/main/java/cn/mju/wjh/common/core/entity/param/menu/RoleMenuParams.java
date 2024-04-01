package cn.mju.wjh.common.core.entity.param.menu;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

/**
 * ClassName: RoleMenuParams
 * Package: cn.mju.wjh.common.core.entity.param.menu
 * Description: 赋予角色菜单权限参数
 *
 * @Author:wjh
 * @Create:2024-03-2024/3/26--14:38
 */
@Data
@Schema(name = "RoleMenuParams", description = "赋予角色菜单权限参数")
public class RoleMenuParams {

    @Schema(name = "roleId", description = "角色ID")
    private Long roleId;

    @Schema(name = "menuId", description = "菜单ID")
    private Long menuId;

    @Schema(name = "creator", description = "创建者")
    private String creator;

    @Schema(name = "updater", description = "更新者")
    private String updater;
}
