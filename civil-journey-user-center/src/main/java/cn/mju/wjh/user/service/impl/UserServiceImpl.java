package cn.mju.wjh.user.service.impl;

import cn.hutool.core.bean.BeanUtil;
import cn.hutool.crypto.symmetric.SymmetricCrypto;
import cn.mju.wjh.common.core.constant.UseConstant;
import cn.mju.wjh.common.core.entity.param.PageParams;
import cn.mju.wjh.common.core.entity.pojo.course.CivilCourse;
import cn.mju.wjh.common.core.entity.pojo.user.*;
import cn.mju.wjh.common.core.entity.vo.user.*;
import cn.mju.wjh.common.core.enums.HttpStatus;
import cn.mju.wjh.common.core.utils.Result;
import cn.mju.wjh.common.minio.constant.MinIoConstant;
import cn.mju.wjh.common.minio.utils.MinioUtil;
import cn.mju.wjh.common.redis.util.RedisUtil;
import cn.mju.wjh.common.security.mapper.*;
import cn.mju.wjh.common.security.utils.LoginUserUtils;
import cn.mju.wjh.common.security.utils.StpUserUtils;
import cn.mju.wjh.user.mapper.CivilCourseMapper;
import cn.mju.wjh.user.mapper.UserMedalMapper;
import cn.mju.wjh.user.service.UserService;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import lombok.Setter;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.util.*;
import java.util.stream.Collectors;
import java.util.stream.Stream;

/**
 * ClassName: UserServiceImpl
 * Package: cn.mju.wjh.user.service.impl
 * Description: 用户服务实现
 *
 * @Author:wjh
 * @Create:2023-12-2023/12/12--10:29
 */
@Slf4j
@Service
public class UserServiceImpl implements UserService {

    @Value("${sa-token.key}")
    private String key;

    @Setter(onMethod_ = @Autowired)
    private CivilUserMapper userMapper;

    @Setter(onMethod_ = @Autowired)
    private CivilRoleMapper roleMapper;

    @Setter(onMethod_ = @Autowired)
    private CivilCourseMapper courseMapper;

    @Setter(onMethod_ = @Autowired)
    private RedisUtil redisUtil;

    @Setter(onMethod_ = @Autowired)
    private TeacherAuditMapper teacherMapper;

    @Setter(onMethod_ = @Autowired)
    private UserRoleMapper userRoleMapper;

    @Setter(onMethod_ = @Autowired)
    private UserMedalMapper userMedalMapper;

    @Setter(onMethod_ = @Autowired)
    private CivilAdminMapper adminMapper;

    @Setter(onMethod_ = @Autowired)
    private MedalAuthorityMapper medalAuthorityMapper;

    @Setter(onMethod_ = @Autowired)
    private MinioUtil minioUtil;

    @Setter(onMethod_ = @Autowired)
    private LoginUserUtils loginUserUtils;

    /**
     * 查询用户基本信息
     * @return 用户信息
     */
    @Override
    public Result queryUserInfo() {
        log.info("当前会话 -> {}", StpUserUtils.getLoginId());
        // 当前用户信息
        CivilUser civilUser = loginUserUtils.getUserInfo(StpUserUtils.getLoginId());
        if (civilUser == null) {
            return Result.ok().code(HttpStatus.NOT_FOUND.getCode()).message("查询用户信息失败");
        }

        // 封装回显数据
        UserInfoVo userInfoVo = new UserInfoVo();
        BeanUtil.copyProperties(civilUser, userInfoVo);
        userInfoVo.setViewVideoNumber(civilUser.getFreeViewNumber());

        // 查询用户角色
        UserRole userRole = userRoleMapper.selectOne(
                new LambdaQueryWrapper<UserRole>()
                        .eq(UserRole::getUserId, civilUser.getUserId())
        );
        if (userRole != null) {
            String roleDescribe = roleMapper.selectById(userRole.getRoleId()).getRoleDescribe();

            if (roleDescribe != null) {
                userInfoVo.setUserRole(roleDescribe);
            }
        }

        // 查询用户勋章
        List<Long> userMedalIds = userMedalMapper.selectList(
                new LambdaQueryWrapper<UserMedal>()
                        .eq(UserMedal::getUserId, civilUser.getUserId())
        ).stream().map(UserMedal::getMedalId).toList();
        if (userMedalIds.size() != 0) {
            // 封装勋章信息
            List<MedalInfoVo> medalInfoVoList = new ArrayList<>();
            for (Long medalId : userMedalIds) {
                MedalInfoVo medalInfoVo = medalAuthorityMapper.medalInfoVoByMedalId(medalId);
                medalInfoVo.setMedalIcon(minioUtil.preview(medalInfoVo.getMedalIcon()));
                medalInfoVoList.add(medalInfoVo);
            }

            userInfoVo.setMedalInfoVos(medalInfoVoList);
        }

        // 头像地址
        userInfoVo.setHeadPortrait(minioUtil.preview(userInfoVo.getHeadPortrait()));

        return Result.ok(userInfoVo).message("查询用户信息成功");
    }

    /**
     * 修改用户基本信息
     * @param user 用户信息
     * @return 是否修改成功
     */
    @Override
    public Result updateUserInfo(CivilUser user) {
        // 当前用户
        user.setUserId(Long.parseLong(StpUserUtils.getLoginId().toString()));
        // 查询用户数据
        CivilUser oldUser = userMapper.selectById(user.getUserId());
        if (user.getUsername() != null) {
            // 判断登录名称是否已经被使用
            if (userMapper.selectCount(
                    new LambdaQueryWrapper<CivilUser>()
                            .eq(CivilUser::getUsername, user.getUsername())
            ) > 0 && !Objects.equals(oldUser.getUsername(), user.getUsername())) {
                return Result.fail().code(HttpStatus.FOUND.getCode()).message("登录名称已经被使用");
            }
        }

        if (user.getNickname() != null) {
            // 判断昵称是否已经被使用
            if (userMapper.selectCount(
                    new LambdaQueryWrapper<CivilUser>()
                            .eq(CivilUser::getNickname, user.getNickname())
            ) > 0 && !Objects.equals(oldUser.getNickname(), user.getNickname())) {
                return Result.fail().code(HttpStatus.FOUND.getCode()).message("昵称已经被使用");
            }
        }

        if (user.getUserEmail() != null) {
            // 判断邮箱是否已经被使用
            if (userMapper.selectCount(
                    new LambdaQueryWrapper<CivilUser>()
                            .eq(CivilUser::getUserEmail, user.getUserEmail())
            ) > 0 && !Objects.equals(oldUser.getUserEmail(), user.getUserEmail())) {
                return Result.fail().code(HttpStatus.FOUND.getCode()).message("邮箱已经被使用");
            }
        }

        // 获取登录名称(是否存在用户)
        String username = userMapper.selectOne(
                new LambdaQueryWrapper<CivilUser>()
                        .eq(CivilUser::getUserId, user.getUserId())
        ).getUsername();
        log.info("username: " + username);
        if (username == null) {
            return Result.ok().code(HttpStatus.NOT_FOUND.getCode()).message("未查询到该用户");
        }

        // 直接修改
        if (userMapper.updateById(user) > 0) {
            return Result.ok().message("用户信息修改成功");
        }
        return Result.fail().message("用户信息修改失败");
    }

    /**
     * 修改用户密码
     * @param password 新密码
     * @return 是否修改成功
     */
    @Override
    public Result updateUserPassword(String password) {
        log.info("当前会话 -> {}", StpUserUtils.getLoginId());
        // 获取用户密码
        String userPassword = loginUserUtils.getUserPassword(StpUserUtils.getLoginId());

        // 判断密码和之前的密码是否一致
        SymmetricCrypto aes = loginUserUtils.getAes(key);
        if (password.equals(aes.decryptStr(userPassword))) {
            return Result.fail().message("密码和之前的密码一致,重新输入");
        }

        // 进行加入加密,后修改密码
        int rows = userMapper.update(
                new CivilUser().setPassword(aes.encryptBase64(password)),
                new LambdaQueryWrapper<CivilUser>()
                        .eq(CivilUser::getUserId,StpUserUtils.getLoginId())
        );

        if (rows > 0) {
            // 将目前的登录踢下线
            StpUserUtils.logout(StpUserUtils.getLoginId());
            return Result.ok().message("密码修改成功");
        }
        return Result.fail().message("密码修改失败");
    }

    /**
     * 修改用户头像
     * @param avatarFile 头像文件
     * @param username 登录名称
     * @return 是否修改成功
     */
    @Override
    public Result updateUserAvatar(MultipartFile avatarFile, String username) {
        // 先上传头像
        String avatarAddress = minioUtil.upload(
                avatarFile,
                MinIoConstant.FILE_TYPE_AVATAR,
                UseConstant.USER_CONSTANT,
                "username: " + username
        );
        // 将头像地址插入数据库
        int rows = userMapper.update(
                new CivilUser().setHeadPortrait(avatarAddress),
                new LambdaQueryWrapper<CivilUser>()
                        .eq(CivilUser::getUsername, username)
        );

        if (rows == 0) {
            return Result.fail().message("头像修改失败");
        }

        // 返回头像地址
        return Result.ok(minioUtil.preview(avatarAddress)).message("头像修改成功");
    }

    /**
     * 申请讲师角色
     * @param teacher 申请材料信息
     * @return 申请提交是否成功
     */
    @Override
    public Result applyTeacherRole(TeacherAudit teacher) {
        // 获取当前登录ID
        Long userId = Long.parseLong(StpUserUtils.getLoginId().toString());

        if (teacherMapper.selectCount(
                new LambdaQueryWrapper<TeacherAudit>()
                        .eq(TeacherAudit::getUserId, userId)
        ) > 0) {
            Result.fail().message("请勿重新提交讲师申请");
        }

        // 直接插入数据
        if (teacherMapper.insert(
                        new TeacherAudit()
                                .setUserId(userId)
                                .setCertificatePhoto(teacher.getCertificatePhoto())
                                .setCertificateNumber(teacher.getCertificateNumber())
                                .setTeacherIntroduction(teacher.getTeacherIntroduction())
        ) > 0) {
            return Result.ok().message("讲师申请提交成功");
        }
        return Result.fail().message("讲师申请提交失败");
    }

    /**
     * 上传教师资格证书照片
     * @param file 图片文件
     * @param username 登录名称
     * @return 是否上传成功(成功 : 返回地址)
     */
    @Override
    public Result submitTeacherCertificatePhoto(MultipartFile file, String username) {
        // 上传
        String teacherCertificateAddress = minioUtil.upload(
                file,
                UseConstant.TEACHER_CERTIFICATE,
                UseConstant.ROLE_TEACHER,
                "username: " + username
        );

        // 判空
        if (teacherCertificateAddress == null) {
            return Result.fail().message("教师资格证书上传失败");
        }

        // 封装
        Map<String, String> map = new HashMap<>();
        map.put("oldPath", teacherCertificateAddress);
        map.put("newPath", minioUtil.preview(teacherCertificateAddress));

        return Result.ok(map).message("教师资格证书上传成功");
    }

    /**
     * 查看讲师申请进度
     * @return 申请结果
     */
    @Override
    public Result teacherApplyReason() {
        // 获取当前登录ID
        Long userId = Long.parseLong(StpUserUtils.getLoginId().toString());

        TeacherAudit teacherAudit = teacherMapper.selectOne(
                new LambdaQueryWrapper<TeacherAudit>()
                        .eq(TeacherAudit::getUserId, userId)
        );

        TeacherApplyVo teacherApplyVo = BeanUtil.toBean(teacherAudit, TeacherApplyVo.class);

        if (teacherApplyVo == null) {
            return Result.fail().message("进度查看失败");
        }

        return Result.ok(teacherApplyVo).message("进度查看成功");
    }

    /**
     * 删除讲师申请
     * @return 是否删除成功
     */
    @Override
    public Result deleteTeacherApply() {

        TeacherAudit teacherAudit = teacherMapper.selectOne(
                new LambdaQueryWrapper<TeacherAudit>()
                        .eq(TeacherAudit::getUserId, Long.valueOf(StpUserUtils.getLoginId().toString()))
        );

        // 删除教师资格证照片
        minioUtil.remove(teacherAudit.getCertificatePhoto());

        // 删除
        int rows = teacherMapper.delete(
                new LambdaQueryWrapper<TeacherAudit>()
                        .eq(TeacherAudit::getUserId, Long.valueOf(StpUserUtils.getLoginId().toString()))
        );

        if (rows == 0) {
            return Result.fail().message("操作失败");
        }
        return Result.ok().message("操作成功");
    }

    /**
     * 修改讲师简介
     * @param teacherIntroduction 讲师简介
     * @return 是否修改成功
     */
    @Override
    public Result updateTeacherIntroduction(String teacherIntroduction) {
        int rows = teacherMapper.update(
                new TeacherAudit().setTeacherIntroduction(teacherIntroduction),
                new LambdaQueryWrapper<TeacherAudit>()
                        .eq(TeacherAudit::getUserId, Long.valueOf(StpUserUtils.getLoginId().toString()))
        );

        if (rows == 0) {
            return Result.fail().message("操作失败");
        }
        return Result.ok().message("操作成功");
    }

    /**
     * 默认展示前6条讲师
     * @return 讲师信息
     */
    @Override
    public Result getTeacher() {
        // 讲师查询讲师(角色的用户)
        List<UserRole> userRoleList = userRoleMapper.selectList(
                new LambdaQueryWrapper<UserRole>()
                        .eq(UserRole::getRoleId, (long) 3)
                        .select(UserRole::getUserId)
                        .last("limit 6")
        );

        System.out.println(userRoleList.toString());

        // 判断是否为空
        if (userRoleList.size() > 0) {
            // 封装返回结果
            List<TeacherInfoVo> teacherInfoVos = userRoleList.stream()
                .map(userRole -> {
                        // 查询用户表
                        CivilUser civilUser = userMapper.selectById(userRole.getUserId());
                        if (civilUser != null) {
                            // 设置头像
                            civilUser.setHeadPortrait(minioUtil.preview(civilUser.getHeadPortrait()));

                            // 封装
                            TeacherInfoVo teacherInfoVo = BeanUtil.copyProperties(civilUser, TeacherInfoVo.class);
                            teacherInfoVo.setTeacherId(civilUser.getUserId());
                            return teacherInfoVo;
                        }
                        return null;
                    }
                ).toList();

            if (teacherInfoVos.size() > 0) {
                return Result.ok(teacherInfoVos).message("操作成功");
            }
        }

        return Result.fail().message("操作失败").code(HttpStatus.NOT_FOUND.getCode());
    }

    /**
     * 获取讲师基本信息
     * @param teacherId 讲师ID
     * @return 讲师基本信息
     */
    @Override
    public Result getTeacherInfoById(Long teacherId) {
        // 查询讲师信息
        CivilUser civilUser = userMapper.selectById(teacherId);

        // 判空
        if (civilUser == null) {
            return Result.fail().message("操作失败").code(HttpStatus.NOT_FOUND.getCode());
        }
        // 设置头像
        civilUser.setHeadPortrait(minioUtil.preview(civilUser.getHeadPortrait()));

        // 将用户信息封装为讲师基本信息
        TeacherInfoVo teacherInfoVo = BeanUtil.toBean(civilUser, TeacherInfoVo.class);
        teacherInfoVo.setTeacherId(teacherId);

        // 查询讲师简介
        TeacherAudit teacherAudit = teacherMapper.selectOne(
                new LambdaQueryWrapper<TeacherAudit>()
                        .eq(TeacherAudit::getUserId, teacherId)
                        .select(TeacherAudit::getTeacherIntroduction)
        );

        // 判空
        if (teacherAudit == null) {
            return Result.fail().message("操作失败").code(HttpStatus.NOT_FOUND.getCode());
        }

        teacherInfoVo.setTeacherIntroduction(teacherAudit.getTeacherIntroduction());
        return Result.ok(teacherInfoVo).message("操作成功");
    }

    /**
     * 获取讲师历史课程信息
     * @param teacherId  讲师ID
     * @param pageParams 分页信息
     * @return 讲师历史课程信息
     */
    @Override
    public Result getTeacherHistoryCourseInfo(Long teacherId, PageParams pageParams) {
        // 根据ID查询
        IPage<CivilCourse> courseIpage = courseMapper.selectPage(
                new Page<>(pageParams.getCurrentPage(), pageParams.getPageSize()),
                new LambdaQueryWrapper<CivilCourse>()
                        .eq(CivilCourse::getUserId, teacherId));

        // 判空
        if (courseIpage.getRecords().size() == 0) {
            return Result.fail().message("操作失败").code(HttpStatus.NOT_FOUND.getCode());
        }

        // 封装返回结果
        List<TeacherHistoryCourseVo> teacherHistoryCourseVoList = courseIpage.getRecords().stream()
                .map(course -> BeanUtil.toBean(course, TeacherHistoryCourseVo.class)).toList();

        // 判空
        if (teacherHistoryCourseVoList.size() == 0) {
            return Result.fail().message("操作失败").code(HttpStatus.NOT_FOUND.getCode());
        }

        // 封装返回结果
        IPage<TeacherHistoryCourseVo> teacherHistoryCourseIpage = new Page<>();
        BeanUtil.copyProperties(courseIpage, teacherHistoryCourseIpage);
        teacherHistoryCourseIpage.setRecords(teacherHistoryCourseVoList);

        return Result.ok(teacherHistoryCourseIpage).message("操作成功");
    }

    /**
     * 获取所有在线客服
     * @return 所有在线客服
     */
    @Override
    public Result getAllOnlineCustom() {
        List<CivilAdmin> admins = adminMapper.selectList(null);

        // 判空
        if (admins.size() == 0) {
            return Result.fail().message("未查到相关信息");
        }

        // 封装
        List<Map<String, Object>> adminListVo = new ArrayList<>();
        admins.forEach(admin -> {
            Map<String, Object> adminMap = new HashMap<>();
            adminMap.put("id", admin.getAdminId());
            adminMap.put("nickname","人工客服" + admin.getAdminId());
            adminMap.put("userAvatar",minioUtil.preview(admin.getHeadPortrait()));
            adminListVo.add(adminMap);
        });

        return Result.ok(adminListVo).message("操作成功");
    }

    /**
     * 获取所有聊天记录
     * @param userId 用户ID
     * @param adminId 管理员ID
     * @return 所有聊天记录
     */
    @Override
    public Result getAllChatRecords(Long userId, Long adminId) {
        String key = Stream.of(
                        UseConstant.USER_CONSTANT + UseConstant.COLON_CONSTANT + userId,
                        UseConstant.ADMIN_REAL_CONSTANT + UseConstant.COLON_CONSTANT + adminId
                )
                .sorted()
                .collect(Collectors.joining(UseConstant.ROD_CONSTANT));

        List<Object> objectList = redisUtil.get(key);

        if (objectList.size() == 0) {
            return Result.fail().message("操作失败").code(HttpStatus.NOT_FOUND.getCode());
        }

        return Result.ok(objectList).message("操作成功");
    }
}
