package com.gxz.sys.service;

import java.util.List;

import com.gxz.sys.domain.Menu;
import com.gxz.sys.utils.jsondata.DataGridView;
import com.gxz.sys.vo.MenuVo;

public interface MenuService {

	List<Menu> queryAllMenus(MenuVo menuVo);

	//主菜单根据用户显示
	List<Menu> queryAllMenusByUserId(Integer userid);
	//加载菜单管理数据表格
	DataGridView loadAllMenuData(MenuVo menuVo);

	void addMenu(MenuVo menuVo);

	void updateMenu(MenuVo menuVo);

	void deleteMenu(MenuVo menuVo);

	
	//根据角色分配菜单
	List<Menu> selectRoleMenuTreeByRid(Integer roleid);


}
