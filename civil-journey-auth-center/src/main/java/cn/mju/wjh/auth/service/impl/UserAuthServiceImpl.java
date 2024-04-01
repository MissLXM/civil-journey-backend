package cn.mju.wjh.auth.service.impl;

import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.util.RandomUtil;
import cn.hutool.crypto.symmetric.SymmetricCrypto;
import cn.mju.wjh.common.core.entity.pojo.user.LoginLog;
import cn.mju.wjh.common.core.utils.AddressUtils;
import cn.mju.wjh.common.core.utils.IpUtils;
import cn.mju.wjh.common.minio.utils.MinioUtil;
import cn.mju.wjh.common.security.mapper.CivilRoleMapper;
import cn.mju.wjh.common.security.mapper.LoginLogMapper;
import cn.mju.wjh.common.security.mapper.UserRoleMapper;
import cn.mju.wjh.auth.service.UserAuthService;
import cn.mju.wjh.common.core.constant.UseConstant;
import cn.mju.wjh.common.core.entity.param.user.LoginEmailParams;
import cn.mju.wjh.common.core.entity.param.user.LoginUsernameParams;
import cn.mju.wjh.common.core.entity.param.user.UserRegisterParams;
import cn.mju.wjh.common.core.entity.pojo.user.CivilUser;
import cn.mju.wjh.common.core.entity.pojo.user.UserRole;
import cn.mju.wjh.common.core.enums.HttpStatus;
import cn.mju.wjh.common.core.utils.Result;
import cn.mju.wjh.common.email.exception.SendEmailException;
import cn.mju.wjh.common.email.utils.EmailUtils;
import cn.mju.wjh.common.security.mapper.CivilUserMapper;
import cn.mju.wjh.common.security.utils.LoginUserUtils;
import cn.mju.wjh.common.security.utils.StpUserUtils;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import jakarta.mail.MessagingException;
import jakarta.servlet.http.HttpServletRequest;
import lombok.Setter;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.stereotype.Service;

import java.util.Map;
import java.util.concurrent.TimeUnit;

/**
 * ClassName: UserAuthServiceImpl
 * Package: cn.mju.wjh.auth.service.impl
 * Description: 用户认证服务实现
 *
 * @Author:wjh
 * @Create:2023-12-2023/12/9--21:14
 */
@Slf4j
@Service
public class UserAuthServiceImpl implements UserAuthService {

    @Value("${sa-token.key}")
    private String key;

    @Setter(onMethod_ = @Autowired)
    private MinioUtil minioUtil;

    @Setter(onMethod_ = @Autowired)
    private EmailUtils emailUtils;

    @Setter(onMethod_ = @Autowired)
    private StringRedisTemplate redisTemplate;

    @Setter(onMethod_ = @Autowired)
    private CivilUserMapper userMapper;

    @Setter(onMethod_ = @Autowired)
    private CivilRoleMapper roleMapper;

    @Setter(onMethod_ = @Autowired)
    private UserRoleMapper userRoleMapper;

    @Setter(onMethod_ = @Autowired)
    private LoginLogMapper loginLogMapper;

    @Setter(onMethod_ = @Autowired)
    private LoginUserUtils loginUserUtils;

    /**
     * 获取邮箱验证码
     * @param email 邮箱
     * @return 是否发送成功
     */
    @Override
    public Result<String> getEmailCode(String email) {
        // 生成验证码
        String emailCode = RandomUtil.randomString(5);
        // 将验证码存入Redis,并设置过期时间(5分钟) ,TimeUnit.MINUTES(单位为秒)
        redisTemplate.delete(email + UseConstant.EMAIL_CODE_CONSTANT);
        redisTemplate.opsForValue().set(email + UseConstant.EMAIL_CODE_CONSTANT, emailCode, UseConstant.EMAIL_CODE_TIME, TimeUnit.MINUTES);

        // 发送邮件
        boolean isSendEmail;
        try {
            log.info("验证码(code):" + emailCode);
             isSendEmail = emailUtils.sendEmailGetCode(email, emailCode);
        } catch (MessagingException e) {
            throw new SendEmailException("邮件发送异常");
        }
        if (isSendEmail) {
            return Result.ok().message("邮件发送成功");
        }
        return Result.fail().message("邮件发送失败");
    }

    /**
     * 用户注册
     * @param registerParams 注册参数
     * @return 是否注册成功
     */
    @Override
    public Result userRegister(UserRegisterParams registerParams) {
        // 判断邮箱是否已经被注册
        CivilUser user = userMapper.selectOne(
                new LambdaQueryWrapper<CivilUser>()
                        .eq(CivilUser::getUserEmail, registerParams.getUserEmail())
        );
        if (user != null) {
            return Result.ok().code(HttpStatus.FOUND.getCode()).message("邮箱已存在");
        }

        // 判断验证码是否正确
        String emailCode = redisTemplate.opsForValue().get(registerParams.getUserEmail() + UseConstant.EMAIL_CODE_CONSTANT);
        if (emailCode == null) {
            return Result.ok().code(HttpStatus.NOT_FOUND.getCode()).message("当前邮箱和获取验证码的邮箱不一致");
        }
        if (!registerParams.getEmailCode().equals(emailCode)) {
            return Result.ok().code(HttpStatus.BAD_REQUEST.getCode()).message("验证码错误");
        }

        // 判断昵称是否被使用
        user = userMapper.selectOne(
                new LambdaQueryWrapper<CivilUser>()
                        .eq(CivilUser::getNickname, registerParams.getNickname())
        );
        if (user != null) {
            return Result.ok().code(HttpStatus.FOUND.getCode()).message("昵称已被使用");
        }

        // 判断登录名称是否被使用
        user = userMapper.selectOne(
                new LambdaQueryWrapper<CivilUser>()
                        .eq(CivilUser::getUsername, registerParams.getUsername())
        );
        if (user != null) {
            return Result.ok().code(HttpStatus.FOUND.getCode()).message("登录名称已存在");
        }

        // 密码进行加密
        SymmetricCrypto aes = loginUserUtils.getAes(key);
        registerParams.setPassword(aes.encryptBase64(registerParams.getPassword()));

        // 注册
        user = new CivilUser();
        BeanUtil.copyProperties(registerParams, user);
        if (userMapper.insert(user) > 0) {
            // 删除Redis中存储的验证码
            redisTemplate.delete(registerParams.getUserEmail() + UseConstant.EMAIL_CODE_CONSTANT);

            // 查询用户ID
            Long userId = userMapper.selectOne(
                    new LambdaQueryWrapper<CivilUser>()
                            .eq(CivilUser::getUsername, user.getUsername())
            ).getUserId();

            // 新增角色
            UserRole userRole =
                    new UserRole()
                            .setUserId(userId)
                            .setRoleId(UseConstant.ROLE_USER_ID);
            if (userRoleMapper.insert(userRole) > 0) {
                log.info("用户角色被赋予");
            }
            return Result.ok().message("注册成功");
        }
        // 删除Redis中存储的验证码
        redisTemplate.delete(registerParams.getUserEmail() + UseConstant.EMAIL_CODE_CONSTANT);
        return Result.fail().message("注册失败");
    }

    /**
     * 用户登录(登录名称)
     * @param loginUsernameParams 登录参数
     * @return 是否登录成功
     */
    @Override
    public Result<String> userLoginByUsername(HttpServletRequest request, LoginUsernameParams loginUsernameParams) {

        // 根据登录名称查询用户
        CivilUser user = userMapper.selectOne(
                new LambdaQueryWrapper<CivilUser>()
                        .eq(CivilUser::getUsername, loginUsernameParams.getUsername())
        );
        if (user == null) {
            return Result.ok().code(HttpStatus.NOT_FOUND.getCode()).message("登录名称不存在");
        }

        if (user.getIsDelete() != 0) {
            return Result.ok().code(HttpStatus.NOT_FOUND.getCode()).message("该用户已被禁用");
        }

        String loginErrorKey = UseConstant.USER_CONSTANT + UseConstant.ROD_CONSTANT + user.getUsername() + UseConstant.LOGIN_ERROR_NUMBER;

        // 判断用户是否被封禁
        if (StpUserUtils.isDisable(user.getUserId())) {
            if (redisTemplate.opsForValue().get(loginErrorKey) != null) {
                redisTemplate.delete(loginErrorKey);
            }
            return Result.build(null).code(
                    HttpStatus.FORBIDDEN.getCode()
            ).message("登录失败,账号:" + user.getUsername() + "已被封禁,剩余时间: " + StpUserUtils.getDisableTime(user.getUserId()) + "秒");
        }

        // 密码解密,比较
        if (loginUsernameParams.getPassword().equals(loginUserUtils.getAes(key).decryptStr(user.getPassword()))) {
            // 记录日志
            recordLog(request, user.getUserId(), user.getUsername());
            // 清空登录失败次数
            redisTemplate.delete(loginErrorKey);
            // 返回token
            user.setHeadPortrait(minioUtil.preview(user.getHeadPortrait()));
            return Result.ok(loginUserUtils.getLoginUserInfo(user)).message("登录成功");
        }

        // 登录失败次数 + 1(要是大于5次就锁定用户)
        return getStringResult(user.getUserId(), loginErrorKey, "用户名密码错误");
    }

    /**
     * 用户登录(邮箱)
     * @param loginEmailParams 登录参数
     * @return 是否登录成功
     */
    @Override
    public Result<String> userLoginByEmail(HttpServletRequest request, LoginEmailParams loginEmailParams) {
        // 根据登录名称查询用户
        CivilUser user = userMapper.selectOne(
                new LambdaQueryWrapper<CivilUser>()
                        .eq(CivilUser::getUserEmail, loginEmailParams.getUserEmail())
                        .eq(CivilUser::getIsDelete, (byte) 0)
        );
        if (user == null) {
            return Result.ok().code(HttpStatus.NOT_FOUND.getCode()).message("邮箱不存在");
        }

        String loginErrorKey = UseConstant.USER_CONSTANT + UseConstant.ROD_CONSTANT + user.getUsername() + UseConstant.LOGIN_ERROR_NUMBER;

        // 判断用户是否被封禁
        if (StpUserUtils.isDisable(user.getUserId())) {
            if (redisTemplate.opsForValue().get(loginErrorKey) != null) {
                redisTemplate.delete(loginErrorKey);
            }
            return Result.build(null).code(
                    HttpStatus.FORBIDDEN.getCode()
            ).message("登录失败,账号:" + user.getUsername() + "已被封禁,剩余时间: " + StpUserUtils.getDisableTime(user.getUserId()) + "秒");
        }

        // 判断该邮箱是否获取验证码
        String emailCode = redisTemplate.opsForValue().get(loginEmailParams.getUserEmail() + UseConstant.EMAIL_CODE_CONSTANT);
        if (emailCode == null) {
            return Result.fail().code(HttpStatus.NOT_FOUND.getCode()).message("该邮箱未获取验证码");
        }

        // 判断验证码和redis存储的验证码是否一致
        if (loginEmailParams.getEmailCode().equals(emailCode)) {
            // 记录日志
            recordLog(request, user.getUserId(), user.getUsername());
            // 删除Redis中存储的验证码
            redisTemplate.delete(loginEmailParams.getUserEmail() + UseConstant.EMAIL_CODE_CONSTANT);
            // 清空登录失败次数
            redisTemplate.delete(loginErrorKey);
            // 返回token
            user.setHeadPortrait(minioUtil.preview(user.getHeadPortrait()));
            return Result.ok(loginUserUtils.getLoginUserInfo(user)).message("登录成功");
        }

        // 登录失败次数 + 1(要是大于5次就锁定用户)
        return getStringResult(user.getUserId(), loginErrorKey, "验证码错误");
    }

    /**
     * 记录日志
     * @param request 请求
     * @param userId 用户ID
     * @param username 登录名称
     */
    private void recordLog(HttpServletRequest request, Long userId, String username) {
        // 登录
        StpUserUtils.login(userId, UseConstant.LOGIN_DEVICE);
        // 记录登录日志
        Map<String, String> ip = AddressUtils.getIp(IpUtils.getIpAddr(request));
        String ipAddress;
        String realArea;
        ipAddress = ip.get("ipAddress");
        realArea = ip.get("realArea");
        loginLog(ipAddress, realArea, username);
    }

    /**
     * 登录日志
     * @param ipAddress ip地址
     * @param realArea 地址区域
     * @param username 登录名称
     */
    private void loginLog(String ipAddress, String realArea, String username) {
        Long userId = userMapper.selectOne(
                new LambdaQueryWrapper<CivilUser>()
                        .eq(CivilUser::getUsername, username)
        ).getUserId();

        Long roleId = userRoleMapper.selectOne(
                new LambdaQueryWrapper<UserRole>()
                        .eq(UserRole::getUserId, userId)
        ).getRoleId();

        String roleDescribe = roleMapper.selectById(roleId).getRoleDescribe();

        if (loginLogMapper.insert(
                new LoginLog()
                        .setUsername(username)
                        .setIpAddress(ipAddress)
                        .setIpLocation(realArea)
                        .setLoginType(roleDescribe)
        ) > 0) {
            log.info("用户登录成功");
        } else {
            log.info("用户登录失败");
        }
    }

    /**
     * 获取登录失败次数
     * @param loginErrorKey 登录失败次数key
     * @return 登录失败次数
     */
    private String getErrorNumber(String loginErrorKey) {
        // 登录失败次数 + 1(要是大于5次就锁定用户)
        String errorNumber = redisTemplate.opsForValue()
                .get(loginErrorKey);
        log.info("登录失败次数 -> {}", errorNumber);
        if (errorNumber == null || "".equals(errorNumber)) {
            redisTemplate.opsForValue().set(loginErrorKey, String.valueOf(1));
        } else {
            redisTemplate.opsForValue().set(loginErrorKey, String.valueOf(Integer.parseInt(errorNumber) + 1));
        }

        if (errorNumber == null) {
            errorNumber = "0";
        }
        return errorNumber;
    }

    /**
     * 登录失败处理
     * @param userId 用户ID
     * @param loginErrorKey 登录失败key
     * @return 登录失败信息
     */
    private Result<String> getStringResult(Long userId, String loginErrorKey, String errorMessage) {
        String errorNumber = getErrorNumber(loginErrorKey);

        if (Integer.parseInt(errorNumber) >= 5) {
            StpUserUtils.disable(userId, UseConstant.EMAIL_CODE_TIME);
            return Result.build(null).code(HttpStatus.FORBIDDEN.getCode()).message("登录失败,账号已被锁定(5分钟)");
        }
        log.info("登录失败次数(errorNumber) -> {}", errorNumber);
        return Result.fail().message(errorMessage + "(剩余登录次数:" + (5 - Integer.parseInt(errorNumber)) + "次)");
    }
}
