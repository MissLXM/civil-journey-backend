package cn.mju.wjh.common.core.entity.pojo.user;

import com.baomidou.mybatisplus.annotation.*;
import com.fasterxml.jackson.annotation.JsonFormat;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;

import java.io.Serial;
import java.io.Serializable;
import java.sql.Timestamp;

/**
 * ClassName: MenuAuthority
 * Package: cn.mju.wjh.common.core.entity.pojo
 * Description: 菜单权限表实体类
 *
 * @Author:wjh
 * @Create:2023-12-2023/12/7--14:01
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@Accessors(chain = true)
@TableName("menu_authority")
@Schema(name = "MenuAuthority", description = "菜单权限表")
public class MenuAuthority implements Serializable {

    @Serial
    private static final long serialVersionUID = 1L;

    @TableId(value = "menu_id", type = IdType.AUTO)
    @Schema(name = "menuId", description = "菜单ID")
    private Long menuId;

    @TableField(value = "menu_parent_id")
    @Schema(name = "menuParentId", description = "父菜单ID")
    private Long menuParentId;

    @TableField(exist = false)
    @Schema(name = "menuParentName", description = "父菜单名称")
    private String menuParentName;

    @TableField(value = "menu_name")
    @Schema(name = "menuName", description = "菜单名称")
    private String menuName;

    @TableField(value = "show_sort")
    @Schema(name = "showSort", description = "显示顺序")
    private Integer showSort;

    @TableField(value = "router_path")
    @Schema(name = "routerPath", description = "路由路径")
    private String routerPath;

    @TableField(value = "menu_icon")
    @Schema(name = "menuIcon", description = "菜单图标")
    private String menuIcon;

    @TableField(value = "creator")
    @Schema(name = "creator", description = "创建者")
    private String creator;

    @TableField(value = "updater")
    @Schema(name = "updater", description = "更新者")
    private String updater;

    @TableField(value = "create_time")
    @Schema(name = "createTime", description = "创建时间")
    @JsonFormat(pattern = "yyyy-MM-dd",timezone = "GMT-8")
    private Timestamp createTime;

    @TableField(value = "update_time")
    @Schema(name = "updateTime", description = "更新时间")
    @JsonFormat(pattern = "yyyy-MM-dd",timezone = "GMT-8")
    private Timestamp updateTime;

    @TableField(value = "is_delete")
    @Schema(name = "isDelete", description = "是否删除(0:正常、1:删除)")
    private Byte isDelete;

}
