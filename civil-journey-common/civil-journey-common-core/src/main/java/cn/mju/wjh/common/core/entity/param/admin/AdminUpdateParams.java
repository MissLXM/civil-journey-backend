package cn.mju.wjh.common.core.entity.param.admin;

import io.swagger.v3.oas.annotations.media.Schema;
import jakarta.validation.constraints.Email;
import lombok.Data;

/**
 * ClassName: AdminUpdateParams
 * Package: cn.mju.wjh.common.core.entity.param.admin
 * Description: 管理员修改参数
 *
 * @Author:wjh
 * @Create:2023-12-2023/12/14--14:49
 */

@Data
@Schema(name = "AdminUpdateParams", description = "管理员修改参数")
public class AdminUpdateParams {

    @Schema(name = "adminId", description = "管理员ID")
    private Long adminId;

    @Schema(name = "username", description = "管理员账号")
    private String username;

    @Schema(name = "nickname", description = "管理员昵称")
    private String nickname;

    @Schema(name = "gender",description = "用户性别")
    private String gender;

    @Email
    @Schema(name = "adminEmail", description = "管理员邮箱")
    private String adminEmail;

    @Schema(name = "signature", description = "管理员个性签名")
    private String signature;
}