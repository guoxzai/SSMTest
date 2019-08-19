package com.gxz.bus.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gxz.bus.domain.Customer;
import com.gxz.bus.service.CustomerService;
import com.gxz.bus.vo.CustomerVo;
import com.gxz.sys.constast.SysConstast;
import com.gxz.sys.utils.jsondata.DataGridView;
import com.gxz.sys.utils.jsondata.ResultObj;
import com.gxz.bus.utils.ExportCustomerExcelUtils;
@Controller
@RequestMapping("customer")
public class CustomerController {
	@Autowired
	private CustomerService customerService;
	
	@RequestMapping("toCustomerManager.action")
	public String toLogInfoManager(){
		return "forward:/WEB-INF/view/business/customerManager.jsp";
	}
	
	@RequestMapping("loadAllCustomer")
	@ResponseBody
	public DataGridView loadAllCustomer(CustomerVo customerVo){
		return customerService.loadAllCustomer(customerVo);
	}
	
	@RequestMapping("addCustomer")
	@ResponseBody
	public ResultObj addCustomer(CustomerVo customerVo){
		ResultObj obj = null;
		
		try{
			customerService.addCustomer(customerVo);
			obj = new ResultObj(SysConstast.CODE_SUCCESS,SysConstast.OPERATION_DELETE_SUCCESS);
		}catch(Exception e){
			e.printStackTrace();
			obj = new ResultObj(SysConstast.CODE_ERROR, SysConstast.OPERATION_DELETE_ERROR);
		}
		
		return obj;
	}
	
	@RequestMapping("updateCustomer")
	@ResponseBody
	public ResultObj updateCustomer(CustomerVo customerVo){
		ResultObj obj = null;
		
		try{
			customerService.updateCustomer(customerVo);
			obj = new ResultObj(SysConstast.CODE_SUCCESS,SysConstast.OPERATION_DELETE_SUCCESS);
		}catch(Exception e){
			e.printStackTrace();
			obj = new ResultObj(SysConstast.CODE_ERROR, SysConstast.OPERATION_DELETE_ERROR);
		}
		
		return obj;
	}
	
	@RequestMapping("deleteCustomer")
	@ResponseBody
	public ResultObj deleteCustomer(CustomerVo customerVo){
		ResultObj obj = null;
		
		try{
			customerService.deleteCustomer(customerVo.getIdentity());
			obj = new ResultObj(SysConstast.CODE_SUCCESS,SysConstast.OPERATION_DELETE_SUCCESS);
		}catch(Exception e){
			e.printStackTrace();
			obj = new ResultObj(SysConstast.CODE_ERROR, SysConstast.OPERATION_DELETE_ERROR);
		}
		
		return obj;
	}
	
	//汽车出租  搜索框中通过省份证判断用户存不存在
	@RequestMapping("customerisExist")
	@ResponseBody
	public Map<String,Boolean> queryCustomerById(CustomerVo customerVo){
		Map<String,Boolean> map = new HashMap<>();
		Customer customer = customerService.queryCustomerById(customerVo.getIdentity());
		map.put("flag", customer!=null?true:false);
		return map;
	}
	
	/**
	 * 导出所有客户信息的Excel表格
	 */
	@RequestMapping("exportCustomer")
	public void exportCustomer(CustomerVo customerVo,HttpServletResponse response){
		List<Customer> customerList = customerService.queryAllCustomers(customerVo);
		String fileName = "客户数据.xls";
		String sheetName = "客户数据";
		ExportCustomerExcelUtils.exportCustomer(fileName,sheetName,customerList,response);
	}
}
