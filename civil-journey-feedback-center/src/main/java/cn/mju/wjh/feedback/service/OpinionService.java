package cn.mju.wjh.feedback.service;

import cn.mju.wjh.common.core.entity.param.PageParams;
import cn.mju.wjh.common.core.utils.Result;

import java.util.List;

/**
 * ClassName: OpinionService
 * Package: cn.mju.wjh.feedback.service
 * Description: 意见反馈接口
 *
 * @Author:wjh
 * @Create:2024-02-2024/2/2--18:56
 */
public interface OpinionService {

    /**
     * 提交意见反馈
     * @param username 当前用户登录名称
     * @param message 意见信息
     * @return 是否操作成功
     */
    Result submitOpinion(String username, String message);

    /**
     * 获取所有反馈信息
     * @param pageParams 分页参数
     * @return 所有反馈信息
     */
    Result getAllOpinion(PageParams pageParams);

    /**
     * 删除反馈信息
     * @param opinionIds 反馈ID
     * @return 是否操作成功
     */
    Result deleteOpinion(List<Long> opinionIds);

    /**
     * 采纳用户反馈
     * @param opinionId 反馈ID
     * @param creator 反馈提出者
     * @return 是否操作成功
     */
    Result acceptOpinion(Long opinionId, String creator);

}
