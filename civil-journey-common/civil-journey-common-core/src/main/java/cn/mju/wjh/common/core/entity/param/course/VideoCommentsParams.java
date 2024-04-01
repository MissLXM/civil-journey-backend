package cn.mju.wjh.common.core.entity.param.course;

import io.swagger.v3.oas.annotations.media.Schema;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import lombok.Data;

/**
 * ClassName: VideoCommentsParams
 * Package: cn.mju.wjh.common.core.entity.param.course
 * Description: 视频评论参数
 *
 * @Author:wjh
 * @Create:2024-03-2024/3/4--23:47
 */
@Data
@Schema(name = "ArticleCommentsParams", description = "视频评论参数")
public class VideoCommentsParams {

    @NotNull
    @Schema(name = "videoId", description = "视频ID")
    private Long videoId;

    @NotBlank
    @Schema(name = "commentContent", description = "评论内容")
    private String commentContent;

}
