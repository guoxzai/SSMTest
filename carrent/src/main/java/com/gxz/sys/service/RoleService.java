package com.gxz.sys.service;

import java.util.List;

import com.gxz.sys.domain.Role;
import com.gxz.sys.utils.jsondata.DataGridView;
import com.gxz.sys.vo.RoleVo;
import com.gxz.sys.vo.UserVo;

public interface RoleService {

	DataGridView loadAllRole(RoleVo roleVo);

	void addRole(RoleVo roleVo);

	void updateRole(RoleVo roleVo);

	void deleteRole(RoleVo roleVo);

	//为角色分配菜单
	void saveRoleMenu(RoleVo roleVo);

	List<Role> loadAllRoleList(RoleVo roleVo);

	List<Role> queryAllRoleByUserId(UserVo userVo);

}
