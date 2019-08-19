package com.gxz.bus.service;

import java.util.Map;

import com.gxz.bus.vo.CheckVo;
import com.gxz.sys.utils.jsondata.DataGridView;

public interface CheckService {

	Map<String, Object> queryCheckCarCustomer(CheckVo checkVo);

	void addCheck(CheckVo checkVo);

	DataGridView loadAllCheck(CheckVo checkVo);

	void updateCheck(CheckVo checkVo);

}
