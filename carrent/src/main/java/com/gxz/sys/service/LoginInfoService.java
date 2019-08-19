package com.gxz.sys.service;

import com.gxz.sys.utils.jsondata.DataGridView;
import com.gxz.sys.vo.LoginInfoVo;

public interface LoginInfoService {

	DataGridView loadAllLoginInfo(LoginInfoVo loginInfoVo);

	void deleteLoginInfo(Integer id);

	void addLoginInfo(LoginInfoVo loginFoVo);

}
