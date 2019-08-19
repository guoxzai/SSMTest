package com.gxz.sys.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.gxz.sys.domain.Menu;
import com.gxz.sys.mapper.MenuMapper;
import com.gxz.sys.service.MenuService;
import com.gxz.sys.utils.jsondata.DataGridView;
import com.gxz.sys.vo.MenuVo;

@Service
public class MenuServiceImpl implements MenuService {

	@Autowired
	private MenuMapper menuMapper;
	
	@Override
	public List<Menu> queryAllMenus(MenuVo menuVo) {
		return menuMapper.queryAllMenus(menuVo);
	}

	@Override
	public DataGridView loadAllMenuData(MenuVo menuVo) {
		Page<Object> page = PageHelper.startPage(menuVo.getPage(), menuVo.getRows());
		List<Menu> menus = menuMapper.queryAllMenus(menuVo);
		return new DataGridView(page.getTotal(),menus);
	}

	@Override
	public void addMenu(MenuVo menuVo) {
		menuMapper.insertSelective(menuVo);
	}

	@Override
	public void updateMenu(MenuVo menuVo) {
		menuMapper.updateByPrimaryKeySelective(menuVo);
	}

	@Override
	public void deleteMenu(MenuVo menuVo) {
		menuMapper.deleteRoleMenuByMid(menuVo.getId());
		menuMapper.deletMenu(menuVo);
	}

	@Override
	public List<Menu> selectRoleMenuTreeByRid(Integer roleid) {
		return menuMapper.queryRoleMenuTree(roleid);
	}

	@Override
	public List<Menu> queryAllMenusByUserId(Integer userid) {
		return menuMapper.queryAllMenusByUserId(userid);
	}

}
