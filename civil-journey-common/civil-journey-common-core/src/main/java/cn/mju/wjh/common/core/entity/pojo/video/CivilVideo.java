package cn.mju.wjh.common.core.entity.pojo.video;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.fasterxml.jackson.annotation.JsonFormat;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;

import java.io.Serial;
import java.io.Serializable;
import java.sql.Timestamp;

/**
 * ClassName: CivilVideo
 * Package: cn.mju.wjh.common.core.entity.pojo.video
 * Description: 视频表实体类
 *
 * @Author:wjh
 * @Create:2023-12-2023/12/7--14:26
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@Accessors(chain = true)
@TableName("civil_video")
@Schema(name = "CivilVideo", description = "视频表")
public class CivilVideo implements Serializable {

    @Serial
    private static final long serialVersionUID = 1L;

    @TableId(value = "video_id", type = IdType.AUTO)
    @Schema(name = "videoId", description = "视频ID")
    private Long videoId;

    @TableField(value = "course_id")
    @Schema(name = "courseId", description = "课程ID")
    private Long courseId;

    @TableField(value = "video_name")
    @Schema(name = "videoName", description = "视频名称")
    private String videoName;

    @TableField(value = "video_link")
    @Schema(name = "videoLink", description = "视频链接")
    private String videoLink;

    @TableField(value = "video_image")
    @Schema(name = "videoImage", description = "视频封面")
    private String videoImage;

    @TableField(value = "video_preview")
    @Schema(name = "videoPreview", description = "视频预览")
    private String videoPreview;

    @TableField(value = "video_description")
    @Schema(name = "videoDescription", description = "视频描述")
    private String videoDescription;

    @TableField(value = "video_sort")
    @Schema(name = "videoSort", description = "课程内排序")
    private Integer videoSort;

    @TableField(value = "video_duration")
    @Schema(name = "videoDuration", description = "视频时长(秒)")
    private Long videoDuration;

    @TableField(value = "like_number")
    @Schema(name = "likeNumber", description = "点赞数")
    private Long likeNumber;

    @TableField(value = "browse_number")
    @Schema(name = "browseNumber", description = "浏览数")
    private Long browseNumber;

    @TableField(value = "create_time")
    @Schema(name = "createTime", description = "发布时间")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss",timezone = "GMT-8")
    private Timestamp createTime;
}
