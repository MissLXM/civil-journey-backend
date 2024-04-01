package cn.mju.wjh.common.core.entity.vo.menu;

import com.fasterxml.jackson.annotation.JsonInclude;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;

import java.util.List;

/**
 * ClassName: AsideMenuVo
 * Package: cn.mju.wjh.common.core.entity.vo
 * Description: 侧边菜单回显
 *
 * @Author:wjh
 * @Create:2023-12-2023/12/18--15:18
 */
@Data
@Accessors(chain = true)
@NoArgsConstructor
@AllArgsConstructor
@Schema(name = "AsideMenuVo",description = "侧边菜单回显")
public class AsideMenuVo {

    @Schema(name = "menuId", description = "菜单ID")
    private Long menuId;

    @Schema(name = "menuName", description = "菜单名称")
    private String menuName;

    @Schema(name = "routerPath", description = "菜单路由")
    private String routerPath;

    @Schema(name = "menuIcon", description = "菜单图标")
    private String menuIcon;

    @JsonInclude(JsonInclude.Include.NON_NULL)
    @Schema(name = "childrenMenu", description = "子菜单")
    private List<AsideMenuVo> childrenMenu;

}
