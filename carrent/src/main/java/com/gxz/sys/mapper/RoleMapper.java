package com.gxz.sys.mapper;

import java.util.List;

import com.gxz.sys.domain.Role;

public interface RoleMapper {
    int deleteByPrimaryKey(Integer roleid);

    int insert(Role record);

    int insertSelective(Role record);

    Role selectByPrimaryKey(Integer roleid);

    int updateByPrimaryKeySelective(Role record);

    int updateByPrimaryKey(Role record);
    
    List<Role> queryAllRole(Role role);
    
    //删除用户以前有的菜单
    int deleteRoleMenu(Integer roleid);
    //为角色分配菜单
    int addRoleMenu(Integer rid,Integer mid);

    //为用户分配角色
	List<Role> queryRoleByUserId(Integer userid);
}