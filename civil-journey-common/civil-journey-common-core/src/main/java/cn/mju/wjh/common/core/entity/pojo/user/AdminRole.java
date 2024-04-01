package cn.mju.wjh.common.core.entity.pojo.user;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;

import java.io.Serial;
import java.io.Serializable;

/**
 * ClassName: AdminRole
 * Package: cn.mju.wjh.common.core.entity.pojo.user
 * Description: 管理员角色实体类
 *
 * @Author:wjh
 * @Create:2023-12-2023/12/13--10:20
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@Accessors(chain = true)
@TableName("admin_role")
@Schema(name = "AdminRole", description = "管理员角色表")
public class AdminRole implements Serializable {

    @Serial
    private static final long serialVersionUID = 1L;

    @TableId(value = "admin_role_id", type = IdType.AUTO)
    @Schema(name = "adminRoleId", description = "管理员角色ID")
    private Long adminRoleId;

    @TableField(value = "admin_id")
    @Schema(name = "adminId", description = "管理员ID")
    private Long adminId;

    @TableField(value = "role_id")
    @Schema(name = "roleId", description = "角色ID")
    private Long roleId;
}
