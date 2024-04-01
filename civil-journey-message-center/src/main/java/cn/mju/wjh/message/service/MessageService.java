package cn.mju.wjh.message.service;

import cn.mju.wjh.common.core.entity.param.PageParams;
import cn.mju.wjh.common.core.entity.param.technical.TechnicalQueryParams;
import cn.mju.wjh.common.core.entity.pojo.notice.CivilTechnical;
import cn.mju.wjh.common.core.entity.pojo.notice.ExamTime;
import cn.mju.wjh.common.core.utils.Result;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

/**
 * ClassName: MessageService
 * Package: cn.mju.wjh.message.service
 * Description: 资讯服务接口
 *
 * @Author:wjh
 * @Create:2024-01-2024/1/31--15:27
 */
public interface MessageService {

    /**
     * 获取考试时间资讯
     * @return 考试时间资讯
     */
    Result getExamTimeMessage();

    /**
     * 获取招考信息
     * @return 招考信息
     */
    Result getExamMessage();

    /**
     * 获取资讯详细信息
     * @param technicalId 资讯ID
     * @return 资讯详细信息
     */
    Result getMessageInfoById(Long technicalId);

    /**
     * 获取所有资讯
     * @param technicalQueryParams 资讯查询参数
     * @return 所有资讯
     */
    Result getAllMessage(TechnicalQueryParams technicalQueryParams);

    /**
     * 获取所有考试时间
     * @param pageParams 分页参数
     * @return 所有考试时间
     */
    Result getAllExamTime(PageParams pageParams);

    /**
     * 添加考试信息
     * @param examTime 考试信息
     * @return 是否操作成功
     */
    Result addExam(ExamTime examTime);

    /**
     * 更新考试信息
     * @param examTime 考试信息
     * @return 是否操作成功
     */
    Result updateExam(ExamTime examTime);

    /**
     * 删除考试信息
     * @param examTimeIds 考试信息ID
     * @return 是否操作成功
     */
    Result deleteExam(List<Long> examTimeIds);

    /**
     * 发布者资讯
     * @param technical 资讯信息
     * @return 是否操作成功
     */
    Result addMessage(CivilTechnical technical);

    /**
     * 更新资讯
     * @param technical 资讯信息
     * @return 是否操作成功
     */
    Result updateMessage(CivilTechnical technical);

    /**
     * 删除资讯
     * @param technicalIds 资讯ID
     * @return 是否操作成功
     */
    Result deleteMessage(List<Long> technicalIds);

    /**
     * 上传资讯图片
     * @param file 文件
     * @param username 登录名称
     * @return 地址
     */
    Result submitTechnicalImage(MultipartFile file, String username);
}
