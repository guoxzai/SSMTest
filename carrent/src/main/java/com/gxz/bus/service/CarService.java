package com.gxz.bus.service;

import com.gxz.bus.vo.CarVo;
import com.gxz.sys.utils.jsondata.DataGridView;

public interface CarService {

	DataGridView loadAllCar(CarVo carVo);

	void addCar(CarVo carVo);

	void updateCar(CarVo carVo);

	void deleteCar(String carnumber);

}
