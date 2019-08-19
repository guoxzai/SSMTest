package com.gxz.bus.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.gxz.bus.constast.BusConstast;
import com.gxz.bus.domain.Car;
import com.gxz.bus.domain.Rent;
import com.gxz.bus.mapper.CarMapper;
import com.gxz.bus.mapper.RentMapper;
import com.gxz.bus.service.RentCarService;
import com.gxz.bus.vo.RentVo;
import com.gxz.sys.utils.jsondata.DataGridView;

@Service
public class RentCarServiceImpl implements RentCarService {

	@Autowired
	private RentMapper rentMapper;
	@Autowired
	private CarMapper carMapper;
	
	@Override
	public void addCustomer(RentVo rentVo) {
		rentMapper.insertSelective(rentVo);
		
		Car car = new Car();
		car.setCarnumber(rentVo.getCarnumber());
		car.setIsrenting(BusConstast.RENT_FLAG_TRUE);
		carMapper.updateByPrimaryKeySelective(car);//  设置为已出租
		
	}

	@Override
	public DataGridView queryAllRent(RentVo rentVo) {
		Page<Object> page = PageHelper.startPage(rentVo.getPage(), rentVo.getRows());
		List<Rent> rents = rentMapper.queryAllRent(rentVo);
		return new DataGridView(page.getTotal(),rents);
	}

	@Override
	public void updateRent(RentVo rentVo) {
		rentMapper.updateByPrimaryKeySelective(rentVo);
	}

	@Override
	public void deleteRent(RentVo rentVo) {
		rentMapper.deleteByPrimaryKey(rentVo.getRentid());
		Car car = new Car();
		car.setCarnumber(rentVo.getCarnumber());
		car.setIsrenting(BusConstast.RENT_FLAG_FALSE);//  设置为未出租
		carMapper.updateByPrimaryKeySelective(car);
	}

	@Override
	public Rent querRentByid(RentVo rentVo) {
		return rentMapper.selectByPrimaryKey(rentVo.getRentid());
	}

}
