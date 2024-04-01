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
 * ClassName: VideoSchedule
 * Package: cn.mju.wjh.common.core.entity.pojo.video
 * Description: 视频进度表实体类
 *
 * @Author:wjh
 * @Create:2023-12-2023/12/7--14:36
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@Accessors(chain = true)
@TableName("video_schedule")
@Schema(name = "VideoSchedule", description = "视频进度表")
public class VideoSchedule implements Serializable {

    @Serial
    private static final long serialVersionUID = 1L;

    @TableId(value = "video_schedule_id", type = IdType.AUTO)
    @Schema(name = "videoScheduleId", description = "视频进度ID")
    private Long videoScheduleId;

    @TableField(value = "user_id")
    @Schema(name = "userId", description = "用户ID")
    private Long userId;

    @TableField(value = "video_id")
    @Schema(name = "videoId", description = "视频ID")
    private Long videoId;

    @TableField(value = "course_id")
    @Schema(name = "courseId", description = "课程ID")
    private Long courseId;

    @TableField(value = "video_name")
    @Schema(name = "videoName", description = "视频名称")
    private String videoName;

    @TableField(value = "video_image")
    @Schema(name = "videoImage", description = "视频封面")
    private String videoImage;

    @TableField(value = "watch_duration")
    @Schema(name = "watchDuration", description = "观看时长")
    private Long watchDuration;

    @TableField(value = "create_time")
    @Schema(name = "createTime", description = "创建时间")
    @JsonFormat(pattern = "yyyy-MM-dd",timezone = "GMT-8")
    private Timestamp createTime;

    @TableField(value = "update_time")
    @Schema(name = "updateTime", description = "修改时间")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss",timezone = "GMT-8")
    private Timestamp updateTime;

    @TableField(exist = false)
    @Schema(name = "payMoney", description = "购买金额")
    private Double payMoney;
}
