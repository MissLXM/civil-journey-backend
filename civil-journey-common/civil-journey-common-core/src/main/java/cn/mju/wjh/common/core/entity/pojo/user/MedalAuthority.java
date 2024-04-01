package cn.mju.wjh.common.core.entity.pojo.user;

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
 * ClassName: MedalAuthority
 * Package: cn.mju.wjh.common.core.entity.pojo
 * Description: 勋章权限表实体类
 *
 * @Author:wjh
 * @Create:2023-12-2023/12/7--13:49
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@Accessors(chain = true)
@TableName("medal_authority")
@Schema(name = "MedalAuthority", description = "勋章权限表")
public class MedalAuthority implements Serializable {

    @Serial
    private static final long serialVersionUID = 1L;

    @TableId(value = "medal_id", type = IdType.AUTO)
    @Schema(name = "medalId", description = "勋章ID")
    private Long medalId;

    @TableField(value = "medal_name")
    @Schema(name = "medalName", description = "勋章名称")
    private String medalName;

    @TableField(value = "medal_icon")
    @Schema(name = "medalIcon", description = "勋章图标")
    private String medalIcon;

    @TableField(value = "medal_level")
    @Schema(name = "medalLevel", description = "勋章级别")
    private Integer medalLevel;

    @TableField(value = "medal_explain")
    @Schema(name = "medalExplain", description = "勋章说明")
    private String medalExplain;

    @TableField(value = "view_video_number")
    @Schema(name = "viewVideoNumber", description = "免费观看视频次数")
    private Integer viewVideoNumber;

    @TableField(value = "total_hold_number")
    @Schema(name = "totalHoldNumber", description = "总持有人数")
    private Long totalHoldNumber;

    @TableField(value = "creator")
    @Schema(name = "creator", description = "创建者")
    private String creator;

    @TableField(value = "updater")
    @Schema(name = "updater", description = "更新者")
    private String updater;

    @TableField(value = "create_time")
    @Schema(name = "createTime", description = "创建时间")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm",timezone = "GMT-8")
    private Timestamp createTime;

    @TableField(value = "update_time")
    @Schema(name = "updateTime", description = "更新时间")
    @JsonFormat(pattern = "yyyy-MM-dd",timezone = "GMT-8")
    private Timestamp updateTime;

    @TableField(value = "is_delete")
    @Schema(name = "isDelete", description = "是否删除(0:正常、1:删除--有持有人数不能删除)")
    private Byte isDelete;
}