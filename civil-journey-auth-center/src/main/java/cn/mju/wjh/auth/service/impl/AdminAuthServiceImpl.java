package cn.mju.wjh.auth.service.impl;

import cn.dev33.satoken.stp.StpUtil;
import cn.hutool.core.bean.BeanUtil;
import cn.hutool.crypto.SecureUtil;
import cn.hutool.crypto.symmetric.SymmetricAlgorithm;
import cn.hutool.crypto.symmetric.SymmetricCrypto;
import cn.mju.wjh.common.core.entity.param.admin.AdminLoginParams;
import cn.mju.wjh.common.core.entity.pojo.user.LoginLog;
import cn.mju.wjh.common.core.entity.vo.user.LoginInfoVo;
import cn.mju.wjh.common.core.utils.AddressUtils;
import cn.mju.wjh.common.core.utils.IpUtils;
import cn.mju.wjh.common.minio.utils.MinioUtil;
import cn.mju.wjh.common.security.mapper.AdminRoleMapper;
import cn.mju.wjh.auth.service.AdminAuthService;
import cn.mju.wjh.common.core.constant.UseConstant;
import cn.mju.wjh.common.core.entity.param.admin.AdminRegisterParams;
import cn.mju.wjh.common.core.entity.pojo.user.AdminRole;
import cn.mju.wjh.common.core.entity.pojo.user.CivilAdmin;
import cn.mju.wjh.common.core.enums.HttpStatus;
import cn.mju.wjh.common.core.utils.Result;
import cn.mju.wjh.common.security.mapper.CivilAdminMapper;
import cn.mju.wjh.common.security.mapper.CivilRoleMapper;
import cn.mju.wjh.common.security.mapper.LoginLogMapper;
import cn.mju.wjh.common.security.utils.StpUserUtils;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import jakarta.servlet.http.HttpServletRequest;
import lombok.Setter;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.stereotype.Service;

import java.util.Map;

/**
 * ClassName: AdminAuthServiceImpl
 * Package: cn.mju.wjh.auth.service.impl
 * Description: 管理员认证服务实现
 *
 * @Author:wjh
 * @Create:2023-12-2023/12/11--16:07
 */
@Slf4j
@Service
public class AdminAuthServiceImpl implements AdminAuthService {

    @Value("${sa-token.key}")
    private String key;

    @Setter(onMethod_ = @Autowired)
    private CivilAdminMapper adminMapper;

    @Setter(onMethod_ = @Autowired)
    private CivilRoleMapper roleMapper;

    @Setter(onMethod_ = @Autowired)
    private LoginLogMapper loginLogMapper;

    @Setter(onMethod_ = @Autowired)
    private AdminRoleMapper adminRoleMapper;

    @Setter(onMethod_ = @Autowired)
    private MinioUtil minioUtil;

    @Setter(onMethod_ = @Autowired)
    private StringRedisTemplate redisTemplate;

    /**
     * 获取AES加密对象
     * @param key 自定义密文
     * @return AES加密对象
     */
    private SymmetricCrypto getAes(String key) {
        byte[] byteKey = SecureUtil.generateKey(SymmetricAlgorithm.AES.getValue(), key.getBytes()).getEncoded();
        return SecureUtil.aes(byteKey);
    }

    /**
     * 管理员注册
     * @param adminRegisterParams 管理员注册参数
     * @return 是否注册成功
     */
    @Override
    public Result adminRegister(AdminRegisterParams adminRegisterParams) {
        // 登录名称是否重复
        if (adminMapper.selectCount(
                new LambdaQueryWrapper<CivilAdmin>()
                        .eq(CivilAdmin::getUsername, adminRegisterParams.getUsername())
        ) > 0) {
            return Result.ok().code(HttpStatus.FOUND.getCode()).message("登录名称已存在");
        }

        // 昵称是否重复
        if (adminMapper.selectCount(
                new LambdaQueryWrapper<CivilAdmin>()
                        .eq(CivilAdmin::getNickname, adminRegisterParams.getNickname())
        ) > 0) {
            return Result.ok().code(HttpStatus.FOUND.getCode()).message("昵称已存在");
        }

        // 邮箱是否重复
        if (adminMapper.selectCount(
                new LambdaQueryWrapper<CivilAdmin>()
                        .eq(CivilAdmin::getAdminEmail, adminRegisterParams.getAdminEmail())
        ) > 0) {
            return Result.ok().code(HttpStatus.FOUND.getCode()).message("邮箱已存在");
        }

        CivilAdmin admin = new CivilAdmin();
        BeanUtil.copyProperties(adminRegisterParams, admin);

        // 注册
        if (adminMapper.insert(admin) > 0) {
            Long adminId = adminMapper.selectOne(
                    new LambdaQueryWrapper<CivilAdmin>()
                            .eq(CivilAdmin::getUsername, admin.getUsername())
            ).getAdminId();
            // 设置管理员角色
            if (adminRegisterParams.getAdminCode().equals(UseConstant.ROLE_SUPER_ADMIN_ID)) {
                AdminRole adminRole = new AdminRole();
                adminRole.setAdminId(adminId);
                adminRole.setRoleId(adminRegisterParams.getAdminCode());
                if (adminRoleMapper.insert(adminRole) > 0) {
                    log.info("超级管理员角色添加成功");
                }
            }

            if (adminRegisterParams.getAdminCode().equals(UseConstant.ROLE_ADMIN_ID)) {
                AdminRole adminRole = new AdminRole();
                adminRole.setAdminId(adminId);
                adminRole.setRoleId(adminRegisterParams.getAdminCode());
                if (adminRoleMapper.insert(adminRole) > 0) {
                    log.info("管理员角色添加成功");
                }
            }

            return Result.ok().message("管理员注册成功");
        }
        return null;
    }

    /**
     * 管理员登录
     * @param request 请求体
     * @param loginParams 登录参数
     * @return 是否登录成功
     */
    @Override
    public Result<String> adminLogin(HttpServletRequest request, AdminLoginParams loginParams) {
        // 判断登录名称是否存在
        CivilAdmin admin = adminMapper.selectOne(
                new LambdaQueryWrapper<CivilAdmin>()
                        .eq(CivilAdmin::getUsername, loginParams.getUsername())
                        .eq(CivilAdmin::getIsDelete, (byte) 0)
        );
        if (admin == null) {
            return Result.ok().code(HttpStatus.NOT_FOUND.getCode()).message("未查询到该管理员用户");
        }

        String loginErrorKey = UseConstant.ADMIN_REAL_CONSTANT + UseConstant.ROD_CONSTANT + admin.getUsername() + UseConstant.LOGIN_ERROR_NUMBER;

        if (StpUtil.isDisable(admin.getAdminId())) {
            if (redisTemplate.opsForValue().get(loginErrorKey) != null) {
                redisTemplate.delete(loginErrorKey);
            }
            return Result.build(null).code(
                    HttpStatus.FORBIDDEN.getCode()
            ).message("登录失败,账号:" + admin.getUsername() + "已被封禁,剩余时间: " + StpUserUtils.getDisableTime(admin.getAdminId()) + "秒");
        }

        // 判断验证码
        String captchaCode = redisTemplate.opsForValue().get(UseConstant.LOGIN_CODE + loginParams.getCaptchaVoucher());
        if (!loginParams.getCaptchaCode().equals(captchaCode)) {
            return Result.fail().message("验证码错误");
        }

        // 登录
        if (loginParams.getPassword().equals(getAes(key).decryptStr(admin.getPassword()))) {
            StpUtil.login(admin.getAdminId(), UseConstant.LOGIN_DEVICE);
            // 查询角色
            AdminRole adminRole = adminRoleMapper.selectOne(
                                            new LambdaQueryWrapper<AdminRole>()
                                                    .eq(AdminRole::getAdminId, admin.getAdminId())
                                    );
            String roleDescribe = "ERROR";
            if (adminRole != null) {
                roleDescribe = roleMapper.selectById(adminRole.getRoleId()).getRoleDescribe();
            }


            // 记录登录日志
            Map<String, String> ip = AddressUtils.getIp(IpUtils.getIpAddr(request));
            if (loginLogMapper.insert(
                                new LoginLog()
                                        .setUsername(admin.getUsername())
                                        .setIpAddress(ip.get("ipAddress"))
                                        .setIpLocation(ip.get("realArea"))
                                        .setLoginType(roleDescribe)
                        ) > 0) {
                log.info("管理员登录成功");
            }
            // 清空登录失败次数
            redisTemplate.delete(loginErrorKey);
            // 返回token
            return Result.ok(getAdminLoginInfo(admin.getUsername(), admin.getNickname(), admin.getHeadPortrait())).message("登录成功");
        }

        // 登录失败次数 + 1(要是大于5次就锁定用户)
        return getStringResult(admin.getAdminId(), loginErrorKey);
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
     * @param adminId 管理员ID
     * @param loginErrorKey 登录失败key
     * @return 登录失败信息
     */
    private Result<String> getStringResult(Long adminId, String loginErrorKey) {
        String errorNumber = getErrorNumber(loginErrorKey);

        if (Integer.parseInt(errorNumber) >= 5) {
            StpUtil.disable(adminId, UseConstant.EMAIL_CODE_TIME);
            return Result.build(null).code(HttpStatus.FORBIDDEN.getCode()).message("登录失败,账号已被锁定(5分钟)");
        }
        log.info("登录失败次数(errorNumber) -> {}", errorNumber);
        return Result.fail().message("登录失败(剩余登录次数:" + (5 - Integer.parseInt(errorNumber)) + "次)");
    }

    /**
     * 封装登录管理员信息
     * @param username 登录名称
     * @param headPortrait 头像
     * @return 登录管理员信息
     */
    private LoginInfoVo getAdminLoginInfo(String username, String nickname, String headPortrait) {
        return new LoginInfoVo()
                .setUsername(username)
                .setNickname(nickname)
                .setHeadPortrait(minioUtil.preview(headPortrait))
                .setTokenName(StpUtil.getTokenInfo().getTokenName())
                .setTokenValue(StpUtil.getTokenInfo().getTokenValue())
                .setLoginId(StpUtil.getTokenInfo().getLoginId().toString());
    }
}
