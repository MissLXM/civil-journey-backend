package cn.mju.wjh.common.core.entity.vo.article;

import com.fasterxml.jackson.annotation.JsonFormat;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;

import java.sql.Timestamp;

/**
 * ClassName: ArticleCommentsVo
 * Package: cn.mju.wjh.common.core.entity.vo
 * Description: 文章评论回显
 *
 * @Author:wjh
 * @Create:2023-12-2023/12/25--9:10
 */
@Data
@Accessors(chain = true)
@NoArgsConstructor
@AllArgsConstructor
@Schema(name = "ArticleCommentsVo",description = "文章评论回显")
public class ArticleCommentsVo {

    @Schema(name = "commenterName", description = "评论者姓名")
    private String commenterName;

    @Schema(name = "commenterAvatar", description = "评论者头像")
    private String commenterAvatar;

    @Schema(name = "commentContent", description = "评论的内容")
    private String commentContent;

    @Schema(name = "commentTime", description = "评论日期")
    @JsonFormat(pattern = "yyyy年MM月dd日 HH:mm",timezone = "GMT-8")
    private Timestamp commentTime;

}
