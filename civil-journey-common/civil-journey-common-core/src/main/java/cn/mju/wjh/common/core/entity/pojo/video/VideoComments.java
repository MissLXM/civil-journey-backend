package cn.mju.wjh.common.core.entity.pojo.video;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonInclude;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;

import java.io.Serial;
import java.io.Serializable;
import java.sql.Timestamp;

/**
 * ClassName: VideoComments
 * Package: cn.mju.wjh.common.core.entity.pojo.video
 * Description: 视频评论表实体类
 *
 * @Author:wjh
 * @Create:2023-12-2023/12/7--14:40
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@Accessors(chain = true)
@TableName("video_comments")
@Schema(name = "VideoComments", description = "视频评论表")
public class VideoComments implements Serializable {

    @Serial
    private static final long serialVersionUID = 1L;

    @JsonInclude(JsonInclude.Include.NON_NULL)
    @TableId(value = "video_comment_id", type = IdType.AUTO)
    @Schema(name = "videoCommentId", description = "视频评论ID")
    private Long videoCommentId;

    @TableField(value = "video_id")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    @Schema(name = "videoId", description = "视频ID")
    private Long videoId;

    @TableField(value = "user_id")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    @Schema(name = "userId", description = "评论者ID")
    private Long userId;

    @TableField(value = "commenter_name")
    @Schema(name = "commenterName", description = "评论者姓名")
    private String commenterName;

    @TableField(value = "comment_content")
    @Schema(name = "commentContent", description = "评论的内容")
    private String commentContent;

    @TableField(value = "commenter_avatar")
    @Schema(name = "commenterAvatar", description = "评论者头像")
    private String commenterAvatar;

    @TableField(value = "comment_time")
    @Schema(name = "commentTime", description = "评论日期")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm",timezone = "GMT-8")
    private Timestamp commentTime;
}
