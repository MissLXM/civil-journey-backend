package cn.mju.wjh.common.core.entity.pojo.video;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;

import java.io.Serializable;

/**
 * ClassName: VideoLike
 * Package: cn.mju.wjh.common.core.entity.pojo.video
 * Description: 视频点赞表实体类
 *
 * @Author:wjh
 * @Create:2023-12-2023/12/7--14:32
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@Accessors(chain = true)
@TableName("video_like")
@Schema(name = "VideoLike", description = "视频点赞表")
public class VideoLike implements Serializable {


    @TableId(value = "video_like_id", type = IdType.AUTO)
    @Schema(name = "videoLikeId", description = "点赞ID")
    private Long videoLikeId;

    @TableField(value = "user_id")
    @Schema(name = "userId", description = "用户ID")
    private Long userId;

    @TableField(value = "video_id")
    @Schema(name = "videoId", description = "视频ID")
    private Long videoId;

}
