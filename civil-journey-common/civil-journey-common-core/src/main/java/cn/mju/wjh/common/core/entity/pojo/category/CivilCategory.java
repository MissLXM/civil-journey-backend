package cn.mju.wjh.common.core.entity.pojo.category;

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
 * ClassName: CivilCategory
 * Package: cn.mju.wjh.common.core.entity.pojo
 * Description: 分类表实体类
 *
 * @Author:wjh
 * @Create:2023-12-2023/12/7--13:45
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@Accessors(chain = true)
@TableName("civil_category")
@Schema(name = "CivilCategory", description = "分类表")
public class CivilCategory implements Serializable {

    @Serial
    private static final long serialVersionUID = 1L;

    @TableId(value = "category_id", type = IdType.AUTO)
    @Schema(name = "categoryId", description = "分类ID")
    private Long categoryId;

    @TableField(value = "category_parent_id")
    @Schema(name = "categoryParentId", description = "父分类ID")
    private Long categoryParentId;

    @TableField(value = "category_name")
    @Schema(name = "categoryName", description = "分类名称")
    private String categoryName;

    @TableField(value = "creator")
    @Schema(name = "creator", description = "创建者")
    private String creator;

    @TableField(value = "updater")
    @Schema(name = "updater", description = "更新者")
    private String updater;

    @TableField(value = "create_time")
    @Schema(name = "createTime", description = "创建时间")
    @JsonFormat(pattern = "yyyy年MM月dd日 HH:mm",timezone = "GMT-8")
    private Timestamp createTime;

    @TableField(value = "update_time")
    @Schema(name = "updateTime", description = "更新时间")
    @JsonFormat(pattern = "yyyy年MM月dd日 HH:mm",timezone = "GMT-8")
    private Timestamp updateTime;

    @TableField(value = "is_delete")
    @Schema(name = "isDelete", description = "是否删除(0:正常、1:禁用、2:删除)")
    private Byte isDelete;
}