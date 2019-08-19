package com.gxz.sys.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.gxz.sys.domain.Role;
import com.gxz.sys.mapper.RoleMapper;
import com.gxz.sys.service.RoleService;
import com.gxz.sys.utils.jsondata.DataGridView;
import com.gxz.sys.vo.RoleVo;
import com.gxz.sys.vo.UserVo;

@Service
public class RoleServiceImpl implements RoleService{

	@Autowired
	private RoleMapper roleMapper;
	
	@Override
	public DataGridView loadAllRole(RoleVo roleVo) {
		Page<Object> page = PageHelper.startPage(roleVo.getPage(), roleVo.getRows());
		List<Role> roles = roleMapper.queryAllRole(roleVo);
		return new DataGridView(page.getTotal(),roles);
	}

	@Override
	public void addRole(RoleVo roleVo) {
		roleMapper.insertSelective(roleVo);
	}

	@Override
	public void updateRole(RoleVo roleVo) {
		roleMapper.updateByPrimaryKeySelective(roleVo);
	}

	@Override
	public void deleteRole(RoleVo roleVo) {
		roleMapper.deleteByPrimaryKey(roleVo.getRoleid());
	}

	
	/**
	 * 为角色分配菜单
	 */
	@Override
	public void saveRoleMenu(RoleVo roleVo) {
		Integer[] ids = roleVo.getIds();
		//添加前把以前分配的菜单删除
		roleMapper.deleteRoleMenu(roleVo.getRoleid());
		if(ids.length>0){
			for (Integer id : ids) {
				roleMapper.addRoleMenu(roleVo.getRoleid(),id);
			}
		}
	}

	/**
	 *  为用户分配角色
	 */
	@Override
	public List<Role> loadAllRoleList(RoleVo roleVo) {
		return roleMapper.queryAllRole(roleVo);
	}

	@Override
	public List<Role> queryAllRoleByUserId(UserVo userVo) {
		return roleMapper.queryRoleByUserId(userVo.getUserid());
	}

}
