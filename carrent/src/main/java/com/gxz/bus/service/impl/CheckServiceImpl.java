package com.gxz.bus.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.gxz.bus.constast.BusConstast;
import com.gxz.bus.domain.Car;
import com.gxz.bus.domain.Check;
import com.gxz.bus.domain.Customer;
import com.gxz.bus.domain.Rent;
import com.gxz.bus.mapper.CarMapper;
import com.gxz.bus.mapper.CheckMapper;
import com.gxz.bus.mapper.CustomerMapper;
import com.gxz.bus.mapper.RentMapper;
import com.gxz.bus.service.CheckService;
import com.gxz.bus.vo.CheckVo;
import com.gxz.sys.utils.jsondata.DataGridView;

@Service
public class CheckServiceImpl implements CheckService{
	
	@Autowired
	private CheckMapper checkMapper;
	@Autowired
	private RentMapper rentMapper;
	@Autowired
	private CustomerMapper customerMapper;
	@Autowired
	private CarMapper carMapper;

	@Override
	public Map<String, Object> queryCheckCarCustomer(CheckVo checkVo) {
		Map<String,Object> map = new HashMap<>();
		Rent rent = rentMapper.selectByPrimaryKey(checkVo.getRentid());
		Car car = carMapper.selectByPrimaryKey(rent.getCarnumber());
		Customer customer = customerMapper.selectByPrimaryKey(rent.getIdentity());
		
		map.put("rent", rent);
		map.put("car", car);
		map.put("customer", customer);
		return map;
	}

	@Override
	public void addCheck(CheckVo checkVo) {
		checkMapper.insertSelective(checkVo);
		Rent rent = rentMapper.selectByPrimaryKey(checkVo.getRentid());
		rent.setRentflag(BusConstast.RENT_FLAG_TRUE);//已归还
		rentMapper.updateByPrimaryKeySelective(rent);

		Car car = new Car();
		car.setIsrenting(BusConstast.ISRENT_FLAG_FALSE);//未出租
		car.setCarnumber(rent.getCarnumber());
		carMapper.updateByPrimaryKeySelective(car);
	}

	@Override
	public DataGridView loadAllCheck(CheckVo checkVo) {
		Page<Object> page = PageHelper.startPage(checkVo.getPage(), checkVo.getRows());
		List<Check> checks = checkMapper.queryAllCheck(checkVo);
		return new DataGridView(page.getTotal(),checks);
	}

	@Override
	public void updateCheck(CheckVo checkVo) {
		checkMapper.updateByPrimaryKeySelective(checkVo);
	}
}
