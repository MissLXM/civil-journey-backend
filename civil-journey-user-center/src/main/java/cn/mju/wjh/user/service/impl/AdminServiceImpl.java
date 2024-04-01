package cn.mju.wjh.user.service.impl;

import cn.dev33.satoken.stp.StpUtil;
import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.util.ObjectUtil;
import cn.hutool.crypto.symmetric.SymmetricCrypto;
import cn.mju.wjh.common.api.client.CourseClient;
import cn.mju.wjh.common.core.constant.UseConstant;
import cn.mju.wjh.common.core.entity.param.user.DisagreeApplyParams;
import cn.mju.wjh.common.core.entity.param.PageParams;
import cn.mju.wjh.common.core.entity.param.admin.AdminQueryParams;
import cn.mju.wjh.common.core.entity.param.admin.AdminUpdateParams;
import cn.mju.wjh.common.core.entity.param.user.UserQueryParams;
import cn.mju.wjh.common.core.entity.pojo.user.*;
import cn.mju.wjh.common.core.entity.vo.user.*;
import cn.mju.wjh.common.core.enums.HttpStatus;
import cn.mju.wjh.common.core.utils.Result;
import cn.mju.wjh.common.email.utils.EmailUtils;
import cn.mju.wjh.common.minio.constant.MinIoConstant;
import cn.mju.wjh.common.minio.utils.MinioUtil;
import cn.mju.wjh.common.redis.util.RedisUtil;
import cn.mju.wjh.common.security.mapper.*;
import cn.mju.wjh.common.security.utils.LoginUserUtils;
import cn.mju.wjh.common.security.utils.StpUserUtils;
import cn.mju.wjh.common.security.mapper.MedalAuthorityMapper;
import cn.mju.wjh.common.security.mapper.TeacherAuditMapper;
import cn.mju.wjh.user.mapper.UserMedalMapper;
import cn.mju.wjh.user.service.AdminService;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import jakarta.mail.MessagingException;
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
 * ClassName: AdminServiceImpl
 * Package: cn.mju.wjh.user.service.impl
 * Description: 管理员服务实现
 *
 * @Author:wjh
 * @Create:2023-12-2023/12/14--10:31
 */
@Slf4j
@Service
public class AdminServiceImpl implements AdminService {

    @Value("${sa-token.key}")
    private String key;

    @Setter(onMethod_ = @Autowired)
    private CivilUserMapper userMapper;

    @Setter(onMethod_ = @Autowired)
    private CivilAdminMapper adminMapper;

    @Setter(onMethod_ = @Autowired)
    private CivilRoleMapper roleMapper;

    @Setter(onMethod_ = @Autowired)
    private MinioUtil minioUtil;

    @Setter(onMethod_ = @Autowired)
    private EmailUtils emailUtils;

    @Setter(onMethod_ = @Autowired)
    private LoginUserUtils loginUserUtils;

    @Setter(onMethod_ = @Autowired)
    private AdminRoleMapper adminRoleMapper;

    @Setter(onMethod_ = @Autowired)
    private CourseClient courseClient;

    @Setter(onMethod_ = @Autowired)
    private LoginLogMapper loginLogMapper;

    @Setter(onMethod_ = @Autowired)
    private UserRoleMapper userRoleMapper;

    @Setter(onMethod_ = @Autowired)
    private RedisUtil redisUtil;

    @Setter(onMethod_ = @Autowired)
    private UserMedalMapper userMedalMapper;

    @Setter(onMethod_ = @Autowired)
    private TeacherAuditMapper teacherAuditMapper;

    @Setter(onMethod_ = @Autowired)
    private MedalAuthorityMapper medalAuthorityMapper;

    /**
     * 判断邮箱是否存在
     * @param email 邮箱
     * @return 是否存在
     */
    private boolean checkEmail(String email) {
        if (email != null) {
            return adminMapper.selectCount(
                    new LambdaQueryWrapper<CivilAdmin>()
                            .eq(CivilAdmin::getAdminEmail, email)
            ) > 0;
        }
        return false;
    }

    /**
     * 判断昵称是否存在
     * @param nickname 昵称
     * @return 是否存在
     */
    private boolean checkNickname(String nickname) {
        if (nickname != null) {
            return adminMapper.selectCount(
                    new LambdaQueryWrapper<CivilAdmin>()
                            .eq(CivilAdmin::getNickname, nickname)
            ) > 0;
        }
        return false;
    }

    /**
     * 判断登录名称是否存在
     * @param username 登录名称
     * @return 是否存在
     */
    private boolean checkUsername(String username) {
        if (username != null) {
            return adminMapper.selectCount(
                    new LambdaQueryWrapper<CivilAdmin>()
                            .eq(CivilAdmin::getUsername, username)
            ) > 0;
        }
        return false;
    }

    /**
     * 查询当前登录管理员的信息
     * @return 管理员信息
     */
    @Override
    public Result adminInfo() {
        // 查询管理员
        CivilAdmin admin = adminMapper.selectById(Long.parseLong(StpUtil.getLoginId().toString()));

        // 封装数据
        AdminInfoVo adminInfoVo = new AdminInfoVo();
        BeanUtil.copyProperties(admin, adminInfoVo);

        // 查询管理员角色
        if (admin.getAdminId()!= null) {
            AdminRole adminRole = adminRoleMapper.selectOne(
                    new LambdaQueryWrapper<AdminRole>()
                           .eq(AdminRole::getAdminId, admin.getAdminId())
            );
            if (adminRole!= null) {
                adminInfoVo.setIsDelete(null);
                adminInfoVo.setHeadPortrait(minioUtil.preview(adminInfoVo.getHeadPortrait()));
                adminInfoVo.setAdminRole(roleMapper.selectById(adminRole.getRoleId()).getRoleDescribe());
                return Result.ok(adminInfoVo).message("管理员信息查询成功");
            }
        }

        return Result.fail().message("管理员信息查询失败");
    }

    /**
     * 修改当前登录管理员信息
     * @param adminUpdateParams 修改信息
     * @return 修改结果
     */
    @Override
    public Result updateAdminInfo(AdminUpdateParams adminUpdateParams) {
        // 查询管理员
        CivilAdmin oldAdmin = adminMapper.selectById(Long.parseLong(StpUtil.getLoginId().toString()));
        // 判断登录名称是否存在
        if (checkUsername(adminUpdateParams.getUsername()) && !Objects.equals(oldAdmin.getUsername(), adminUpdateParams.getUsername())) {
            return Result.fail().code(HttpStatus.FOUND.getCode()).message("登录名称已存在");
        }

        // 判断昵称是否存在
        if (checkNickname(adminUpdateParams.getNickname()) && !Objects.equals(oldAdmin.getNickname(), adminUpdateParams.getNickname())) {
            return Result.fail().code(HttpStatus.FOUND.getCode()).message("昵称已存在");
        }

        // 判断邮箱是否存在
        if (checkEmail(adminUpdateParams.getAdminEmail()) && !Objects.equals(oldAdmin.getAdminEmail(), adminUpdateParams.getAdminEmail())) {
            return Result.fail().code(HttpStatus.FOUND.getCode()).message("邮箱已存在");
        }

        // 修改
        CivilAdmin admin = new CivilAdmin();
        adminUpdateParams.setAdminId(Long.parseLong(StpUtil.getLoginId().toString()));
        BeanUtil.copyProperties(adminUpdateParams, admin);

        log.info("admin -> {}", admin);

        if (adminMapper.updateById(admin) > 0) {
            return Result.ok().message("修改信息成功");
        }
        return Result.fail().message("修改信息失败");
    }

    /**
     * 修改当前登录管理员密码
     * @param password 密码
     * @return 是否修改成功
     */
    @Override
    public Result updateAdminPassword(String password) {
        Long adminId = Long.parseLong(StpUtil.getLoginId().toString());

        CivilAdmin admin = adminMapper.selectById(adminId);

        SymmetricCrypto aes = loginUserUtils.getAes(key);
        if (password.equals(aes.decryptStr(admin.getPassword()))) {
            return Result.fail().code(HttpStatus.FOUND.getCode()).message("密码和之前的密码一致,重新输入");
        }

        admin.setPassword(aes.encryptBase64(password));
        if (adminMapper.updateById(admin) > 0) {
            // 使其掉线
            StpUtil.logout(adminId);
            return Result.ok().message("修改密码成功");
        }

        return Result.fail().message("修改密码失败");
    }

    /**
     * 修改当前登录管理员头像
     * @param file 头像文件
     * @param username 用户名
     * @return 是否修改成功
     */
    @Override
    public Result updateAdminAvatar(MultipartFile file, String username) {
        String avatarAddress = minioUtil.upload(
                file,
                MinIoConstant.FILE_TYPE_AVATAR,
                UseConstant.ADMIN_REAL_CONSTANT,
                "username: " + username
        );

        // 将头像地址插入数据库
        int rows = adminMapper.update(
                new CivilAdmin().setHeadPortrait(avatarAddress),
                new LambdaQueryWrapper<CivilAdmin>()
                        .eq(CivilAdmin::getUsername, username)
        );

        if (rows == 0) {
            return Result.fail().message("头像修改失败");
        }

        // 返回头像地址
        return Result.ok(minioUtil.preview(avatarAddress)).message("头像修改成功");
    }

    /**
     * 管理员重置密码(超管权限,密码:123456)
     * @param adminIds 管理员ID列表
     * @return 是否重置成功
     */
    @Override
    public Result updateAdminPasswordOfAdmin(List<Long> adminIds) {

        SymmetricCrypto aes = loginUserUtils.getAes(key);
        String password = aes.encryptBase64(UseConstant.FIXED_PASSWORD);

        // 重置密码
        if (adminMapper.update(
                new CivilAdmin().setPassword(password),
                new LambdaQueryWrapper<CivilAdmin>()
                        .in(CivilAdmin::getAdminId, adminIds)
        ) > 0) {
            adminIds.forEach(StpUtil::logout);
            return Result.ok().message("管理员密码重置成功");
        }
        return Result.fail().message("管理员密码重置失败");
    }

    /**
     * 修改管理员信息(超管权限)
     * @param civilAdmin 管理员信息
     * @return 是否修改成功
     */
    @Override
    public Result updateAdminInfoOfSuperAdmin(CivilAdmin civilAdmin) {

        if (adminMapper.updateById(civilAdmin) > 0) {
            return Result.ok().message("修改管理员信息成功");
        }
        return Result.fail().message("修改管理员信息失败");
    }

    /**
     * 启动/禁用管理员--设置状态(超管权限)
     * @param adminId 管理员ID
     * @param isDelete 状态
     * @return 是否成功
     */
    @Override
    public Result forBiddenAdminOfSuperAdmin(Long adminId, Byte isDelete) {
        // 解封/封禁
        if (isDelete == 0) {
            StpUtil.untieDisable(adminId);
        } else if (isDelete == 1) {
            if (StpUtil.getLoginId(adminId) != null) {
                StpUtil.disable(adminId, -1);
                StpUtil.logout(adminId);
            }
        }



        if (adminMapper.updateById(
                new CivilAdmin()
                        .setAdminId(adminId)
                        .setIsDelete(isDelete)
        ) > 0) {
            return Result.ok().message("操作成功");
        }
        return Result.fail().message("操作失败");
    }

    /**
     * 删除管理员--设置状态(超管权限(可多删除))
     * @param adminIds 管理员ID列表
     * @return 是否删除成功
     */
    @Override
    public Result deleteAdminOfSuperAdmin(List<Long> adminIds) {
        boolean flag = true;
        for (Long adminId : adminIds) {
            if (StpUtil.isLogin(adminId)) {
                StpUtil.logout(adminId);
            }
            if (adminMapper.deleteById(adminId) <= 0) {
                flag = false;
            }
        }

        if (flag) {
            adminIds.forEach(adminId -> adminRoleMapper.delete(
                    new LambdaQueryWrapper<AdminRole>()
                            .eq(AdminRole::getAdminId, adminId)
            ));

            return Result.ok().message("管理员删除成功");
        } else {
            return Result.fail().message("管理员删除失败");
        }

    }

    /**
     * 查询管理员信息(带分页、参数--角色)
     * @param adminQueryParams 查询参数
     * @return 查询的管理员信息
     */
    @Override
    public Result adminInfoByRole(AdminQueryParams adminQueryParams) {
        if (adminQueryParams.getAdminRole() == null) {
            return Result.build(null).code(HttpStatus.REQUESTED_RANGE_NOT_SATISFIABLE.getCode()).message("未携带角色参数");
        }

        // 查询角色
        List<AllAdminInfoVo> allAdminInfoVoList = new ArrayList<>();
        IPage<AllAdminInfoVo> adminInfoVoIpage = new Page<>();

        CivilRole role = roleMapper.selectOne(
                new LambdaQueryWrapper<CivilRole>()
                        .eq(CivilRole::getRoleDescribe, adminQueryParams.getAdminRole())
        );

        if (role == null) {
            return Result.build(null).code(HttpStatus.NOT_FOUND.getCode()).message("未有该角色");
        }

        // 查询所有拥有该角色的管理员
        IPage<AdminRole> adminRolePage = adminRoleMapper.selectPage(
                new Page<>(adminQueryParams.getCurrentPage(), adminQueryParams.getPageSize()),
                new LambdaQueryWrapper<AdminRole>()
                        .eq(AdminRole::getRoleId, role.getRoleId())
        );

        BeanUtil.copyProperties(adminRolePage, adminInfoVoIpage);

        if (adminRolePage.getRecords().size() == 0) {
            return Result.build(null).code(HttpStatus.NOT_FOUND.getCode()).message("未找到该角色的管理员");
        }

        // 封装数据
        for (AdminRole adminRole : adminRolePage.getRecords()) {
            AllAdminInfoVo allAdminInfoVo = new AllAdminInfoVo();
            CivilAdmin admin = adminMapper.selectById(adminRole.getAdminId());
            BeanUtil.copyProperties(admin, allAdminInfoVo);

            allAdminInfoVo.setAdminRole(adminQueryParams.getAdminRole());
            allAdminInfoVo.setHeadPortrait(minioUtil.preview(allAdminInfoVo.getHeadPortrait()));
            allAdminInfoVoList.add(allAdminInfoVo);
        }

        adminInfoVoIpage.setRecords(allAdminInfoVoList);

        return Result.ok(adminInfoVoIpage).message("查询成功");
    }

    /**
     * 查询管理员信息(带分页、参数--昵称、邮箱)
     * @param adminQueryParams 查询参数
     * @return 查询的管理员信息
     */
    @Override
    public Result adminInfoByNicknameOrEmail(AdminQueryParams adminQueryParams) {
        // 初始化分页数据
        IPage page = new Page(adminQueryParams.getCurrentPage(), adminQueryParams.getPageSize());

        LambdaQueryWrapper<CivilAdmin> queryWrapper = new LambdaQueryWrapper<>();
        // 判断参数有哪些存在
        if (adminQueryParams.getNickname() != null) {
            queryWrapper
                    .like(CivilAdmin::getNickname, adminQueryParams.getNickname());
        }
        if (adminQueryParams.getAdminEmail()!= null) {
            queryWrapper
                    .like(CivilAdmin::getAdminEmail, adminQueryParams.getAdminEmail());
        }

        // 查询管理员
        IPage<CivilAdmin> adminInfoIpage = adminMapper
                .selectPage(page, queryWrapper);

        // 判断是否有管理员信息
        if (adminInfoIpage.getRecords().size() == 0) {
            return Result.build(null).code(HttpStatus.NOT_FOUND.getCode()).message("未查询到管理员");
        }

        // 封装管理员回显信息
        List<AllAdminInfoVo> allAdminInfoVoList = new ArrayList<>();
        IPage<AllAdminInfoVo> adminInfoVoIpage = new Page<>();

        // 深拷贝
        BeanUtil.copyProperties(adminInfoIpage, adminInfoVoIpage);

        log.info("深拷贝 -> {}", adminInfoVoIpage);

        // 设置管理员角色
        for (CivilAdmin admin : adminInfoIpage.getRecords()) {
            AllAdminInfoVo allAdminInfoVo = new AllAdminInfoVo();
            AdminRole adminRole = adminRoleMapper
                    .selectOne(
                            new LambdaQueryWrapper<AdminRole>()
                                    .eq(AdminRole::getAdminId, admin.getAdminId())
                    );
            String roleDescribe = "";
            if (adminRole != null) {
                roleDescribe = roleMapper
                        .selectById(adminRole.getRoleId())
                        .getRoleDescribe();
            }
            BeanUtil.copyProperties(admin, allAdminInfoVo);
            allAdminInfoVo.setAdminRole(roleDescribe);
            allAdminInfoVo.setHeadPortrait(minioUtil.preview(allAdminInfoVo.getHeadPortrait()));
            allAdminInfoVoList.add(allAdminInfoVo);
        }

        adminInfoVoIpage.setRecords(allAdminInfoVoList);

        return Result.ok(adminInfoVoIpage).message("查询成功");
    }

    /**
     * 新增用户(默认密码:123456)
     * @param user 用户信息
     * @return 是否新增成功
     */
    @Override
    public Result insertUserOfSuperAdmin(CivilUser user) {

        // 判断登录名称是否存在
        if (userMapper.selectCount(
                new LambdaQueryWrapper<CivilUser>()
                        .eq(CivilUser::getUsername, user.getUsername())
        ) > 0) {
            return Result.fail().code(HttpStatus.FOUND.getCode()).message("登录名称已存在");
        }

        // 判断用户昵称是否存在
        if (userMapper.selectCount(
                new LambdaQueryWrapper<CivilUser>()
                        .eq(CivilUser::getNickname, user.getNickname())
        ) > 0) {
            return Result.fail().code(HttpStatus.FOUND.getCode()).message("用户昵称已存在");
        }

        // 判断用户邮箱是否存在
        if (userMapper.selectCount(
                new LambdaQueryWrapper<CivilUser>()
                        .eq(CivilUser::getUserEmail, user.getUserEmail())
        ) > 0) {
            return Result.fail().code(HttpStatus.FOUND.getCode()).message("用户邮箱已存在");
        }

        // 设置密码
        SymmetricCrypto aes = loginUserUtils.getAes(key);
        user.setPassword(aes.encryptBase64(UseConstant.FIXED_PASSWORD));

        if (userMapper.insert(user) > 0) {
            // 设置用户角色
            if (userRoleMapper.insert(
                    new UserRole()
                            .setUserId(user.getUserId())
                            .setRoleId(UseConstant.ROLE_USER_ID)
            ) > 0) {
                log.info("用户角色设置成功");
            }
            return Result.ok().message("用户新增成功");
        }
        return Result.fail().message("用户新增失败");
    }

    /**
     * 重置用户密码(密码:123456)
     * @param userIds 用户ID列表
     * @return 是否重置成功
     */
    @Override
    public Result updateUserPasswordOfAdmin(List<Long> userIds) {

        SymmetricCrypto aes = loginUserUtils.getAes(key);
        String password = aes.encryptBase64(UseConstant.FIXED_PASSWORD);

        // 重置密码

        if (userMapper.update(
                new CivilUser().setPassword(password),
                new LambdaQueryWrapper<CivilUser>()
                       .in(CivilUser::getUserId, userIds)
        ) > 0) {
            // 将用户踢下线
            for (Long userId: userIds) {
                StpUserUtils.logout(userId);

                String userEmail = userMapper.selectById(userId).getUserEmail();
                // 发送邮箱
                try {
                    emailUtils.sendEmail(userEmail, "您的密码已重置成功,密码为：123456");
                } catch (MessagingException e) {
                    throw new RuntimeException("邮箱发送失败");
                }
            }

            return Result.ok().message("用户密码重置成功");
        }

        return Result.fail().message("用户密码重置错误");
    }

    /**
     * 修改用户信息
     * @param user 用户信息
     * @return 是否修改成功
     */
    @Override
    public Result updateUserInfoOfAdmin(CivilUser user) {

        if (userMapper.updateById(user) > 0) {
            return Result.ok().message("修改用户信息成功");
        }
        return Result.ok().message("修改用户信息失败");
    }

    /**
     * 启用/禁用用户
     * @param userId   用户ID
     * @param isDelete 状态
     * @return 是否禁用成功
     */
    @Override
    public Result deleteUserInfoOfAdmin(Long userId, Byte isDelete) {
        // 解封/封禁
        if (isDelete == 0) {
            StpUserUtils.untieDisable(userId);
        } else if (isDelete == 1) {
            if (StpUserUtils.getLoginId(userId) != null) {
                StpUserUtils.disable(userId, -1);
                StpUserUtils.logout(userId);
            }
        }

        log.info("当前状态: " + isDelete + ", 当前是否解封: " + StpUserUtils.isDisable(userId));

        if (userMapper.updateById(
                new CivilUser()
                        .setUserId(userId)
                        .setIsDelete(isDelete)
        ) > 0) {
            return Result.ok().message("操作成功");
        }
        return Result.fail().message("操作失败");
    }

    /**
     * 删除用户--设置状态(可多删除)
     * @param userIds 用户ID列表
     * @return 是否删除成功
     */
    @Override
    public Result deleteUserOfAdmin(List<Long> userIds) {
        boolean flag = true;
        List<Long> userOutIds = new ArrayList<>();
        for (Long userId : userIds) {
            if (StpUserUtils.isLogin(userId)) {
                log.info("userId -> {}", userId);
                userOutIds.add(userId);
                StpUserUtils.logout(userId);

            }
            if (userMapper.updateById(
                    new CivilUser()
                            .setUserId(userId)
                            .setIsDelete((byte) 2)
            ) <= 0) {
                flag = false;

            }
        }

        log.info("userOutIds -> {}", userOutIds);
        if (flag) {
            if (userOutIds.size() > 0) {
                return Result.ok().message("用户删除成功,用户ID为:" + userOutIds + "被强制下线");
            }
            return Result.ok().message("用户删除成功");
        }
        return Result.fail().message("用户删除失败");
    }

    /**
     * 查询用户(角色:用户、讲师)
     * @param userQueryParams 用户参数
     * @return 查询的用户信息
     */
    @Override
    public Result userInfoByUserRole(UserQueryParams userQueryParams) {
        if (userQueryParams.getUserRole() == null) {
            return Result.build(null).code(HttpStatus.REQUESTED_RANGE_NOT_SATISFIABLE.getCode()).message("未携带角色参数");
        }

        // 查询角色
        List<UserInfoVo> userInfoVoList = new ArrayList<>();
        IPage<UserInfoVo> userInfoVoIpage = new Page<>();

        CivilRole role = roleMapper.selectOne(
                new LambdaQueryWrapper<CivilRole>()
                        .eq(CivilRole::getRoleDescribe, userQueryParams.getUserRole())
        );

        if (role == null) {
            return Result.build(null).code(HttpStatus.NOT_FOUND.getCode()).message("未有该角色");
        }

        // 查询所有拥有该角色的管理员
        Page<UserRole> userRolePage = userRoleMapper.selectPage(
                new Page<>(userQueryParams.getCurrentPage(), userQueryParams.getPageSize()),
                new LambdaQueryWrapper<UserRole>()
                        .eq(UserRole::getRoleId, role.getRoleId())
                        .orderByDesc(UserRole::getUserRoleId)
        );

        BeanUtil.copyProperties(userRolePage, userInfoVoIpage);

        if (userRolePage.getRecords().size() == 0) {
            return Result.build(null).code(HttpStatus.NOT_FOUND.getCode()).message("未找到该角色的用户");
        }

        // 封装数据
        for (UserRole userRole : userRolePage.getRecords()) {
            UserInfoVo userInfoVo = new UserInfoVo();

            LambdaQueryWrapper<CivilUser> queryWrapper = new LambdaQueryWrapper<CivilUser>()
                    .eq(CivilUser::getUserId, userRole.getUserId())
                    .orderByDesc(CivilUser::getCreateTime);

            if ("讲师".equals(userQueryParams.getUserRole())) {
                if (userQueryParams.getUsername() != null) {
                    queryWrapper
                            .like(CivilUser::getUsername, userQueryParams.getUsername());
                }
                if (userQueryParams.getUserEmail() != null) {
                    queryWrapper
                            .like(CivilUser::getUserEmail, userQueryParams.getUserEmail());
                }
                if (userQueryParams.getNickname() != null) {
                    queryWrapper
                            .like(CivilUser::getNickname, userQueryParams.getNickname());
                }
            }
            CivilUser civilUser = userMapper.selectOne(queryWrapper);

            if (civilUser == null) {
                return Result.fail().message("操作失败");
            }

            civilUser.setHeadPortrait(minioUtil.preview(civilUser.getHeadPortrait()));
            BeanUtil.copyProperties(civilUser, userInfoVo);

            if ("讲师".equals(userQueryParams.getUserRole())) {
                String jsonString = JSON.toJSONString(courseClient.queryCourseNumberByUserId(civilUser.getUserId()).getData());
                Map<String, Object> resultMap = JSONObject.parseObject(jsonString, Map.class);


                if (Long.parseLong(resultMap.get("count").toString()) > 0) {
                    userInfoVo.setCourseNumber(Long.parseLong(resultMap.get("count").toString()));
                    userInfoVo.setTeacherIntroduction(resultMap.get("teacherIntroduction").toString());
                } else {
                    userInfoVo.setCourseNumber(0L);
                    userInfoVo.setTeacherIntroduction("无");
                }
            }

            userInfoVo.setUserRole(userQueryParams.getUserRole());
            userInfoVoList.add(userInfoVo);


        }

        userInfoVoIpage.setRecords(userInfoVoList);

        return Result.ok(userInfoVoIpage).message("查询成功");
    }

    /**
     * 查询用户(邮箱查询、登录名称查询、昵称查询、所有查询)
     *
     * @param userQueryParams 用户参数
     * @return 查询的用户信息
     */
    @Override
    public Result userInfoByUsernameOrEmailOrNickname(UserQueryParams userQueryParams) {
        // 初始化分页数据
        IPage page = new Page(userQueryParams.getCurrentPage(), userQueryParams.getPageSize());

        LambdaQueryWrapper<CivilUser> queryWrapper = new LambdaQueryWrapper<>();
        // 判断参数有哪些存在
        if (userQueryParams.getUsername() != null) {
            queryWrapper
                    .like(CivilUser::getUsername, userQueryParams.getUsername());
        }
        if (userQueryParams.getUserEmail() != null) {
            queryWrapper
                    .like(CivilUser::getUserEmail, userQueryParams.getUserEmail());
        }
        if (userQueryParams.getNickname() != null) {
            queryWrapper
                    .like(CivilUser::getNickname, userQueryParams.getNickname());
        }

        queryWrapper.orderByDesc(CivilUser::getCreateTime);

        // 查询用户
        IPage<CivilUser> userInfoPage = userMapper
                .selectPage(page, queryWrapper);

        // 判断是否有用户信息
        if (userInfoPage.getRecords().size() == 0) {
            return Result.build(null).code(HttpStatus.NO_CONTENT.getCode()).message("未查询到用户");
        }

        // 封装用户回显信息
        List<UserInfoVo> userInfoVoList = new ArrayList<>();
        IPage<UserInfoVo> userInfoVoIpage = new Page<>();

        // 深拷贝
        BeanUtil.copyProperties(userInfoPage, userInfoVoIpage);

        // 设置用户角色
        for (CivilUser user : userInfoPage.getRecords()) {
            UserInfoVo userInfoVo = new UserInfoVo();
            UserRole userRoleInfo = userRoleMapper
                    .selectOne(
                            new LambdaQueryWrapper<UserRole>()
                                    .eq(UserRole::getUserId, user.getUserId())
                    );
            String userRole = "";
            if (userRoleInfo != null) {
                userRole = roleMapper
                        .selectById(userRoleInfo.getRoleId())
                        .getRoleDescribe();
            }
            BeanUtil.copyProperties(user, userInfoVo);
            userInfoVo.setUserRole(userRole);
            userInfoVo.setHeadPortrait(minioUtil.preview(userInfoVo.getHeadPortrait()));

            log.info("userInfoVo -> {}", userInfoVo);
            userInfoVoList.add(userInfoVo);
        }

        userInfoVoIpage.setRecords(userInfoVoList);

        return Result.ok(userInfoVoIpage).message("查询成功");
    }

    /**
     * 查询用户(拥有的所有勋章信息)
     * @return 用户拥有的勋章信息
     */
    @Override
    public Result userMedalInfo(Long userId) {
        // 查询勋章
        List<Long> medalIds = userMedalMapper
                .selectUserMedalListByUserId(userId);

        // 封装数据
        List<MedalInfoVo> medalInfoVoList = new ArrayList<>();
        for (Long medalId : medalIds) {
            MedalInfoVo medalInfoVo = medalAuthorityMapper
                    .medalInfoVoByMedalId(medalId);
            medalInfoVoList.add(medalInfoVo);
        }

        if (medalInfoVoList.size() > 0) {

            medalInfoVoList = medalInfoVoList.stream()
                    .peek(
                            medalInfoVo -> medalInfoVo.setMedalIcon(minioUtil.preview(medalInfoVo.getMedalIcon()))
                    )
                    .toList();
            return Result.ok(medalInfoVoList).message("查询成功");
        }
        return Result.fail().code(HttpStatus.NOT_FOUND.getCode()).message("查询失败");
    }

    /**
     * 查询角色登录日志
     * @param userQueryParams 查询参数
     * @return 角色登录日志
     */
    @Override
    public Result queryLoginLog(UserQueryParams userQueryParams) {
        LambdaQueryWrapper<LoginLog> wrapper = new LambdaQueryWrapper<>();

        if (ObjectUtil.isNotEmpty(userQueryParams.getUsername())) {
            wrapper.like(LoginLog::getUsername, userQueryParams.getUsername());
        }

        if (ObjectUtil.isNotEmpty(userQueryParams.getUserRole())) {
            wrapper.eq(LoginLog::getLoginType, userQueryParams.getUserRole());
        }

        // 查询所有登录日志信息
        IPage<LoginLog> loginLog = loginLogMapper.selectPage(
                new Page<>(userQueryParams.getCurrentPage(), userQueryParams.getPageSize()),
                wrapper
        );

        if (loginLog.getRecords().size() > 0) {
            return Result.ok(loginLog).message("查询成功");
        }
        return Result.fail().code(HttpStatus.NOT_FOUND.getCode()).message("查询失败");
    }

    /**
     * 删除登录日志
     * @param loginLogIds 登录日志ID
     * @return 登录日志删除结果
     */
    @Override
    public Result deleteLoginLog(List<Long> loginLogIds) {
        int rows = loginLogMapper.deleteBatchIds(loginLogIds);

        if (rows == 0) {
            return Result.fail().message("操作失败");
        }
        return Result.ok().message("操作成功");
    }

    /**
     * 清空登录日志
     * @return 操作是否成功
     */
    @Override
    public Result clearAllLoginLog() {
        int rows = loginLogMapper.delete(null);

        if (rows == 0) {
            return Result.fail().message("操作失败");
        }
        return Result.ok().message("操作成功");
    }

    /**
     * 获取所有角色信息
     * @param pageParams 分页参数
     * @return 所有角色信息
     */
    @Override
    public Result getAllRole(PageParams pageParams) {
        IPage<CivilRole> rolePage = roleMapper.selectPage(
                new Page<>(pageParams.getCurrentPage(), pageParams.getPageSize()),
                null
        );

        if (rolePage.getRecords().size() == 0) {
            return Result.fail().message("操作失败").code(HttpStatus.NOT_FOUND.getCode());
        }

        return Result.ok(rolePage).message("操作成功");
    }

    /**
     * 获取所有勋章信息
     * @param pageParams 分页参数
     * @return 所有勋章信息
     */
    @Override
    public Result getAllMedal(PageParams pageParams) {
        // 查询
        IPage<MedalAuthority> medalAuthorityIpage = medalAuthorityMapper.selectPage(
                new Page<>(pageParams.getCurrentPage(), pageParams.getPageSize()),
                null
        );

        // 判空
        if (medalAuthorityIpage.getRecords().size() == 0) {
            return Result.fail().message("操作成功").code(HttpStatus.NOT_FOUND.getCode());
        }

        // 封装
        medalAuthorityIpage.setRecords(
                medalAuthorityIpage.getRecords().stream().peek(
                        medal -> medal.setMedalIcon(minioUtil.preview(medal.getMedalIcon()))
                ).toList()
        );

        return Result.ok(medalAuthorityIpage).message("操作成功");
    }

    /**
     * 管理员升级为超级管理员
     * @param adminId 管理员ID
     * @return 是否升级成功
     */
    @Override
    public Result adminUpgradeSuperAdmin(Long adminId) {
        if (adminRoleMapper.selectCount(
                new LambdaQueryWrapper<AdminRole>()
                        .eq(AdminRole::getAdminId, adminId)
                        .eq(AdminRole::getRoleId, UseConstant.ROLE_SUPER_ADMIN_ID)
        ) > 0) {
         return Result.fail().code(HttpStatus.FOUND.getCode()).message("管理员已经是超级管理员");
        }
        // 判断管理员是否存在记录
        if (adminRoleMapper.selectCount(
                new LambdaQueryWrapper<AdminRole>()
                        .eq(AdminRole::getAdminId, adminId)
        ) > 0) {
            // 更新
            if (adminRoleMapper.update(
                    new AdminRole().setRoleId(UseConstant.ROLE_SUPER_ADMIN_ID),
                    new LambdaQueryWrapper<AdminRole>()
                            .eq(AdminRole::getAdminId, adminId)
            ) > 0) {
                return Result.ok().message("管理员升级成功");
            } else {
                return Result.fail().message("管理员升级失败");
            }
        } else {
            // 新增
            if (adminRoleMapper.insert(
                    new AdminRole()
                            .setAdminId(adminId)
                            .setRoleId(UseConstant.ROLE_SUPER_ADMIN_ID)
            ) > 0) {
                return Result.ok().message("管理员升级成功");
            } else {
                return Result.fail().message("管理员升级失败");
            }
        }
    }

    /**
     * 查看申请讲师的材料信息
     * @param userQueryParams 分页参数
     * @return 材料信息
     */
    @Override
    public Result teacherApplyInfo(UserQueryParams userQueryParams) {

        // 查找申请材料信息(待审批的)
        IPage<TeacherAudit> teacherAuditPage = teacherAuditMapper.selectPage(
                new Page<>(userQueryParams.getCurrentPage(), userQueryParams.getPageSize()),
                new LambdaQueryWrapper<TeacherAudit>()
                        .eq(TeacherAudit::getStatus, 0)
        );

        // 初步封装数据
        List<TeacherApplyVo> teacherApplyVoList = new ArrayList<>();
        IPage<TeacherApplyVo> teacherApplyVoPage = new Page<>();

        BeanUtil.copyProperties(teacherAuditPage, teacherApplyVoPage);

        // 存在申请材料信息
        if (teacherAuditPage.getRecords().size() > 0) {
            for (TeacherAudit teacherAudit : teacherAuditPage.getRecords()) {
                CivilUser civilUser = userMapper
                        .selectById(teacherAudit.getUserId());

                // 封装数据
                TeacherApplyVo teacherApplyVo = new TeacherApplyVo();
                BeanUtil.copyProperties(teacherAudit, teacherApplyVo);
                if (civilUser != null) {
                    teacherApplyVo.setUsername(civilUser.getUsername());
                    teacherApplyVo.setNickname(civilUser.getNickname());
                    teacherApplyVo.setUserEmail(civilUser.getUserEmail());
                    teacherApplyVo.setHeadPortrait(minioUtil.preview(civilUser.getHeadPortrait()));
                }

                teacherApplyVo.setCertificatePhoto(minioUtil.preview(teacherApplyVo.getCertificatePhoto()));
                teacherApplyVoList.add(teacherApplyVo);
            }

            teacherApplyVoPage.setRecords(teacherApplyVoList);

            return Result.ok(teacherApplyVoPage).message("查询成功");
        }
        return Result.fail().code(HttpStatus.NOT_FOUND.getCode()).message("未找到申请材料信息");
    }

    /**
     * 取消讲师资格(删除讲师角色)
     * @param userId 用户ID
     * @return 是否取消成功
     */
    @Override
    public Result deleteTeacher(Long userId) {
        // 更新用户角色
        if (userRoleMapper.
                update(
                        new UserRole().setRoleId(UseConstant.ROLE_USER_ID),
                        new LambdaQueryWrapper<UserRole>()
                                .eq(UserRole::getUserId, userId)
                ) > 0) {
            // 删除申请记录
            if (teacherAuditMapper.update(
                    new TeacherAudit().setStatus((byte) 0),
                    new LambdaQueryWrapper<TeacherAudit>()
                            .eq(TeacherAudit::getUserId, userId)
            ) > 0) {
                return Result.ok().message("取消讲师资格成功");
            } else {
                return Result.fail().message("取消讲师资格失败");
            }
        }
        return Result.fail().message("取消讲师资格失败");
    }

    /**
     * 同意讲师申请
     * @param userId 用户ID
     * @return 同意是否成功
     */
    @Override
    public Result agreeTeacherApply(Long userId) {
        // 同意状态为1
        if (teacherAuditMapper.update(
                new TeacherAudit().setStatus((byte) 1),
                new LambdaQueryWrapper<TeacherAudit>()
                       .eq(TeacherAudit::getUserId, userId)
        ) > 0) {
            // 设置角色为讲师
            if (userRoleMapper.selectOne(
                    new LambdaQueryWrapper<UserRole>()
                            .eq(UserRole::getUserId, userId)
            ) != null) {
                userRoleMapper.update(
                        new UserRole().setRoleId((long) 3),
                        new LambdaQueryWrapper<UserRole>()
                                .eq(UserRole::getUserId, userId)
                );
            } else {
                userRoleMapper.insert(new UserRole().setUserId(userId).setRoleId((long) 3));
            }
            return Result.ok().message("同意讲师申请成功");
        }
        return Result.ok().message("同意讲师申请失败");
    }

    /**
     * 不同意讲师申请
     * @param disagreeApplyParams 不同意申请参数
     * @return 不同意是否成功
     */
    @Override
    public Result disagreeTeacherApply(DisagreeApplyParams disagreeApplyParams) {
        // 不同意状态为2、原因
        if (teacherAuditMapper
                .update(
                        new TeacherAudit()
                                .setAuditFailureReason(disagreeApplyParams.getAuditFailureReason())
                                .setStatus((byte) 2),
                        new LambdaQueryWrapper<TeacherAudit>()
                                .eq(TeacherAudit::getUserId, disagreeApplyParams.getUserId())
                ) > 0) {
            return Result.ok().message("不同意讲师申请成功");
        }
        return Result.fail().message("不同意讲师申请失败");
    }

    /**
     * 获取用户数量(API调用)
     * @return 用户数量
     */
    @Override
    public Result getUserNumber() {
        Long count = userRoleMapper.selectCount(new LambdaQueryWrapper<UserRole>().eq(UserRole::getRoleId, UseConstant.ROLE_USER_ID));
        return Result.ok(count).message("操作成功");
    }

    /**
     * 获取讲师数量(API调用)
     * @return 讲师数量
     */
    @Override
    public Result getTeacherNumber() {
        Long count = userRoleMapper.selectCount(new LambdaQueryWrapper<UserRole>().eq(UserRole::getRoleId, UseConstant.ROLE_TEACHER_ID));
        return Result.ok(count).message("操作成功");
    }

    /**
     * 获取登录次数(API调用)
     * @return 登录次数
     */
    @Override
    public Result getLoginLogNumber() {
        Long count = loginLogMapper.selectCount(null);
        return Result.ok(count).message("操作成功");
    }

    /**
     * 赋予用户勋章(API调用)
     * @param userId  用户ID
     * @param medalId 勋章ID
     * @return 是否赋予成功
     */
    @Override
    public Result setUserMedal(Long userId, Long medalId) {
        Integer number = medalAuthorityMapper.selectById(medalId).getViewVideoNumber();

        if (userMedalMapper.selectCount(
                new LambdaQueryWrapper<UserMedal>()
                        .eq(UserMedal::getUserId, userId)
                        .eq(UserMedal::getMedalId, medalId)
        ) > 0) {
            return Result.fail().message("该勋章已被赋予");
        } else {
            int rows = userMedalMapper.insert(
                    new UserMedal()
                            .setUserId(userId)
                            .setMedalId(medalId)
            );

            CivilUser user = userMapper.selectById(userId);
            user.setFreeViewNumber(user.getFreeViewNumber() + number);

            if (rows == 0) {
                return Result.fail().message("操作失败");
            }

            return Result.ok().message("操作成功");
        }
    }

    /**
     * 删除用户勋章(API调用)
     * @param userId  用户ID
     * @param medalId 勋章ID
     * @return 是否删除成功
     */
    @Override
    public Result deleteUserMedal(Long userId, Long medalId) {
        Integer number = medalAuthorityMapper.selectById(medalId).getViewVideoNumber();

        if (userMedalMapper.selectCount(
                new LambdaQueryWrapper<UserMedal>()
                        .eq(UserMedal::getUserId, userId)
                        .eq(UserMedal::getMedalId, medalId)
        ) > 0) {
            if (userMedalMapper.delete(
                    new LambdaQueryWrapper<UserMedal>()
                            .eq(UserMedal::getUserId, userId)
                            .eq(UserMedal::getMedalId, medalId)
            ) > 0) {
                CivilUser user = userMapper.selectById(userId);
                user.setFreeViewNumber(user.getFreeViewNumber() - number);
                return Result.ok().message("删除成功");
            } else {
                return Result.fail().message("删除失败");
            }
        } else {
            return Result.fail().message("该勋章未被赋予");
        }
    }

    /**
     * 获取所有在线用户
     * @return 所有在线用户
     */
    @Override
    public Result getAllOnlineUser() {
        List<CivilUser> users = userMapper.selectList(null);

        // 判空
        if (users.size() == 0) {
            return Result.fail().message("未查询到相关信息");
        }

        // 封装
        List<Map<String, Object>> userListVo = new ArrayList<>();
        users.forEach(user -> {
            Map<String, Object> userMap = new HashMap<>();
            userMap.put("id", user.getUserId());
            userMap.put("nickname",user.getNickname());
            userMap.put("userAvatar",minioUtil.preview(user.getHeadPortrait()));
            userListVo.add(userMap);
        });

        return Result.ok(userListVo).message("操作成功");
    }

    /**
     * 获取所有聊天记录
     * @param adminId 管理员ID
     * @param userId  用户ID
     * @return 所有聊天记录
     */
    @Override
    public Result getAllChatRecords(Long adminId, Long userId) {
        String key = Stream.of(
                        UseConstant.ADMIN_REAL_CONSTANT + UseConstant.COLON_CONSTANT + adminId,
                        UseConstant.USER_CONSTANT + UseConstant.COLON_CONSTANT + userId

                )
                .sorted()
                .collect(Collectors.joining(UseConstant.ROD_CONSTANT));

        List<Object> objectList = redisUtil.get(key);

        if (objectList.size() == 0) {
            return Result.fail().message("操作失败").code(HttpStatus.NOT_FOUND.getCode());
        }

        return Result.ok(objectList).message("操作成功");
    }

    /**
     * 新增角色
     * @param role 角色信息
     * @return 是否操作成功
     */
    @Override
    public Result addRole(CivilRole role) {
        if (roleMapper.insert(role) > 0) {
            return Result.ok().message("操作成功");
        }
        return Result.fail().message("操作失败");
    }

    /**
     * 修改角色
     * @param role 角色信息
     * @return 是否操作成功
     */
    @Override
    public Result updateRole(CivilRole role) {
        if (roleMapper.updateById(role) > 0) {
            return Result.ok().message("操作成功");
        }
        return Result.fail().message("操作失败");
    }

    /**
     * 删除角色
     * @param roleIds 角色ID列表
     * @return 是否操作成功
     */
    @Override
    public Result deleteRole(List<Long> roleIds) {
        if (roleMapper.deleteBatchIds(roleIds) > 0) {
            return Result.ok().message("操作成功");
        }
        return Result.fail().message("操作失败");
    }

    /**
     * 添加勋章
     * @param medalAuthority 勋章信息
     * @return 是否操作成功
     */
    @Override
    public Result addMedal(MedalAuthority medalAuthority) {
        if (medalAuthorityMapper.insert(medalAuthority) > 0) {
            return Result.ok().message("操作成功");
        }
        return Result.fail().message("操作失败");
    }

    /**
     * 修改勋章
     * @param medalAuthority 勋章信息
     * @return 是否操作成功
     */
    @Override
    public Result updateMedal(MedalAuthority medalAuthority) {
        if (medalAuthority.getMedalIcon().matches("^http?://.*$")) {
            // 图片没修改
            medalAuthority.setMedalIcon(null);
        }

        if (medalAuthorityMapper.updateById(medalAuthority) > 0) {
            return Result.ok().message("操作成功");
        }
        return Result.fail().message("操作失败");
    }

    /**
     * 删除勋章
     * @param medalIds 勋章ID
     * @return 是否操作成功
     */
    @Override
    public Result deleteMedal(List<Long> medalIds) {
        if (medalAuthorityMapper.deleteBatchIds(medalIds) > 0) {
            return Result.ok().message("操作成功");
        }
        return Result.fail().message("操作失败");
    }

    /**
     * 上传勋章图标
     * @param file 文件
     * @param username 用户名
     * @return 是否操作成功
     */
    @Override
    public Result submitMedalIcon(MultipartFile file, String username) {
        // 上传
        String medalIcon = minioUtil.upload(
                file,
                null,
                UseConstant.ROLE_SUPER_ADMIN,
                "username: " + username
        );

        // 判空
        if (medalIcon == null) {
            return Result.fail().message("勋章图标上传失败");
        }

        // 封装
        Map<String, String> map = new HashMap<>();
        map.put("oldPath", medalIcon);
        map.put("newPath", minioUtil.preview(medalIcon));

        return Result.ok(map).message("勋章图标上传成功");
    }

    /**
     * 获取所有用户ID和昵称
     * @return 所有用户ID和昵称
     */
    @Override
    public Result getUserIdAndNickname() {
        List<CivilUser> users = userMapper.selectList(null);

        if (users.size() == 0) {
            return Result.fail().message("未查询到相关信息").code(HttpStatus.NOT_FOUND.getCode());
        }

        List<Map<String, Object>> userListVo = new ArrayList<>();

        for (CivilUser user : users) {
            Map<String, Object> userMap = new HashMap<>();
            userMap.put("key", user.getUserId());
            userMap.put("label", user.getNickname());

            userListVo.add(userMap);
        }


        return Result.ok(userListVo).message("操作成功");
    }

}
