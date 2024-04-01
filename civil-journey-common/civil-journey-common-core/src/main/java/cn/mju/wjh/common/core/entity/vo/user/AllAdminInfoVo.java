package cn.mju.wjh.common.core.entity.vo.user;

import com.fasterxml.jackson.annotation.JsonInclude;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;

/**
 * ClassName: AllAdminInfoVo
 * Package: cn.mju.wjh.common.core.entity.vo
 * Description: 所有管理员信息回显
 *
 * @Author:wjh
 * @Create:2023-12-2023/12/14--10:39
 */
@Data
@Accessors(chain = true)
@NoArgsConstructor
@AllArgsConstructor
@Schema(name = "AllAdminInfoVo",description = "所有管理员信息回显")
public class AllAdminInfoVo {

    @Schema(name = "adminId", description = "管理员ID")
    private Long adminId;

    @Schema(name = "username", description = "管理员账号")
    private String username;

    @Schema(name = "nickname", description = "管理员昵称")
    private String nickname;

    @Schema(name = "adminEmail", description = "管理员邮箱")
    private String adminEmail;

    @Schema(name = "headPortrait", description = "管理员头像")
    private String headPortrait;

    @Schema(name = "gender",description = "用户性别")
    private String gender;

    @Schema(name = "adminRole", description = "管理员角色")
    private String adminRole;

    @JsonInclude(JsonInclude.Include.NON_NULL)
    @Schema(name = "isDelete", description = "管理员状态")
    private Byte isDelete;
}
