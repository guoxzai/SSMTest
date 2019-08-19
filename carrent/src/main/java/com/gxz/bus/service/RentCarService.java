package com.gxz.bus.service;

import com.gxz.bus.domain.Rent;
import com.gxz.bus.vo.RentVo;
import com.gxz.sys.utils.jsondata.DataGridView;

public interface RentCarService {

	void addCustomer(RentVo rentVo);

	DataGridView queryAllRent(RentVo rentVo);

	void updateRent(RentVo rentVo);

	void deleteRent(RentVo rentVo);

	Rent querRentByid(RentVo rentVo);

}
