package com.gxz.sys.controller;


import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gxz.sys.constast.SysConstast;
import com.gxz.sys.domain.Role;
import com.gxz.sys.domain.User;
import com.gxz.sys.service.RoleService;
import com.gxz.sys.service.UserService;
import com.gxz.sys.utils.PinYinUtils;
import com.gxz.sys.utils.WebUtils;
import com.gxz.sys.utils.jsondata.DataGridView;
import com.gxz.sys.utils.jsondata.ResultObj;
import com.gxz.sys.vo.RoleVo;
import com.gxz.sys.vo.UserVo;

@Controller
@RequestMapping("user")
public class UserController {

	@Autowired
	private UserService userService;
	@Autowired
	private RoleService roleService;
	
	@RequestMapping("toUpdatePwd")
	public String toUpdatePwd(){
		return "forward:/WEB-INF/view/system/updatePwd.jsp";
	}
	
	@RequestMapping("userIsExist")
	@ResponseBody
	public Boolean userIsExist(UserVo userVo){
		User user = WebUtils.getCurrentUser(User.class, "user");
		userVo.setLoginname(user.getLoginname());
		boolean isSuccess = userService.userIsExist(userVo);
		return isSuccess;
	}
	
	@RequestMapping("updatePwd")
	public void updatePwd(UserVo userVo){
		User user = WebUtils.getCurrentUser(User.class, "user");
		userVo.setUserid(user.getUserid());
		userService.updatePwd(userVo);
	}
	
	/***
	 * 用户管理
	 */
	@RequestMapping("toUserManager")
	public String toUserManager(){
		return "forward:/WEB-INF/view/system/userManager.jsp";
	}
	
	@RequestMapping("loadAllUser")
	@ResponseBody
	public DataGridView loadAllUser(UserVo userVo){
		return userService.loadAllUser(userVo);
	}
	
	@RequestMapping("addUser")
	@ResponseBody
	public ResultObj addUser(UserVo userVo){
		ResultObj obj = null;
		try {
			userService.addUser(userVo);
			obj = new ResultObj(SysConstast.CODE_SUCCESS,SysConstast.OPERATION_ADD_SUCCESS);
		} catch (Exception e) {
			e.printStackTrace();
			obj = new ResultObj(SysConstast.CODE_ERROR,SysConstast.OPERATION_ADD_ERROR);
		}
		
		return obj;
	}
	
	@RequestMapping("updateUser")
	@ResponseBody
	public ResultObj updateUser(UserVo userVo){
		ResultObj obj = null;
		try {
			userService.updateUser(userVo);
			obj = new ResultObj(SysConstast.CODE_SUCCESS,SysConstast.OPERATION_UPDATE_SUCCESS);
		} catch (Exception e) {
			e.printStackTrace();
			obj = new ResultObj(SysConstast.CODE_ERROR,SysConstast.OPERATION_UPDATE_ERROR);
		}
		
		return obj;
	}
	
	@RequestMapping(value="getPinyinName",produces="text/html;charset=utf-8")
	@ResponseBody
	public String getPinyinName(UserVo userVo){
		return PinYinUtils.toPinyin(userVo.getRealname());
	}
	
	@RequestMapping("deleteUser")
	@ResponseBody
	public ResultObj deleteUser(UserVo userVo){
		ResultObj obj = null;
		try {
			userService.deleteUser(userVo);
			obj = new ResultObj(SysConstast.CODE_SUCCESS,SysConstast.OPERATION_DELETE_SUCCESS);
		} catch (Exception e) {
			e.printStackTrace();
			obj = new ResultObj(SysConstast.CODE_ERROR,SysConstast.OPERATION_DELETE_ERROR);
		}
		
		return obj;
	}
	
	@RequestMapping("resettingPwd")
	@ResponseBody
	public ResultObj resettingPwd(UserVo userVo){
		ResultObj obj = null;
		try {
			userService.resettingPwd(userVo);
			obj = new ResultObj(SysConstast.CODE_SUCCESS,SysConstast.OPERATION_RESET_PWD_SUCCESS);
		} catch (Exception e) {
			e.printStackTrace();
			obj = new ResultObj(SysConstast.CODE_ERROR,SysConstast.OPERATION_RESET_PWD_ERROR);
		}
		return obj;
	}
	
	/*****************用户角色分配**********************/
	//回显表单
	@RequestMapping("loadRoleByUid")
	@ResponseBody
	public DataGridView loadRoleByUid(UserVo userVo){
		//查询所有数据
		RoleVo roleVo = new RoleVo();
		roleVo.setAvailable(SysConstast.AVAILABLE_TRUE);
		List<Role> roles_All = roleService.loadAllRoleList(roleVo);
		//根据用户id查询选中的角色
		List<Role> roles_User = roleService.queryAllRoleByUserId(userVo);
		
		List<Role> relUserRole = new ArrayList<>();
		for (Role role1 : roles_All) {
			Boolean checked = false;
			for (Role role2 : roles_User) {
				if(role1.getRoleid() == role2.getRoleid()){
					checked = true;
					break;
				}
			}
			
			RoleVo rv = new RoleVo();
			rv.setChecked(checked);
			BeanUtils.copyProperties(role1, rv);
			relUserRole.add(rv);
		}
		
		return new DataGridView(relUserRole.size()+0L,relUserRole);
	}
	
	
	@RequestMapping("saveUserRole")
	@ResponseBody
	public ResultObj saveUserRole(UserVo userVo){
		ResultObj obj = null;
		try {
			userService.saveUserRole(userVo);
			obj = new ResultObj(SysConstast.CODE_SUCCESS,SysConstast.OPERATION_ADD_SUCCESS);
		} catch (Exception e) {
			e.printStackTrace();
			obj = new ResultObj(SysConstast.CODE_ERROR,SysConstast.OPERATION_ADD_ERROR);
		}
		return obj;
	}
}
