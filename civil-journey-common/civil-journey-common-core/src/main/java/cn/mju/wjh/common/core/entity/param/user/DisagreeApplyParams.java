package cn.mju.wjh.common.core.entity.param.user;

import io.swagger.v3.oas.annotations.media.Schema;
import jakarta.validation.constraints.NotBlank;
import lombok.Data;

/**
 * ClassName: DisagreeApplyParams
 * Package: cn.mju.wjh.common.core.entity.param
 * Description: 不同意申请参数
 *
 * @Author:wjh
 * @Create:2023-12-2023/12/17--15:08
 */
@Data
@Schema(name = "DisagreeApplyParams", description = "不同意申请参数")
public class DisagreeApplyParams {

    @NotBlank
    @Schema(name = "userId", description = "用户ID")
    private String userId;

    @NotBlank
    @Schema(name = "auditFailureReason", description = "审核失败原因")
    private String auditFailureReason;

}
