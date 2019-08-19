package com.gxz.bus.controller;

import java.sql.Timestamp;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gxz.bus.constast.BusConstast;
import com.gxz.bus.domain.Customer;
import com.gxz.bus.domain.Rent;
import com.gxz.bus.service.CustomerService;
import com.gxz.bus.service.RentCarService;
import com.gxz.bus.utils.CarrentRandomUtils;
import com.gxz.bus.utils.ExportRentExcelUtils;
import com.gxz.bus.vo.RentVo;
import com.gxz.sys.constast.SysConstast;
import com.gxz.sys.domain.User;
import com.gxz.sys.utils.WebUtils;
import com.gxz.sys.utils.jsondata.DataGridView;
import com.gxz.sys.utils.jsondata.ResultObj;

@Controller
@RequestMapping("rentCar")
public class RentCarController {
	
	@Autowired
	private RentCarService rentCarService;
	@Autowired
	private CustomerService customerService;
	
	@RequestMapping("toRentCarManager")
	public String toRentCarManager(){
		return "/WEB-INF/view/business/rentCarManager.jsp";
	}
	
	@RequestMapping("initRentCarFrm")
	@ResponseBody
	public RentVo initRentCarFrm(RentVo rentVo){
		User user = (User) WebUtils.getCurrentHttpServletRequest().getSession().getAttribute("user");
		rentVo.setOpername(user.getRealname());
		rentVo.setBegindate(new Timestamp(System.currentTimeMillis()));
		rentVo.setRentid(CarrentRandomUtils.createRandomStringId(BusConstast.PROFIX_CZ));
		rentVo.setRentflag(BusConstast.RENT_FLAG_FALSE);
		return rentVo;
	}
	
	@RequestMapping("addRent")
	@ResponseBody
	public ResultObj addRent(RentVo rentVo){
		ResultObj obj = null;
		
		try{
			rentCarService.addCustomer(rentVo);
			obj = new ResultObj(SysConstast.CODE_SUCCESS,SysConstast.OPERATION_DELETE_SUCCESS);
		}catch(Exception e){
			e.printStackTrace();
			obj = new ResultObj(SysConstast.CODE_ERROR, SysConstast.OPERATION_DELETE_ERROR);
		}
		
		return obj;
	}
//----------------------------------------------	
	/**
	 * 出租单管理
	 */
	@RequestMapping("toRentManager")
	public String toRentManager(){
		return "/WEB-INF/view/business/rentManager.jsp";
	}
	
	@RequestMapping("loadAllRent")
	@ResponseBody
	public DataGridView loadAllRent(RentVo rentVo){
		return rentCarService.queryAllRent(rentVo);
	}
	
	//修改出租订单
	@RequestMapping("updateRent")
	@ResponseBody
	public ResultObj updateRent(RentVo rentVo){
		ResultObj obj = null;
		try {
			rentCarService.updateRent(rentVo);
			obj = new ResultObj(SysConstast.CODE_SUCCESS,SysConstast.OPERATION_UPDATE_SUCCESS);
		} catch (Exception e) {
			e.printStackTrace();
			obj = new ResultObj(SysConstast.CODE_ERROR,SysConstast.OPERATION_UPDATE_ERROR);
		}
		return obj;
	}
	
	//删除出租订单
	@RequestMapping("deleteRent")
	@ResponseBody
	public ResultObj deleteRent(RentVo rentVo){
		ResultObj obj = null;
		try {
			rentCarService.deleteRent(rentVo);
			obj = new ResultObj(SysConstast.CODE_SUCCESS,SysConstast.OPERATION_DELETE_SUCCESS);
		} catch (Exception e) {
			e.printStackTrace();
			obj = new ResultObj(SysConstast.CODE_ERROR,SysConstast.OPERATION_DELETE_ERROR);
		}
		return obj;
	}
	
//----------------------------------------------	

	/**
	 * 汽车入库
	 * 查询出租单是否存在
	 */
	@RequestMapping("queryRentById")
	@ResponseBody
	public Rent queryRentById(RentVo rentVo){
		return rentCarService.querRentByid(rentVo);
	}
	
	
	/**
	 * 导出出租单
	 */
	@RequestMapping("exportRent")
	public void exportRent(RentVo rentVo,HttpServletResponse response){
		Rent rent = rentCarService.querRentByid(rentVo);
		Customer customer = customerService.queryCustomerById(rent.getIdentity());
		String fileName = customer.getCustname()+"-出租单信息.xls";
		String titleName = customer.getCustname()+"-出租单信息"; 
		ExportRentExcelUtils.exportRent(rent,customer,fileName,titleName,response);
	}
	
}
