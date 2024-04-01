package cn.mju.wjh.common.core.entity.param.user;

import io.swagger.v3.oas.annotations.media.Schema;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;
import lombok.Data;

/**
 * ClassName: LoginEmailParams
 * Package: cn.mju.wjh.common.core.entity.param
 * Description: 登录参数(邮箱)
 *
 * @Author:wjh
 * @Create:2023-12-2023/12/11--15:14
 */
@Data
@Schema(name = "LoginEmailParams", description = "登录参数")
public class LoginEmailParams {

    @Email
    @Schema(name = "userEmail", description = "用户邮箱")
    private String userEmail;

    @NotBlank
    @Size(min = 1, max = 6)
    @Schema(name = "emailCode", description = "邮箱验证码")
    private String emailCode;
}
