package cn.mju.wjh.common.core.entity.vo.course;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonInclude;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;

import java.sql.Timestamp;

/**
 * ClassName: VideoInfoVO
 * Package: cn.mju.wjh.common.core.entity.vo.course
 * Description: 视频信息回显
 *
 * @Author:wjh
 * @Create:2024-03-2024/3/4--19:53
 */
@Data
@Accessors(chain = true)
@NoArgsConstructor
@AllArgsConstructor
@Schema(name = "VideoInfoVO",description = "视频信息回显")
public class VideoInfoVO {

    @JsonInclude(JsonInclude.Include.NON_NULL)
    @Schema(name = "videoId", description = "视频ID")
    private Long videoId;

    @JsonInclude(JsonInclude.Include.NON_NULL)
    @Schema(name = "videoName", description = "视频名称")
    private String videoName;

    @JsonInclude(JsonInclude.Include.NON_NULL)
    @Schema(name = "videoLink", description = "视频链接")
    private String videoLink;

    @JsonInclude(JsonInclude.Include.NON_NULL)
    @Schema(name = "videoImage", description = "视频封面")
    private String videoImage;

    @JsonInclude(JsonInclude.Include.NON_NULL)
    @Schema(name = "videoPreview", description = "视频预览")
    private String videoPreview;

    @JsonInclude(JsonInclude.Include.NON_NULL)
    @Schema(name = "likeNumber", description = "点赞数")
    private Long likeNumber;

    @JsonInclude(JsonInclude.Include.NON_NULL)
    @Schema(name = "browseNumber", description = "浏览数")
    private Long browseNumber;

    @Schema(name = "videoDuration", description = "视频时长(秒)")
    private Long videoDuration;

    @JsonInclude(JsonInclude.Include.NON_NULL)
    @Schema(name = "isLike", description = "是否点赞")
    private Byte isLike;

    @Schema(name = "createTime", description = "发布时间")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm",timezone = "GMT-8")
    private Timestamp createTime;

}
