package cn.mju.wjh.common.core.entity.pojo.user;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
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
 * ClassName: RoleMenu
 * Package: cn.mju.wjh.common.core.entity.pojo
 * Description: 角色菜单关联表实体类
 *
 * @Author:wjh
 * @Create:2023-12-2023/12/7--14:06
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@Accessors(chain = true)
@TableName("role_menu")
@Schema(name = "RoleMenu", description = "角色菜单关联表")
public class RoleMenu implements Serializable {

    @Serial
    private static final long serialVersionUID = 1L;

    @TableId(value = "role_menu_id", type = IdType.AUTO)
    @Schema(name = "roleMenuId", description = "角色菜单ID")
    private Long roleMenuId;

    @TableField(value = "role_id")
    @Schema(name = "roleId", description = "角色ID")
    private Long roleId;

    @TableField(value = "menu_id")
    @Schema(name = "menuId", description = "菜单ID")
    private Long menuId;

    @TableField(value = "creator")
    @Schema(name = "creator", description = "创建者")
    private String creator;

    @TableField(value = "updater")
    @Schema(name = "updater", description = "更新者")
    private String updater;

    @TableField(value = "create_time")
    @Schema(name = "createTime", description = "创建时间")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss",timezone = "GMT-8")
    private Timestamp createTime;

    @TableField(value = "update_time")
    @Schema(name = "updateTime", description = "更新时间")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss",timezone = "GMT-8")
    private Timestamp updateTime;

    @TableField(value = "is_delete")
    @Schema(name = "isDelete", description = "是否删除(0:正常、1:删除)")
    private Byte isDelete;
}
