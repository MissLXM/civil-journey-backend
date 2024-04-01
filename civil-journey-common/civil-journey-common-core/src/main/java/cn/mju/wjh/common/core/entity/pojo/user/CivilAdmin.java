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
 * ClassName: CivilAdmin
 * Package: cn.mju.wjh.common.core.entity.pojo
 * Description: 管理员表实体类
 *
 * @Author:wjh
 * @Create:2023-12-2023/12/6--20:18
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@Accessors(chain = true)
@TableName("civil_admin")
@Schema(name = "CivilAdmin", description = "管理员表")
public class CivilAdmin implements Serializable {

    @Serial
    private static final long serialVersionUID = 1L;

    @TableId(value = "admin_id", type = IdType.AUTO)
    @Schema(name = "adminId", description = "管理员ID")
    private Long adminId;

    @TableField(value = "username")
    @Schema(name = "username", description = "登录名称")
    private String username;

    @TableField(value = "password")
    @Schema(name = "password", description = "登录密码")
    private String password;

    @TableField(value = "signature")
    @Schema(name = "signature", description = "个性签名")
    private String signature;

    @TableField(value = "gender")
    @Schema(name = "gender",description = "用户性别")
    private String gender;

    @TableField(value = "nickname")
    @Schema(name = "nickname", description = "管理员昵称")
    private String nickname;

    @TableField(value = "admin_email")
    @Schema(name = "adminEmail", description = "管理员邮箱")
    private String adminEmail;

    @TableField(value = "head_portrait")
    @Schema(name = "headPortrait", description = "管理员头像")
    private String headPortrait;

    @TableField(value = "is_delete")
    @Schema(name = "isDelete",description = "是否删除(0:正常、1:禁用、2:删除)")
    private Byte isDelete;
}
