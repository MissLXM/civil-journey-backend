package cn.mju.wjh.user.service;

import cn.mju.wjh.common.core.entity.param.PageParams;
import cn.mju.wjh.common.core.entity.pojo.user.TeacherAudit;
import cn.mju.wjh.common.core.entity.pojo.user.CivilUser;
import cn.mju.wjh.common.core.utils.Result;
import org.springframework.web.multipart.MultipartFile;

/**
 * ClassName: UserService
 * Package: cn.mju.wjh.user.service
 * Description: 用户服务接口
 *
 * @Author:wjh
 * @Create:2023-12-2023/12/12--10:29
 */
public interface UserService {

    /**
     * 查询用户基本信息
     * @return 用户信息
     */
    Result queryUserInfo();

    /**
     * 修改用户基本信息
     * @param user 用户信息
     * @return 是否修改成功
     */
    Result updateUserInfo(CivilUser user);

    /**
     * 修改用户密码
     * @param password 新密码
     * @return 是否修改成功
     */
    Result updateUserPassword(String password);

    /**
     * 修改用户头像
     * @param avatarFile 头像文件
     * @param username 登录名称
     * @return 是否修改成功
     */
    Result updateUserAvatar(MultipartFile avatarFile, String username);

    /**
     * 申请讲师角色
     * @param teacher 申请材料信息
     * @return 申请提交是否成功
     */
    Result applyTeacherRole(TeacherAudit teacher);

    /**
     * 上传教师资格证书照片
     * @param file 图片文件
     * @param username 登录名称
     * @return 是否上传成功(成功: 返回地址)
     */
    Result submitTeacherCertificatePhoto(MultipartFile file, String username);

    /**
     * 查看讲师申请进度
     * @return 申请结果
     */
    Result teacherApplyReason();

    /**
     * 删除讲师申请
     * @return 是否删除成功
     */
    Result deleteTeacherApply();

    /**
     * 修改讲师简介
     * @param teacherIntroduction 讲师简介
     * @return 是否修改成功
     */
    Result updateTeacherIntroduction(String teacherIntroduction);

    /**
     * 默认展示前6条讲师
     * @return 讲师信息
     */
    Result getTeacher();

    /**
     * 获取讲师基本信息
     * @param teacherId 讲师ID
     * @return 讲师基本信息
     */
    Result getTeacherInfoById(Long teacherId);

    /**
     * 获取讲师历史课程信息
     * @param teacherId 讲师ID
     * @param pageParams 分页信息
     * @return 讲师历史课程信息
     */
    Result getTeacherHistoryCourseInfo(Long teacherId, PageParams pageParams);

    /**
     * 获取所有在线客服
     * @return 所有在线客服
     */
    Result getAllOnlineCustom();

    /**
     * 获取所有聊天记录
     * @param userId 用户ID
     * @param adminId 管理员ID
     * @return 所有聊天记录
     */
    Result getAllChatRecords(Long userId, Long adminId);

}
