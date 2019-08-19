package com.gxz.sys.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.gxz.sys.domain.LoginInfo;
import com.gxz.sys.mapper.LoginInfoMapper;
import com.gxz.sys.service.LoginInfoService;
import com.gxz.sys.utils.jsondata.DataGridView;
import com.gxz.sys.vo.LoginInfoVo;

@Service
public class LoginInfoServiceImpl implements LoginInfoService {

	@Autowired
	private LoginInfoMapper loginInfoMapper;
	
	@Override
	public DataGridView loadAllLoginInfo(LoginInfoVo loginInfoVo) {
		Page<Object> page = PageHelper.startPage(loginInfoVo.getPage(), loginInfoVo.getRows());
		List<LoginInfo> loginInfos = loginInfoMapper.queryAllLoginInfo(loginInfoVo);
		return new DataGridView(page.getTotal(), loginInfos);
	}

	@Override
	public void deleteLoginInfo(Integer id) {
		loginInfoMapper.deleteByPrimaryKey(id);
	}

	@Override
	public void addLoginInfo(LoginInfoVo loginFoVo) {
		loginInfoMapper.insert(loginFoVo);
	}

}
