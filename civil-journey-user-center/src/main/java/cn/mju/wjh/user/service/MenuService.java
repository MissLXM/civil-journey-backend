package cn.mju.wjh.user.service;

import cn.mju.wjh.common.core.entity.param.PageParams;
import cn.mju.wjh.common.core.entity.param.menu.RoleMenuParams;
import cn.mju.wjh.common.core.entity.pojo.user.MenuAuthority;
import cn.mju.wjh.common.core.utils.Result;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

/**
 * ClassName: MenuService
 * Package: cn.mju.wjh.user.service
 * Description: 菜单服务接口
 *
 * @Author:wjh
 * @Create:2023-12-2023/12/18--14:53
 */
public interface MenuService {

    /**
     * 获取一级菜单
     * @return 是否查询成功
     */
    Result getLevelMenuInfo();

    /**
     * 后台系统侧边菜单展示
     * @return 展示菜单
     */
    Result showAsideMenu();

    /**
     * 获取所有菜单(分页)
     * @param pageParams 分页参数
     * @return 所有菜单
     */
    Result getAllMenu(PageParams pageParams);

    /**
     * 上传菜单图标
     * @param icon 图标文件
     * @return 返回图标地址
     */
    Result submitMenuIcon(MultipartFile icon);

    /**
     * 新增菜单信息
     * @param menuAuthority 菜单信息
     * @return 是否新增成功
     */
    Result insertMenu(MenuAuthority menuAuthority);

    /**
     * 修改菜单信息
     * @param menuAuthority 菜单信息
     * @return 是否修改成功
     */
    Result updateMenu(MenuAuthority menuAuthority);

    /**
     * 显示/隐藏菜单
     * @param menuId 菜单ID
     * @param visible 是否可见
     * @return 是否隐藏成功
     */
    Result hiddenMenu(Long menuId, Byte visible);

    /**
     * 删除菜单
     * @param menuIds 菜单ID
     * @return 是否删除成功
     */
    Result deleteMenu(List<Long> menuIds);


    /**
     * 分配角色菜单
     * @param roleMenuParams 参数
     * @return 是否操作成功
     */
    Result giveRoleMenu(RoleMenuParams roleMenuParams);
}
