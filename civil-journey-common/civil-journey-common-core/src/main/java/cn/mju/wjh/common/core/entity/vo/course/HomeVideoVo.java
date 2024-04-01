package cn.mju.wjh.common.core.entity.vo.course;

import com.fasterxml.jackson.annotation.JsonFormat;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;

import java.sql.Timestamp;

/**
 * ClassName: HomeVideoVo
 * Package: cn.mju.wjh.common.core.entity.vo.course
 * Description: 视频信息回显
 *
 * @Author:wjh
 * @Create:2024-01-2024/1/27--14:02
 */
@Data
@Accessors(chain = true)
@NoArgsConstructor
@AllArgsConstructor
@Schema(name = "HomeVideoVo",description = "视频信息回显")
public class HomeVideoVo {

    @Schema(name = "videoId", description = "视频ID")
    private Long videoId;

    @Schema(name = "courseId", description = "课程ID")
    private Long courseId;

    @Schema(name = "videoImage", description = "视频封面")
    private String videoImage;

    @Schema(name = "videoPreview", description = "视频预览")
    private String videoPreview;

    @Schema(name = "videoDescription", description = "视频描述")
    private String videoDescription;

    @Schema(name = "isShowCover", description = "是否展示封面")
    private Boolean isShowCover=true;

    @Schema(name = "creatorName", description = "发布者名称")
    private String creatorName;

    @Schema(name = "payMoney", description = "购买金额")
    private Double payMoney;

    @Schema(name = "createTime", description = "发布时间")
    @JsonFormat(pattern = "yyyy-MM-dd",timezone = "GMT-8")
    private Timestamp createTime;
}
