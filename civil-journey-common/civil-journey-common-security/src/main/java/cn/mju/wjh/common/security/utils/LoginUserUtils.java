package cn.mju.wjh.common.security.utils;

import cn.hutool.crypto.SecureUtil;
import cn.hutool.crypto.symmetric.SymmetricAlgorithm;
import cn.hutool.crypto.symmetric.SymmetricCrypto;
import cn.mju.wjh.common.core.constant.UseConstant;
import cn.mju.wjh.common.core.entity.pojo.user.CivilAdmin;
import cn.mju.wjh.common.core.entity.pojo.user.CivilUser;
import cn.mju.wjh.common.core.entity.pojo.user.UserRole;
import cn.mju.wjh.common.core.entity.vo.user.LoginInfoVo;
import cn.mju.wjh.common.security.mapper.CivilAdminMapper;
import cn.mju.wjh.common.security.mapper.CivilRoleMapper;
import cn.mju.wjh.common.security.mapper.CivilUserMapper;
import cn.mju.wjh.common.security.mapper.UserRoleMapper;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import lombok.Setter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

/**
 * ClassName: LoginUserUtils
 * Package: cn.mju.wjh.security.utils
 * Description: 用户信息类
 *
 * @Author:wjh
 * @Create:2023-12-2023/12/12--15:56
 */
@Component
public class LoginUserUtils {

    @Setter(onMethod_ = @Autowired)
    private CivilUserMapper userMapper;

    @Setter(onMethod_ = @Autowired)
    private CivilAdminMapper adminMapper;

    @Setter(onMethod_ = @Autowired)
    private CivilRoleMapper roleMapper;

    @Setter(onMethod_ = @Autowired)
    private UserRoleMapper userRoleMapper;

    /**
     * 获取用户全部信息
     * @param userId 用户ID
     * @return 用户信息
     */
    public CivilUser getUserInfo(Object userId) {
        return userMapper.selectById((String) userId);
    }

    /**
     * 修改用户
     * @param user 用户信息
     */
    public void updateUserInfo(CivilUser user) {
        userMapper.updateById(user);
    }

    /**
     * 获取管理员全部信息
     * @param adminId 管理员ID
     * @return 管理员信息
     */
    public CivilAdmin getAdminInfoById(Object adminId) {
        return adminMapper.selectById((String) adminId);
    }

    /**
     * 获取管理员全部信息
     * @param nickname 管理员昵称
     * @return 管理员信息
     */
    public CivilAdmin getAdminInfo(String nickname) {
        return adminMapper.selectOne(
                new LambdaQueryWrapper<CivilAdmin>()
                        .eq(CivilAdmin::getNickname, nickname)
        );
    }

    /**
     * 获取用户全部信息
     * @param username 用户ID
     * @return 用户信息
     */
    public CivilUser getUserInfoByUsername(String username) {
        return userMapper.selectOne(
                new LambdaQueryWrapper<CivilUser>()
                        .eq(CivilUser::getUsername, username)
        );
    }

    /**
     * 获取用户密码
     * @param userId 用户ID
     * @return 用户密码
     */
    public String getUserPassword(Object userId) {
        return userMapper.selectById((String) userId).getPassword();
    }

    /**
     * 获取用户邮箱
     * @param userId 用户ID
     * @return 用户邮箱
     */
    public String getUserEmail(Object userId) {
        return userMapper.selectById((String) userId).getUserEmail();
    }

    /**
     * 获取AES加密对象
     * @param key 自定义密文
     * @return AES加密对象
     */
    public SymmetricCrypto getAes(String key) {
        byte[] byteKey = SecureUtil.generateKey(SymmetricAlgorithm.AES.getValue(), key.getBytes()).getEncoded();
        return SecureUtil.aes(byteKey);
    }

    /**
     * 获取用户角色
     * @param userId 用户ID
     * @return 用户角色
     */
    public String getUserRole(Long userId) {
        // 查询用户角色ID
        UserRole userRole = userRoleMapper.selectOne(
                new LambdaQueryWrapper<UserRole>()
                        .eq(UserRole::getUserId, userId)
                        .select(UserRole::getRoleId)
        );

        // 根据角色ID查询角色名称
        return roleMapper.selectById(userRole.getRoleId()).getRoleName();
    }

    /**
     * 封装登录用户信息
     * @param user 用户信息
     * @return 登录用户信息
     */
    public LoginInfoVo getLoginUserInfo(CivilUser user) {
        // 查询用户角色
        String roleName = getUserRole(user.getUserId());
        Boolean isTeacher = null;
        if (UseConstant.ROLE_TEACHER.equals(roleName)) {
            isTeacher = true;
        } else if (UseConstant.ROLE_USER.equals(roleName)) {
            isTeacher = false;
        }
        return new LoginInfoVo()
                .setIsTeacher(isTeacher)
                .setUsername(user.getUsername())
                .setNickname(user.getNickname())
                .setHeadPortrait(user.getHeadPortrait())
                .setTokenName(StpUserUtils.getTokenInfo().getTokenName())
                .setTokenValue(StpUserUtils.getTokenInfo().getTokenValue())
                .setLoginId(StpUserUtils.getTokenInfo().getLoginId().toString());
    }

    /**
     * 返还用户免费次数
     * @param userId 用户ID
     * @param useFreeNumber 免费次数
     */
    public void refundUserFreeNumber(Long userId, Integer useFreeNumber) {
        CivilUser user = userMapper.selectById(userId);

        // 更新次数
        user.setFreeViewNumber(user.getFreeViewNumber() + useFreeNumber);
        userMapper.updateById(user);
    }
}
