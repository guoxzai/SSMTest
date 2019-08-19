package com.gxz.sys.mapper;

import java.util.List;

import com.gxz.sys.domain.Menu;

public interface MenuMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Menu record);

    int insertSelective(Menu record);

    Menu selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Menu record);

    int updateByPrimaryKey(Menu record);
    
    //查询左边全部菜单           带条件
    List<Menu> queryAllMenus(Menu menu);
    List<Menu> queryAllMenusByUserId(Integer userid);
    
	int deletMenu(Menu menu);

	int deleteRoleMenuByMid(Integer mid);
	
	//根据角色分配菜单
	List<Menu> queryRoleMenuTree(Integer rid);

	
	
}