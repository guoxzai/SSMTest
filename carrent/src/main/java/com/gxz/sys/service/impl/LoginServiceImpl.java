package com.gxz.sys.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gxz.sys.domain.User;
import com.gxz.sys.mapper.UserMapper;
import com.gxz.sys.service.LoginService;
import com.gxz.sys.vo.UserVo;

@Service
public class LoginServiceImpl implements LoginService {

	@Autowired
	private UserMapper userMapper;
	
	@Override
	public User login(UserVo userVo) {
		return userMapper.login(userVo);
	}

}
