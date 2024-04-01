package cn.mju.wjh.common.core.entity.param.user;

import io.swagger.v3.oas.annotations.media.Schema;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;
import lombok.Data;

/**
 * ClassName: LoginUsernameParams
 * Package: cn.mju.wjh.common.core.entity.param
 * Description: 登录参数(登录名称)
 *
 * @Author:wjh
 * @Create:2023-12-2023/12/11--14:38
 */
@Data
@Schema(name = "LoginUsernameParams", description = "登录参数")
public class LoginUsernameParams {

    @NotBlank
    @Size(min = 3, max = 12)
    @Schema(name = "username", description = "登录名称")
    private String username;

    @NotBlank
    @Size(min = 1, max = 18)
    @Schema(name = "password", description = "登录密码")
    private String password;

}
