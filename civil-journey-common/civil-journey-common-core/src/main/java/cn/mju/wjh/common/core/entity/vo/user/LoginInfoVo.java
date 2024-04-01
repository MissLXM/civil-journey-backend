package cn.mju.wjh.common.core.entity.vo.user;

import com.fasterxml.jackson.annotation.JsonInclude;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;

/**
 * ClassName: LoginInfoVo
 * Package: cn.mju.wjh.common.core.entity.vo.user
 * Description: 登录信息回显
 *
 * @Author:wjh
 * @Create:2024-01-2024/1/16--18:16
 */
@Data
@Accessors(chain = true)
@NoArgsConstructor
@AllArgsConstructor
@Schema(name = "LoginInfoVo",description = "登录信息回显")
public class LoginInfoVo {

    @Schema(name = "loginId",description = "当前会话ID")
    private String loginId;

    @Schema(name = "tokenName",description = "请求头中自定义token的键")
    private String tokenName;

    @Schema(name = "tokenValue",description = "请求头中自定义token的值")
    private String tokenValue;

    @Schema(name = "username",description = "登录名称")
    private String username;

    @Schema(name = "nickname",description = "用户昵称")
    private String nickname;

    @JsonInclude(JsonInclude.Include.NON_NULL)
    @Schema(name = "isTeacher",description = "是否为讲师")
    private Boolean isTeacher;

    @Schema(name = "headPortrait",description = "用户头像")
    private String headPortrait;
}
