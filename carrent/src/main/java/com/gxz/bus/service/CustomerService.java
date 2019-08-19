package com.gxz.bus.service;

import java.util.List;

import com.gxz.bus.domain.Customer;
import com.gxz.bus.vo.CustomerVo;
import com.gxz.sys.utils.jsondata.DataGridView;

public interface CustomerService {

	DataGridView loadAllCustomer(CustomerVo customerVo);

	void addCustomer(CustomerVo customerVo);

	void updateCustomer(CustomerVo customerVo);

	void deleteCustomer(String identity);

	Customer queryCustomerById(String identity);

	List<Customer> queryAllCustomers(CustomerVo customerVo);

}
