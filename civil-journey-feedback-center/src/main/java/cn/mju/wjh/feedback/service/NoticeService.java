package cn.mju.wjh.feedback.service;

import cn.mju.wjh.common.core.entity.param.PageParams;
import cn.mju.wjh.common.core.entity.param.notice.NoticeQueryParams;
import cn.mju.wjh.common.core.entity.pojo.notice.NoticeUser;
import cn.mju.wjh.common.core.utils.Result;

import java.util.List;

/**
 * ClassName: NoticeService
 * Package: cn.mju.wjh.feedback.service
 * Description: 通知服务接口
 *
 * @Author:wjh
 * @Create:2024-02-2024/2/1--13:44
 */
public interface NoticeService {

    /**
     * 获取用户通知信息
     * @return 通知信息
     */
    Result getUserNotice(PageParams pageParams);

    /**
     * 获取用户通知信息条数
     * @return 通知信息条数
     */
    Result getUserNoticeNumber();

    /**
     * 修改用户通知的状态
     * @return 是否修改成功
     */
    Result updateUserNoticeStatus(Long noticeUserId);

    /**
     * 获取所有通知信息
     * @param noticeQueryParams 通知查询参数
     * @return 通知信息
     */
    Result getAllNotice(NoticeQueryParams noticeQueryParams);

    /**
     * 发布通知
     * @param noticeUser 通知信息
     * @return 是否发布成功
     */
    Result releaseNotice(NoticeUser noticeUser);

    /**
     * 删除通知
     * @param noticeUserIds 通知ID
     * @return 是否操作成功
     */
    Result deleteNotice(List<Long> noticeUserIds);
}
