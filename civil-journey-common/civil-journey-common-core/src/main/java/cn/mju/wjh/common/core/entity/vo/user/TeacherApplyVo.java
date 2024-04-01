package cn.mju.wjh.common.core.entity.vo.user;

import com.fasterxml.jackson.annotation.JsonInclude;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;

/**
 * ClassName: TeacherApplyVo
 * Package: cn.mju.wjh.common.core.entity.vo
 * Description: 讲师申请信息回显
 *
 * @Author:wjh
 * @Create:2023-12-2023/12/16--14:58
 */
@Data
@Accessors(chain = true)
@NoArgsConstructor
@AllArgsConstructor
@Schema(name = "TeacherApplyVo",description = "讲师申请信息回显")
public class TeacherApplyVo {

    @Schema(name = "teacherAuditId", description = "讲师申请ID")
    private Long teacherAuditId;

    @Schema(name = "username", description = "登录名称")
    private String username;

    @Schema(name = "userEmail",description = "用户邮箱")
    private String userEmail;

    @Schema(name = "nickname",description = "用户昵称")
    private String nickname;

    @Schema(name = "headPortrait",description = "用户头像")
    private String headPortrait;

    @JsonInclude(JsonInclude.Include.NON_NULL)
    @Schema(name = "certificatePhoto", description = "教资证书照片")
    private String certificatePhoto;

    @JsonInclude(JsonInclude.Include.NON_NULL)
    @Schema(name = "certificateNumber", description = "教资证书编号")
    private String certificateNumber;

    @JsonInclude(JsonInclude.Include.NON_NULL)
    @Schema(name = "auditFailureReason", description = "审核失败原因")
    private String auditFailureReason;

    @Schema(name = "status", description = "审核状态(0:待审核、1:审核成功、2:审核失败)")
    private Byte status;
}
