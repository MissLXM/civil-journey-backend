package cn.mju.wjh.common.core.entity.vo.user;

import com.fasterxml.jackson.annotation.JsonInclude;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;

/**
 * ClassName: MedalInfoVo
 * Package: cn.mju.wjh.common.core.entity.vo
 * Description: 勋章信息回显类
 *
 * @Author:wjh
 * @Create:2023-12-2023/12/13--16:36
 */
@Data
@Accessors(chain = true)
@NoArgsConstructor
@AllArgsConstructor
@Schema(name = "MedalInfoVo",description = "勋章信息回显")
public class MedalInfoVo {

    @Schema(name = "medalName", description = "勋章名称")
    private String medalName;

    @Schema(name = "medalIcon", description = "勋章图标")
    private String medalIcon;

    @JsonInclude(JsonInclude.Include.NON_NULL)
    @Schema(name = "medalLevel", description = "勋章级别")
    private Integer medalLevel;

    @Schema(name = "medalExplain", description = "勋章说明")
    private String medalExplain;
}
