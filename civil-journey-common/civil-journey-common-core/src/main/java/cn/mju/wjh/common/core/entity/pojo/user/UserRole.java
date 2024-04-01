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
 * ClassName: UserRole
 * Package: cn.mju.wjh.common.core.entity.pojo
 * Description: 用户角色表实体类
 *
 * @Author:wjh
 * @Create:2023-12-2023/12/6--20:09
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@Accessors(chain = true)
@TableName("user_role")
@Schema(name = "UserRole", description = "用户角色表")
public class UserRole implements Serializable {

    @Serial
    private static final long serialVersionUID = 1L;

    @TableId(value = "user_role_id", type = IdType.AUTO)
    @Schema(name = "userRoleId", description = "用户角色ID")
    private Long userRoleId;

    @TableField(value = "user_id")
    @Schema(name = "userId", description = "用户ID")
    private Long userId;

    @TableField(value = "role_id")
    @Schema(name = "roleId", description = "角色ID")
    private Long roleId;
}
