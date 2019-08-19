package com.gxz.bus.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.gxz.bus.domain.Car;
import com.gxz.bus.mapper.CarMapper;
import com.gxz.bus.service.CarService;
import com.gxz.bus.vo.CarVo;
import com.gxz.sys.utils.jsondata.DataGridView;

@Service
public class CarServiceImpl implements CarService {
	
	@Autowired
	private CarMapper carMapper;

	@Override
	public DataGridView loadAllCar(CarVo carVo) {
		Page<Object> page = PageHelper.startPage(carVo.getPage(), carVo.getRows());
		List<Car> cars = carMapper.queryAllCar(carVo);
		return new DataGridView(page.getTotal(),cars);
	}

	@Override
	public void addCar(CarVo carVo) {
		carMapper.insertSelective(carVo);
	}

	@Override
	public void updateCar(CarVo carVo) {
		carMapper.updateByPrimaryKeySelective(carVo);
	}

	@Override
	public void deleteCar(String carnumber) {
		carMapper.deleteByPrimaryKey(carnumber);
	}

}
