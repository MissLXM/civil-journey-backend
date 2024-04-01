package cn.mju.wjh.common.core.entity.param.admin;

import cn.mju.wjh.common.core.entity.param.PageParams;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * ClassName: AdminQueryParams
 * Package: cn.mju.wjh.common.core.entity.param.admin
 * Description: 管理员查询参数
 *
 * @Author:wjh
 * @Create:2023-12-2023/12/14--10:07
 */
@Data
@EqualsAndHashCode(callSuper = true)
@Schema(name = "AdminInQueryParams", description = "管理员查询参数")
public class AdminQueryParams extends PageParams {

    @Schema(name = "nickname", description = "管理员昵称")
    private String nickname;

    @Schema(name = "adminEmail", description = "管理员邮箱")
    private String adminEmail;

    @Schema(name = "adminRole", description = "管理员角色")
    private String adminRole;

}
