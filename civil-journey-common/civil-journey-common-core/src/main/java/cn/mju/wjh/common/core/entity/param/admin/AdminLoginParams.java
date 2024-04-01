package cn.mju.wjh.common.core.entity.param.admin;

import io.swagger.v3.oas.annotations.media.Schema;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;
import lombok.Data;

/**
 * ClassName: AdminLoginParams
 * Package: cn.mju.wjh.common.core.entity.param.admin
 * Description: 管理员登录参数
 *
 * @Author:wjh
 * @Create:2024-03-2024/3/10--12:53
 */
@Data
@Schema(name = "AdminLoginParams", description = "管理员登录参数")
public class AdminLoginParams {

    @NotBlank
    @Size(min = 3, max = 12)
    @Schema(name = "username", description = "登录名称")
    private String username;

    @NotBlank
    @Size(min = 1, max = 18)
    @Schema(name = "password", description = "登录密码")
    private String password;

    @NotBlank
    @Schema(name = "captchaCode", description = "验证码")
    private String captchaCode;

    @NotBlank
    @Schema(name = "captchaVoucher", description = "验证码凭证")
    private String captchaVoucher;

}
