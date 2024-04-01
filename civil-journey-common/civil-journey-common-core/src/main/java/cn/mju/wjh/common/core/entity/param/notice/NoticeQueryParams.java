package cn.mju.wjh.common.core.entity.param.notice;

import cn.mju.wjh.common.core.entity.param.PageParams;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * ClassName: NoticeQueryParams
 * Package: cn.mju.wjh.common.core.entity.param.notice
 * Description: 通知查询参数
 *
 * @Author:wjh
 * @Create:2024-03-2024/3/14--12:08
 */
@Data
@EqualsAndHashCode(callSuper = true)
@Schema(name = "NoticeQueryParams", description = "通知查询参数")
public class NoticeQueryParams extends PageParams {

    @Schema(name = "noticeTitle", description = "通知标题")
    private String noticeTitle;

    @Schema(name = "typeId", description = "通知类型(1、系统通知,2、邮箱通知)")
    private Long typeId;

    @Schema(name = "senderName", description = "发布者")
    private String senderName;
}
