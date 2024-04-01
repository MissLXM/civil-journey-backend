package cn.mju.wjh.common.core.entity.param.user;

import io.swagger.v3.oas.annotations.media.Schema;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;
import lombok.Data;

/**
 * ClassName: UserRegisterParams
 * Package: cn.mju.wjh.common.core.entity.param
 * Description: 用户注册参数类
 *
 * @Author:wjh
 * @Create:2023-12-2023/12/9--14:02
 */
@Data
@Schema(name = "UserRegisterParams", description = "用户注册参数")
public class UserRegisterParams {

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
    @Schema(name = "nickname", description = "用户昵称")
    private String nickname;

    @Email
    @Schema(name = "userEmail", description = "用户邮箱")
    private String userEmail;

    @NotBlank
    @Schema(name = "emailCode", description = "邮箱验证码")
    private String emailCode;

}
