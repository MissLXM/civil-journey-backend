package cn.mju.wjh.user.service;

import cn.mju.wjh.common.core.entity.param.user.DisagreeApplyParams;
import cn.mju.wjh.common.core.entity.param.PageParams;
import cn.mju.wjh.common.core.entity.param.admin.AdminQueryParams;
import cn.mju.wjh.common.core.entity.param.admin.AdminUpdateParams;
import cn.mju.wjh.common.core.entity.param.user.UserQueryParams;
import cn.mju.wjh.common.core.entity.pojo.user.CivilAdmin;
import cn.mju.wjh.common.core.entity.pojo.user.CivilRole;
import cn.mju.wjh.common.core.entity.pojo.user.CivilUser;
import cn.mju.wjh.common.core.entity.pojo.user.MedalAuthority;
import cn.mju.wjh.common.core.utils.Result;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

/**
 * ClassName: AdminService
 * Package: cn.mju.wjh.user.service
 * Description: 管理员服务接口
 *
 * @Author:wjh
 * @Create:2023-12-2023/12/14--10:00
 */
public interface AdminService {

    /**
     * 查询当前登录管理员的信息
     * @return 管理员信息
     */
    Result adminInfo();

    /**
     * 修改当前登录管理员信息
     * @param adminUpdateParams 修改信息
     * @return 修改结果
     */
    Result updateAdminInfo(AdminUpdateParams adminUpdateParams);

    /**
     * 修改当前登录管理员密码
     * @param password 密码
     * @return 是否修改成功
     */
    Result updateAdminPassword(String password);

    /**
     * 修改当前登录管理员头像
     * @param file 头像文件
     * @param username 用户名
     * @return 是否修改成功
     */
    Result updateAdminAvatar(MultipartFile file, String username);

    /**
     * 管理员重置密码(超管权限,密码:123456)
     * @param adminIds 管理员ID列表
     * @return 是否重置成功
     */
    Result updateAdminPasswordOfAdmin(List<Long> adminIds);

    /**
     * 修改管理员信息(超管权限)
     * @param civilAdmin 管理员信息
     * @return 是否修改成功
     */
    Result updateAdminInfoOfSuperAdmin(CivilAdmin civilAdmin);

    /**
     * 启用/禁用管理员--设置状态(超管权限)
     * @param adminId 管理员ID
     * @param isDelete 状态
     * @return 是否成功
     */
    Result forBiddenAdminOfSuperAdmin(Long adminId, Byte isDelete);

    /**
     * 删除管理员--设置状态(超管权限-(可多删除))
     * @param adminIds 管理员ID列表
     * @return 是否删除成功
     */
    Result deleteAdminOfSuperAdmin(List<Long> adminIds);

    /**
     * 查询管理员信息(带分页、参数--角色)
     * @param adminQueryParams  查询参数
     * @return 查询的管理员信息
     */
    Result adminInfoByRole(AdminQueryParams adminQueryParams);

    /**
     * 查询管理员信息(带分页、参数--昵称、邮箱)
     * @param adminQueryParams 查询参数
     * @return 查询的管理员信息
     */
    Result adminInfoByNicknameOrEmail(AdminQueryParams adminQueryParams);

    /**
     * 新增用户(默认密码:123456)
     * @param user 用户信息
     * @return 是否新增成功
     */
    Result insertUserOfSuperAdmin(CivilUser user);

    /**
     * 重置用户密码(密码:123456)
     * @param userIds 用户ID列表
     * @return 是否重置成功
     */
    Result updateUserPasswordOfAdmin(List<Long> userIds);

    /**
     * 修改用户信息
     * @param user 用户信息
     * @return 是否修改成功
     */
    Result updateUserInfoOfAdmin(CivilUser user);

    /**
     * 启用/禁用用户
     * @param userId 用户ID
     * @param isDelete 状态
     * @return 是否成功
     */
    Result deleteUserInfoOfAdmin(Long userId, Byte isDelete);

    /**
     * 删除用户--设置状态(可多删除)
     * @param userIds 用户ID列表
     * @return 是否删除成功
     */
    Result deleteUserOfAdmin(List<Long> userIds);

    /**
     * 查询用户(角色:用户、讲师)
     * @param userQueryParams 用户参数
     * @return 查询的用户信息
     */
    Result userInfoByUserRole(UserQueryParams userQueryParams);

    /**
     * 查询用户(邮箱查询、登录名称查询、昵称查询、所有查询)
     * @param userQueryParams 用户参数
     * @return 查询的用户信息
     */
    Result userInfoByUsernameOrEmailOrNickname(UserQueryParams userQueryParams);

    /**
     * 查询用户(拥有的所有勋章信息)
     * @return 用户拥有的勋章信息
     */
    Result userMedalInfo(Long userId);

    /**
     * 查询角色登录日志
     * @param userQueryParams 查询参数
     * @return 角色登录日志
     */
    Result queryLoginLog(UserQueryParams userQueryParams);

    /**
     * 删除登录日志
     * @param loginLogIds 登录日志ID
     * @return 登录日志删除结果
     */
    Result deleteLoginLog(List<Long> loginLogIds);

    /**
     * 清空登录日志
     * @return 操作是否成功
     */
    Result clearAllLoginLog();

    /**
     * 获取所有角色信息
     * @param pageParams 分页参数
     * @return 所有角色信息
     */
    Result getAllRole(PageParams pageParams);

    /**
     * 获取所有勋章信息
     * @param pageParams 分页参数
     * @return 所有勋章信息
     */
    Result getAllMedal(PageParams pageParams);

    /**
     * 管理员升级为超级管理员
     * @param adminId 管理员ID
     * @return 是否升级成功
     */
    Result adminUpgradeSuperAdmin(Long adminId);

    /**
     * 查看申请讲师的材料信息
     * @param userQueryParams 分页参数
     * @return 材料信息
     */
    Result teacherApplyInfo(UserQueryParams userQueryParams);

    /**
     * 取消讲师资格(删除讲师角色)
     * @param userId 用户ID
     * @return 是否取消成功
     */
    Result deleteTeacher(Long userId);

    /**
     * 同意讲师申请
     * @param userId 用户ID
     * @return 同意是否成功
     */
    Result agreeTeacherApply(Long userId);

    /**
     * 不同意讲师申请
     * @param disagreeApplyParams 不同意申请参数
     * @return 不同意是否成功
     */
    Result disagreeTeacherApply(DisagreeApplyParams disagreeApplyParams);

    /**
     * 获取用户数量(API调用)
     * @return 用户数量
     */
    Result getUserNumber();

    /**
     * 获取讲师数量(API调用)
     * @return 讲师数量
     */
    Result getTeacherNumber();

    /**
     * 获取登录次数(API调用)
     * @return 登录次数
     */
    Result getLoginLogNumber();

    /**
     * 赋予用户勋章(API调用)
     * @param userId 用户ID
     * @param medalId 勋章ID
     * @return 是否赋予成功
     */
    Result setUserMedal(Long userId, Long medalId);

    /**
     * 删除用户勋章(API调用)
     * @param userId 用户ID
     * @param medalId 勋章ID
     * @return 是否删除成功
     */
    Result deleteUserMedal(Long userId, Long medalId);

    /**
     * 获取所有在线用户
     * @return 所有在线用户
     */
    Result getAllOnlineUser();

    /**
     * 获取所有聊天记录
     * @param adminId 管理员ID
     * @param userId 用户ID
     * @return 所有聊天记录
     */
    Result getAllChatRecords(Long adminId, Long userId);

    /**
     * 新增角色
     * @param role 角色信息
     * @return 是否操作成功
     */
    Result addRole(CivilRole role);

    /**
     * 修改角色
     * @param role 角色信息
     * @return 是否操作成功
     */
    Result updateRole(CivilRole role);

    /**
     * 删除角色
     * @param roleIds 角色ID列表
     * @return 是否操作成功
     */
    Result deleteRole(List<Long> roleIds);

    /**
     * 添加勋章
     * @param medalAuthority 勋章信息
     * @return 是否操作成功
     */
    Result addMedal(MedalAuthority medalAuthority);

    /**
     * 修改勋章
     * @param medalAuthority 勋章信息
     * @return 是否操作成功
     */
    Result updateMedal(MedalAuthority medalAuthority);

    /**
     * 删除勋章
     * @param medalIds 勋章ID
     * @return 是否操作成功
     */
    Result deleteMedal(List<Long> medalIds);

    /**
     * 上传勋章图标
     * @param file 文件
     * @param username 用户名
     * @return 是否操作成功
     */
    Result submitMedalIcon(MultipartFile file, String username);

    /**
     * 获取所有用户ID和昵称
     * @return 所有用户ID和昵称
     */
    Result getUserIdAndNickname();

}
