package com.gxz.sys.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.gxz.sys.constast.SysConstast;
import com.gxz.sys.domain.User;
import com.gxz.sys.mapper.UserMapper;
import com.gxz.sys.service.UserService;
import com.gxz.sys.utils.jsondata.DataGridView;
import com.gxz.sys.vo.UserVo;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserMapper userMapper;
	
	@Override
	public boolean userIsExist(UserVo userVo) {
		return userMapper.queryUserCount(userVo)>0;
	}

	@Override
	public void updatePwd(UserVo userVo) {
		userMapper.updateByPrimaryKeySelective(userVo);
	}

	@Override
	public DataGridView loadAllUser(UserVo userVo) {
		Page<Object> page = PageHelper.startPage(userVo.getPage(), userVo.getRows());
		List<User> users = userMapper.queryAllUser(userVo);
		return new DataGridView(page.getTotal(),users);
	}

	@Override
	public void addUser(UserVo userVo) {
		userMapper.insertSelective(userVo);
	}

	@Override
	public void updateUser(UserVo userVo) {
		userMapper.updateByPrimaryKeySelective(userVo);
	}

	@Override
	public void deleteUser(UserVo userVo) {
		userMapper.deleteByPrimaryKey(userVo.getUserid());
	}

	@Override
	public void resettingPwd(UserVo userVo) {
		userVo.setPwd(SysConstast.OPERATION_RESET_PWD);
		userMapper.updateByPrimaryKeySelective(userVo);
	}

	/**
	 * 用户分配角色
	 */
	@Override
	public void saveUserRole(UserVo userVo) {
		Integer[] rids = userVo.getRids();
		
		userMapper.deleteUserRole(userVo.getUserid());
		
		if(rids.length>0){
			for (Integer rid : rids) {
				userMapper.addUserRole(userVo.getUserid(), rid);
			}
		}
	}

}
