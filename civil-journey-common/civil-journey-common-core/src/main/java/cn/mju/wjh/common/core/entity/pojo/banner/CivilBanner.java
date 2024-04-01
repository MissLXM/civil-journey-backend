package cn.mju.wjh.common.core.entity.pojo.banner;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;

import java.io.Serial;
import java.io.Serializable;

/**
 * ClassName: CivilBanner
 * Package: cn.mju.wjh.common.core.entity.pojo.banner
 * Description: 轮播图表
 *
 * @Author:wjh
 * @Create:2023-12-2023/12/21--17:19
 */
@Data@NoArgsConstructor
@AllArgsConstructor
@Accessors(chain = true)
@TableName("civil_banner")
@Schema(name = "CivilBanner", description = "轮播图表")
public class CivilBanner implements Serializable {

    @Serial
    private static final long serialVersionUID = 1L;

    @TableId(value = "banner_id", type = IdType.AUTO)
    @Schema(name = "bannerId", description = "轮播图ID")
    private Long bannerId;


    @TableField(value = "banner_url")
    @Schema(name = "bannerUrl", description = "地址地址")
    private String bannerUrl;

    @TableField(value = "banner_sort")
    @Schema(name = "bannerSort", description = "显示顺序")
    private Integer bannerSort;

    @TableField(value = "is_delete")
    @Schema(name = "isDelete", description = "是否删除(0:正常、1:禁用、2:删除)")
    private String isDelete;
}
