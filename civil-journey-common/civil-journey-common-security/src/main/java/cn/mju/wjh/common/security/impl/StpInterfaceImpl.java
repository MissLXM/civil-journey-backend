package cn.mju.wjh.common.security.impl;

import cn.dev33.satoken.stp.StpInterface;
import cn.mju.wjh.common.security.mapper.AdminRoleMapper;
import cn.mju.wjh.common.security.mapper.CivilRoleMapper;
import cn.mju.wjh.common.security.mapper.UserRoleMapper;
import cn.mju.wjh.common.core.constant.UseConstant;
import cn.mju.wjh.common.core.entity.pojo.user.AdminRole;
import cn.mju.wjh.common.core.entity.pojo.user.UserRole;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import lombok.Setter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

/**
 * ClassName: StpInterfaceImpl
 * Package: cn.mju.wjh.security.impl
 * Description: 自定义权限验证接口
 *
 * @Author:wjh
 * @Create:2023-12-2023/12/9--13:47
 */
@Component
public class StpInterfaceImpl implements StpInterface {

    @Setter(onMethod_ = @Autowired)
    private CivilRoleMapper roleMapper;

    @Setter(onMethod_ = @Autowired)
    private UserRoleMapper userRoleMapper;

    @Setter(onMethod_ = @Autowired)
    private AdminRoleMapper adminRoleMapper;

    @Override
    public List<String> getPermissionList(Object loginId, String loginType) {
        return null;
    }

    @Override
    public List<String> getRoleList(Object loginId, String loginType) {

        List<String> roleList = new ArrayList<>();

        // 用户登录
        if (UseConstant.USER_CONSTANT.equals(loginType)) {

            // 根据当前会话查询角色列表
            List<Long> roleIdList = userRoleMapper.selectList(
                    new LambdaQueryWrapper<UserRole>()
                            .eq(UserRole::getUserId, loginId)
            ).stream().map(UserRole::getRoleId).toList();

            extracted(roleList, roleIdList);

            System.out.println("用户角色: " + roleList);
            return roleList;

        }

        // 管理员登录
        if (UseConstant.ADMIN_CONSTANT.equals(loginType)) {

            // 根据当前会话查询角色列表
            List<Long> adminIdList = adminRoleMapper.selectList(
                    new LambdaQueryWrapper<AdminRole>()
                            .eq(AdminRole::getAdminId, loginId)
            ).stream().map(AdminRole::getRoleId).toList();

            extracted(roleList, adminIdList);

            System.out.println("管理员的角色: " + adminIdList);
            return roleList;
        }

        return roleList;

    }

    /**
     * 根据角色列表查询角色名称
     * @param roleList 角色列表
     * @param idList 当前用户的角色ID列表
     */
    private void extracted(List<String> roleList, List<Long> idList) {
        if (idList.size() > 0) {
            for (Long roleId : idList) {
                String roleName = roleMapper.selectById(roleId).getRoleName();
                if (roleName == null) {
                    continue;
                }
                roleList.add(roleName);
            }
        }
    }
}
