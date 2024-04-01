package cn.mju.wjh.common.core.entity.param.admin;

import io.swagger.v3.oas.annotations.media.Schema;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import lombok.Data;

/**
 * ClassName: AdminRegisterParams
 * Package: cn.mju.wjh.common.core.entity.param
 * Description: 管理员注册参数
 *
 * @Author:wjh
 * @Create:2023-12-2023/12/13--10:32
 */
@Data
@Schema(name = "AdminRegisterParams", description = "管理员注册参数")
public class AdminRegisterParams {

    @NotBlank
    @Size(min = 3, max = 12)
    @Schema(name = "username", description = "登录名称")
    private String username;

    @NotBlank
    @Size(min = 1, max = 18)
    @Schema(name = "password", description = "登录密码")
    private String password;

    @NotBlank
    @Size(min = 2, max = 15)
    @Schema(name = "nickname", description = "管理员昵称")
    private String nickname;

    @Email
    @Schema(name = "adminEmail", description = "管理员邮箱")
    private String adminEmail;

    @NotNull
    @Schema(name = "adminCode", description = "管理员角色代码(1:super-admin、2:admin)")
    private Long adminCode;
}
