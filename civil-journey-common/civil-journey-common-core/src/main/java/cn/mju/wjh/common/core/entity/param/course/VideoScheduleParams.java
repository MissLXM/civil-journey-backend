package cn.mju.wjh.common.core.entity.param.course;

import io.swagger.v3.oas.annotations.media.Schema;
import jakarta.validation.constraints.NotNull;
import lombok.Data;

/**
 * ClassName: VideoScheduleParams
 * Package: cn.mju.wjh.common.core.entity.param.course
 * Description: 视频播放记录参数
 *
 * @Author:wjh
 * @Create:2024-03-2024/3/5--20:33
 */
@Data
@Schema(name = "VideoScheduleParams", description = "视频播放记录参数")
public class VideoScheduleParams {

    @NotNull
    @Schema(name = "videoId", description = "视频ID")
    private Long videoId;

    @NotNull
    @Schema(name = "videoDuration", description = "视频播放时长")
    private Long videoDuration;
}
