package cn.mju.wjh.common.core.entity.param.user;

import cn.mju.wjh.common.core.entity.param.PageParams;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * ClassName: UserQueryParams
 * Package: cn.mju.wjh.common.core.entity.param.user
 * Description: 用户查询参数
 *
 * @Author:wjh
 * @Create:2023-12-2023/12/14--19:46
 */
@Data
@EqualsAndHashCode(callSuper = true)
@Schema(name = "UserQueryParams", description = "用户查询参数")
public class UserQueryParams extends PageParams {

    @Schema(name = "username",description = "登录名称")
    private String username;

    @Schema(name = "userEmail",description = "用户邮箱")
    private String userEmail;

    @Schema(name = "nickname",description = "用户昵称")
    private String nickname;

    @Schema(name = "userRole", description = "用户角色")
    private String userRole;
}
