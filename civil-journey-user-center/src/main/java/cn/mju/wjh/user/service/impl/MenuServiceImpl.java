package cn.mju.wjh.user.service.impl;

import cn.dev33.satoken.stp.StpUtil;
import cn.hutool.core.bean.BeanUtil;
import cn.mju.wjh.common.core.constant.UseConstant;
import cn.mju.wjh.common.core.entity.param.PageParams;
import cn.mju.wjh.common.core.entity.param.menu.RoleMenuParams;
import cn.mju.wjh.common.core.entity.pojo.user.CivilAdmin;
import cn.mju.wjh.common.core.entity.pojo.user.CivilRole;
import cn.mju.wjh.common.core.entity.pojo.user.MenuAuthority;
import cn.mju.wjh.common.core.entity.pojo.user.RoleMenu;
import cn.mju.wjh.common.core.entity.vo.menu.AsideMenuVo;
import cn.mju.wjh.common.core.enums.HttpStatus;
import cn.mju.wjh.common.core.utils.Result;
import cn.mju.wjh.common.minio.utils.MinioUtil;
import cn.mju.wjh.common.security.mapper.CivilAdminMapper;
import cn.mju.wjh.common.security.mapper.CivilRoleMapper;
import cn.mju.wjh.user.mapper.MenuAuthorityMapper;
import cn.mju.wjh.user.mapper.RoleMenuMapper;
import cn.mju.wjh.user.service.MenuService;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import lombok.Setter;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

/**
 * ClassName: MenuServiceImpl
 * Package: cn.mju.wjh.user.service.impl
 * Description: 菜单服务实现
 *
 * @Author:wjh
 * @Create:2023-12-2023/12/18--14:55
 */
@Slf4j
@Service
public class MenuServiceImpl implements MenuService {

    @Setter(onMethod_ = @Autowired)
    private CivilAdminMapper adminMapper;

    @Setter(onMethod_ = @Autowired)
    private CivilRoleMapper roleMapper;

    @Setter(onMethod_ = @Autowired)
    private RoleMenuMapper roleMenuMapper;

    @Setter(onMethod_ = @Autowired)
    private MenuAuthorityMapper menuAuthorityMapper;

    @Setter(onMethod_ = @Autowired)
    private MinioUtil minioUtil;

    /**
     * 获取一级菜单
     * @return 是否查询成功
     */
    @Override
    public Result getLevelMenuInfo() {
        // 获取一级菜单信息
        List<MenuAuthority> menuAuthorityList = menuAuthorityMapper
                .selectList(
                        new LambdaQueryWrapper<MenuAuthority>()
                                .eq(MenuAuthority::getMenuParentId, (byte) 0)
                );

        if (menuAuthorityList.size() != 0) {
            // 封装返回
            return Result.ok(
                    menuAuthorityList.stream()
                            .map(menuAuthority -> BeanUtil.toBean(menuAuthority, AsideMenuVo.class))
                            .toList()
            ).message("获取一级菜单成功");
        }
        return Result.fail().code(HttpStatus.NOT_FOUND.getCode()).message("获取一级菜单失败");
    }

    /**
     * 后台系统侧边菜单展示
     * @return 展示菜单
     */
    @Override
    public Result showAsideMenu() {
        // 获取当前管理员的角色
        List<String> roleNameList = StpUtil.getRoleList();

        // 判断角色是否存在
        if (!roleNameList.contains(UseConstant.ROLE_SUPER_ADMIN) && !roleNameList.contains(UseConstant.ADMIN_REAL_CONSTANT)) {
            return Result.fail().code(HttpStatus.NOT_FOUND.getCode()).message("该登录用户的角色不存在");
        }

        // 获取角色ID
        List<Long> roleIds = new ArrayList<>();
        for (String roleName : roleNameList) {
            // 查询
            CivilRole role = roleMapper.selectOne(
                    new LambdaQueryWrapper<CivilRole>()
                            .eq(CivilRole::getRoleName, roleName)
            );
            // 赋值
            if (role != null) {
                roleIds.add(role.getRoleId());
            }
        }

        // 根据角色查询该用户可看的菜单ID
        List<RoleMenu> roleMenus = roleMenuMapper.selectList(
                new LambdaQueryWrapper<RoleMenu>()
                        .in(RoleMenu::getRoleId, roleIds)
        );

        // 菜单数据
        List<MenuAuthority> menuAuthorityList = new ArrayList<>();
        for (RoleMenu roleMenu : roleMenus) {
            // 查询菜单信息
            MenuAuthority menuAuthority = menuAuthorityMapper.selectOne(
                    new LambdaQueryWrapper<MenuAuthority>()
                            .eq(MenuAuthority::getMenuId, roleMenu.getMenuId())
                            .eq(MenuAuthority::getIsDelete, (byte) 0)
            );

            menuAuthorityList.add(menuAuthority);
        }
        // 判空
        if (menuAuthorityList.size() == 0) {
            return Result.fail().code(HttpStatus.NOT_FOUND.getCode()).message("未查询到菜单信息");
        }

        // 删除空数据
        menuAuthorityList = menuAuthorityList.stream().filter(Objects::nonNull).toList();

        // 判断是否有父菜单
        List<AsideMenuVo> asideMenuVoList = menuAuthorityList.stream()
                // 判断父菜单菜单
                .filter(menuAuthority -> menuAuthority.getMenuParentId() == 0)
                // 转化成VO
                .map(menuAuthority -> BeanUtil.toBean(menuAuthority, AsideMenuVo.class))
                .toList();

        for (AsideMenuVo asideMenuVo : asideMenuVoList) {
            // 获取子菜单
            List<MenuAuthority> asideMenuVoChildrenList = menuAuthorityList.stream()
                    .filter(menu -> menu.getMenuParentId().equals(asideMenuVo.getMenuId()) && menu.getIsDelete().equals((byte) 0))
                    .toList();

            // 拷贝数据
            List<AsideMenuVo> asideMenuVos = BeanUtil.copyToList(asideMenuVoChildrenList, AsideMenuVo.class);
            asideMenuVo.setChildrenMenu(asideMenuVos);
        }


        return Result.ok(asideMenuVoList).message("查询成功");
    }

    /**
     * 获取所有菜单(分页)
     * @param pageParams 分页参数
     * @return 所有菜单
     */
    @Override
    public Result getAllMenu(PageParams pageParams) {
        // 获取菜单信息
        IPage<MenuAuthority> menuAuthorityIpage = menuAuthorityMapper
                .selectPage(
                        new Page<>(pageParams.getCurrentPage(), pageParams.getPageSize()),
                        null
                );

        // 判空
        if (menuAuthorityIpage.getRecords().size() == 0) {
            return Result.fail().message("操作失败").code(HttpStatus.NOT_FOUND.getCode());
        }

        // 封装
        menuAuthorityIpage.setRecords(
                menuAuthorityIpage.getRecords().stream().peek(
                        menu -> {
                            if (menu.getMenuParentId() != 0) {
                                String menuName = menuAuthorityMapper.selectOne(
                                        new LambdaQueryWrapper<MenuAuthority>()
                                                .eq(MenuAuthority::getMenuId, menu.getMenuParentId())
                                ).getMenuName();

                                if (menuName != null) {
                                    menu.setMenuParentName(menuName);
                                }
                            }
                        }
                ).toList()
        );

        return Result.ok(menuAuthorityIpage).message("查询成功");
    }


    /**
     * 上传菜单图标
     * @param icon 图标文件
     * @return 返回图标地址
     */
    @Override
    public Result submitMenuIcon(MultipartFile icon) {
        return Result.ok(
                minioUtil.upload(
                        icon,
                        "icon",
                        null,
                        null
                )
        ).message("上传成功");
    }

    /**
     * 新增菜单信息
     * @param menuAuthority 菜单信息
     * @return 是否新增成功
     */
    @Override
    public Result insertMenu(MenuAuthority menuAuthority) {
        // 父菜单有多少子菜单
        Long childrenMenuCont = menuAuthorityMapper.selectCount(
                new LambdaQueryWrapper<MenuAuthority>()
                        .eq(MenuAuthority::getMenuParentId, menuAuthority.getMenuParentId())
        );
        // 设置显示顺序
        menuAuthority.setShowSort((int) (childrenMenuCont + 1));

        // 设置创建者/更新者
        CivilAdmin admin = adminMapper.selectById(Long.parseLong(StpUtil.getLoginId().toString()));
        if (admin != null) {
            menuAuthority.setCreator(admin.getUsername());
            menuAuthority.setUpdater(admin.getUsername());
        }

        if (menuAuthorityMapper.insert(menuAuthority) > 0) {
            return Result.ok().message("新增菜单成功");
        }
        return Result.fail().message("新增菜单失败");
    }

    /**
     * 修改菜单信息
     * @param menuAuthority 菜单信息
     * @return 是否修改成功
     */
    @Override
    public Result updateMenu(MenuAuthority menuAuthority) {
        // 设置创建者/更新者
        CivilAdmin admin = adminMapper.selectById(Long.parseLong(StpUtil.getLoginId().toString()));
        if (admin != null) {
            menuAuthority.setUpdater(admin.getUsername());
        }

        // 父菜单有多少子菜单
        Long childrenMenuCont = menuAuthorityMapper.selectCount(
                new LambdaQueryWrapper<MenuAuthority>()
                        .eq(MenuAuthority::getMenuParentId, menuAuthority.getMenuParentId())
        );
        // 设置显示顺序
        menuAuthority.setShowSort((int) (childrenMenuCont + 1));
        if (menuAuthorityMapper.updateById(menuAuthority) > 0) {
            return Result.ok().message("修改菜单成功");
        }
        return Result.fail().message("修改菜单失败");
    }

    /**
     * 显示/隐藏菜单
     * @param menuId  菜单ID
     * @param visible 是否可见
     * @return 是否隐藏成功
     */
    @Override
    public Result hiddenMenu(Long menuId, Byte visible) {
        if (menuAuthorityMapper.update(
                new MenuAuthority().setIsDelete(visible),
                new LambdaQueryWrapper<MenuAuthority>()
                        .eq(MenuAuthority::getMenuId, menuId)
        ) > 0) {
            return Result.ok().message("操作成功");
        }
        return Result.fail().message("操作失败");
    }

    /**
     * 删除菜单
     * @param menuIds 菜单ID
     * @return 是否删除成功
     */
    @Override
    public Result deleteMenu(List<Long> menuIds) {
        if (menuAuthorityMapper.deleteBatchIds(menuIds) > 0) {
            menuIds.forEach(
                    menuId -> roleMenuMapper.delete(
                            new LambdaQueryWrapper<RoleMenu>()
                                    .eq(RoleMenu::getMenuId, menuId)
                    )
            );

            return Result.ok().message("删除菜单成功");
        }
        return Result.fail().message("删除菜单失败");
    }

    /**
     * 分配角色菜单
     * @param roleMenuParams 参数
     * @return 是否操作成功
     */
    @Override
    public Result giveRoleMenu(RoleMenuParams roleMenuParams) {
        LambdaQueryWrapper<RoleMenu> wrapper = new LambdaQueryWrapper<RoleMenu>()
                .eq(RoleMenu::getRoleId, roleMenuParams.getRoleId())
                .eq(RoleMenu::getMenuId, roleMenuParams.getMenuId());
        if (roleMenuMapper.selectCount(wrapper) > 0) {
            // 更新
            if (roleMenuMapper.update(
                    new RoleMenu()
                            .setRoleId(roleMenuParams.getRoleId())
                            .setMenuId(roleMenuParams.getMenuId())
                            .setUpdater(roleMenuParams.getUpdater()),
                    wrapper
            ) > 0) {
                return Result.ok().message("操作成功");
            } else {
                return Result.fail().message("操作失败");
            }
        } else {
            RoleMenu roleMenu = new RoleMenu()
                    .setRoleId(roleMenuParams.getRoleId())
                    .setMenuId(roleMenuParams.getMenuId())
                    .setCreator(roleMenuParams.getUpdater())
                    .setUpdater(roleMenuParams.getUpdater());
            System.out.println(roleMenu);
            // 新增
            if (roleMenuMapper.insert(roleMenu) > 0) {
                return Result.ok().message("操作成功");
            } else {
                return Result.fail().message("操作失败");
            }
        }
    }
}
