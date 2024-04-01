package cn.mju.wjh.common.core.entity.param;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

/**
 * ClassName: UploadParams
 * Package: cn.mju.wjh.common.core.entity.param
 * Description: 上传参数
 *
 * @Author:wjh
 * @Create:2024-03-2024/3/3--13:42
 */
@Data
@Schema(name = "UploadParams", description = "上传参数")
public class UploadParams {

    @Schema(name = "username", description = "登录名称")
    private String username;

    @Schema(name = "tagName", description = "文章类型")
    private String tagName;
}
