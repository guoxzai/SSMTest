package com.gxz.sys.controller;

import java.util.ArrayList;
import java.util.List;

import org.aspectj.weaver.ArrayAnnotationValue;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gxz.sys.constast.SysConstast;
import com.gxz.sys.domain.Menu;
import com.gxz.sys.service.MenuService;
import com.gxz.sys.service.RoleService;
import com.gxz.sys.utils.jsondata.DataGridView;
import com.gxz.sys.utils.jsondata.MenuTreeNode;
import com.gxz.sys.utils.jsondata.ResultObj;
import com.gxz.sys.vo.MenuVo;
import com.gxz.sys.vo.RoleVo;
import com.gxz.sys.vo.RoleVo;

@Controller
@RequestMapping("role")
public class RoleController {

	@Autowired
	private RoleService roleService;
	
	@Autowired
	private MenuService menuService;
	
	@RequestMapping("toRoleManager")
	public String toRoleManager(){
		return "/WEB-INF/view/system/roleManager.jsp";
	}
	
	@RequestMapping("loadAllRole")
	@ResponseBody
	public DataGridView loadAllRole(RoleVo roleVo){
		return roleService.loadAllRole(roleVo);
	}
	
	@RequestMapping("addRole")
	@ResponseBody
	public ResultObj addRole(RoleVo roleVo){
		ResultObj obj = null;
		try {
			roleService.addRole(roleVo);
			obj = new ResultObj(SysConstast.CODE_SUCCESS,SysConstast.OPERATION_ADD_SUCCESS);
		} catch (Exception e) {
			e.printStackTrace();
			obj = new ResultObj(SysConstast.CODE_ERROR,SysConstast.OPERATION_ADD_ERROR);
		}
		
		return obj;
	}
	
	@RequestMapping("updateRole")
	@ResponseBody
	public ResultObj updateRole(RoleVo roleVo){
		ResultObj obj = null;
		try {
			roleService.updateRole(roleVo);
			obj = new ResultObj(SysConstast.CODE_SUCCESS,SysConstast.OPERATION_UPDATE_SUCCESS);
		} catch (Exception e) {
			e.printStackTrace();
			obj = new ResultObj(SysConstast.CODE_ERROR,SysConstast.OPERATION_UPDATE_ERROR);
		}
		
		return obj;
	}
	
	@RequestMapping("deleteRole")
	@ResponseBody
	public ResultObj deleteRole(RoleVo roleVo){
		ResultObj obj = null;
		try {
			roleService.deleteRole(roleVo);
			obj = new ResultObj(SysConstast.CODE_SUCCESS,SysConstast.OPERATION_DELETE_SUCCESS);
		} catch (Exception e) {
			e.printStackTrace();
			obj = new ResultObj(SysConstast.CODE_ERROR,SysConstast.OPERATION_DELETE_ERROR);
		}
		
		return obj;
	}
	
	/************根据角色分配菜单开始*************/
	//初始化树
	@RequestMapping("loadRoleMenuTree")
	@ResponseBody
	public List<MenuTreeNode> loadRoleMenuTree(RoleVo roleVo){
		//根据用户id查询
		List<Menu> roleMenu = menuService.selectRoleMenuTreeByRid(roleVo.getRoleid());
		//查询所有可用的菜单
		MenuVo menuVo = new MenuVo();
		menuVo.setAvailable(SysConstast.AVAILABLE_TRUE);
		List<Menu> availableMenu = menuService.queryAllMenus(menuVo);
		
		List<MenuTreeNode> treeNode = new ArrayList<>();
		
		for (Menu menu1 : availableMenu) {
			
			Boolean checked = false;
			
			for (Menu menu2 : roleMenu) {
				if(menu1.getId()==menu2.getId()){
					checked = true;
					break;
				}
			}
			
			Integer id = menu1.getId();
			Integer pid = menu1.getPid();
			String name = menu1.getName();
			Boolean isParent = menu1.getParent()==SysConstast.PARENT_TRUE?true:false;
			Boolean open = menu1.getOpen()==SysConstast.OPEN_TRUE?true:false;
			String icon = menu1.getIcon();
			treeNode.add(new MenuTreeNode(id, pid, name, isParent, open, icon, checked));
		}
		
		return treeNode;
	}
	
	@RequestMapping("saveRoleMenu")
	@ResponseBody
	public ResultObj saveRoleMenu(RoleVo roleVo){
		ResultObj obj = null;
		try {
			roleService.saveRoleMenu(roleVo);
			obj = new ResultObj(SysConstast.CODE_SUCCESS,SysConstast.OPERATION_ADD_SUCCESS);
		} catch (Exception e) {
			e.printStackTrace();
			obj = new ResultObj(SysConstast.CODE_ERROR,SysConstast.OPERATION_ADD_ERROR);
		}
		return obj;
	}
	
	/************根据角色分配菜单结束*************/
}
