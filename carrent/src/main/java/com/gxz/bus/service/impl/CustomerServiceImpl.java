package com.gxz.bus.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.gxz.bus.domain.Customer;
import com.gxz.bus.mapper.CustomerMapper;
import com.gxz.bus.service.CustomerService;
import com.gxz.bus.vo.CustomerVo;
import com.gxz.sys.utils.jsondata.DataGridView;

@Service
public class CustomerServiceImpl implements CustomerService {

	@Autowired
	private CustomerMapper customerMapper;
	
	@Override
	public DataGridView loadAllCustomer(CustomerVo customerVo) {
		Page<Object> page = PageHelper.startPage(customerVo.getPage(), customerVo.getRows());
		List<Customer> customers = customerMapper.queryAllCustomer(customerVo);
		return new DataGridView(page.getTotal(),customers);
	}

	@Override
	public void addCustomer(CustomerVo customerVo) {
		customerMapper.insert(customerVo);
	}

	@Override
	public void updateCustomer(CustomerVo customerVo) {
		customerMapper.updateByPrimaryKey(customerVo);
	}

	@Override
	public void deleteCustomer(String identity) {
		customerMapper.deleteByPrimaryKey(identity);
	}

	@Override
	public Customer queryCustomerById(String identity) {
		return customerMapper.selectByPrimaryKey(identity);
	}

	@Override
	public List<Customer> queryAllCustomers(CustomerVo customerVo) {
		return customerMapper.queryAllCustomer(customerVo);
	}

}
