package com.gxz.sys.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gxz.sys.constast.SysConstast;
import com.gxz.sys.domain.Menu;
import com.gxz.sys.domain.User;
import com.gxz.sys.service.MenuService;
import com.gxz.sys.utils.BuilderEasyuiComboTree;
import com.gxz.sys.utils.WebUtils;
import com.gxz.sys.utils.jsondata.DataGridView;
import com.gxz.sys.utils.jsondata.MenuTreeNode;
import com.gxz.sys.utils.jsondata.ResultObj;
import com.gxz.sys.vo.MenuVo;

@Controller
@RequestMapping("menu")
public class MenuController {
	
	@Autowired
	private MenuService menuService;

	@RequestMapping("treeNode")
	@ResponseBody
	public List<MenuTreeNode> loadLeftMenu(MenuVo menuVo){
		List<MenuTreeNode> menuList = new ArrayList<>();
		User user = (User) WebUtils.getCurrentHttpServletRequest().getSession().getAttribute("user");
		
		List<Menu> menus = null;
		menuVo.setAvailable(SysConstast.AVAILABLE_TRUE);
		//根据用户的type属性判断数的显示
		if(user.getType()==SysConstast.USER_SYSTEM_SUPER){
			menus = menuService.queryAllMenus(menuVo);
		}else{
			menus = menuService.queryAllMenusByUserId(user.getUserid());
		}
		
		for (Menu menu : menus) {
			Integer id = menu.getId();
			Integer pid = menu.getPid();
			String name = menu.getName();
			Boolean isParent = menu.getParent()==SysConstast.PARENT_TRUE?true:false;
			Boolean open = menu.getOpen()==SysConstast.OPEN_TRUE?true:false;
			String href = menu.getHref();
			String icon = menu.getIcon();
			String tabIcon = menu.getTabicon();
			
			MenuTreeNode menuTree = new MenuTreeNode(id, pid, name, isParent, open, href, icon, tabIcon);
			menuList.add(menuTree);
		}
		
		return menuList;
	}
	
	
	/****************菜单管理开始*****************/
	@RequestMapping("toMenuManager")
	public String toMenuManager(){
		return "forward:/WEB-INF/view/system/menuManager.jsp";
	}
	
	@RequestMapping("loadMenuManagerTree")
	@ResponseBody
	public List<MenuTreeNode> loadMenuManagerTree(MenuVo menuVo){
		List<Menu> menus = menuService.queryAllMenus(menuVo);
		List<MenuTreeNode> menuList = new ArrayList<>();
		for (Menu menu : menus) {
			Integer id = menu.getId();
			Integer pid = menu.getPid();
			String name = menu.getName();
			Boolean isParent = menu.getParent()==SysConstast.PARENT_TRUE?true:false;
			Boolean open = menu.getOpen()==SysConstast.OPEN_TRUE?true:false;
			String href = menu.getHref();
			String icon = menu.getIcon();
			String tabIcon = menu.getTabicon();
			menuList.add(new MenuTreeNode(id, pid, name, isParent,open, href, icon, tabIcon));
		}
		
		return menuList;
	}
	
	@RequestMapping("loadAllMenuData")
	@ResponseBody
	public DataGridView loadAllMenuData(MenuVo menuVo){
		return menuService.loadAllMenuData(menuVo);
	}
	
	//添加
	//加载esayui中的ComboTree
	@RequestMapping("loadComboTreeJson")
	@ResponseBody
	public List<MenuTreeNode> loadComboTreeJson(MenuVo menuVo){
		List<Menu> menus = menuService.queryAllMenus(menuVo);
		List<MenuTreeNode> treeNodes = new ArrayList<>();
		for (Menu menu : menus) {
			Integer id = menu.getId();
			Integer pid = menu.getPid();
			String name = menu.getName();
			treeNodes.add(new MenuTreeNode(id,pid,name));
		}
		
		Integer topId = 0;
		return BuilderEasyuiComboTree.builderCombTree(treeNodes, topId);
	}
	
	@RequestMapping("addMenu")
	@ResponseBody
	public ResultObj addMenu(MenuVo menuVo){
		ResultObj obj = null;
		try {
			menuService.addMenu(menuVo);
			obj = new ResultObj(SysConstast.CODE_SUCCESS,SysConstast.OPERATION_ADD_SUCCESS);
		} catch (Exception e) {
			e.printStackTrace();
			obj = new ResultObj(SysConstast.CODE_ERROR,SysConstast.OPERATION_ADD_ERROR);
		}
		
		return obj;
	}
	
	@RequestMapping("updateMenu")
	@ResponseBody
	public ResultObj updateMenu(MenuVo menuVo){
		ResultObj obj = null;
		try {
			menuService.updateMenu(menuVo);
			obj = new ResultObj(SysConstast.CODE_SUCCESS,SysConstast.OPERATION_ADD_SUCCESS);
		} catch (Exception e) {
			e.printStackTrace();
			obj = new ResultObj(SysConstast.CODE_ERROR,SysConstast.OPERATION_ADD_ERROR);
		}
		
		return obj;
	}
	
	@RequestMapping("deleteMenu")
	@ResponseBody
	public ResultObj deleteMenu(MenuVo menuVo){
		ResultObj obj = null;
		try {
			menuService.deleteMenu(menuVo);
			obj = new ResultObj(SysConstast.CODE_SUCCESS,SysConstast.OPERATION_ADD_SUCCESS);
		} catch (Exception e) {
			e.printStackTrace();
			obj = new ResultObj(SysConstast.CODE_ERROR,SysConstast.OPERATION_ADD_ERROR);
		}
		
		return obj;
	}
	
	/****************菜单管理结束*****************/
	
}
