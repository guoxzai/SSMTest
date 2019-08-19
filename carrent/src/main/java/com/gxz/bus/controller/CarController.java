package com.gxz.bus.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gxz.bus.service.CarService;
import com.gxz.bus.vo.CarVo;
import com.gxz.sys.constast.SysConstast;
import com.gxz.sys.utils.jsondata.DataGridView;
import com.gxz.sys.utils.jsondata.ResultObj;

@Controller
@RequestMapping("car")
public class CarController {
	@Autowired
	private CarService carService;
	
	@RequestMapping("toCarManager.action")
	public String toLogInfoManager(){
		return "forward:/WEB-INF/view/business/carManager.jsp";
	}
	
	@RequestMapping("loadAllCar")
	@ResponseBody
	public DataGridView loadAllCar(CarVo carVo){
		return carService.loadAllCar(carVo);
	}
	
	@RequestMapping("addCar")
	@ResponseBody
	public ResultObj addCar(CarVo carVo){
		ResultObj obj = null;
		
		try{
			carService.addCar(carVo);
			obj = new ResultObj(SysConstast.CODE_SUCCESS,SysConstast.OPERATION_DELETE_SUCCESS);
		}catch(Exception e){
			e.printStackTrace();
			obj = new ResultObj(SysConstast.CODE_ERROR, SysConstast.OPERATION_DELETE_ERROR);
		}

		return obj;
	}
	
	@RequestMapping("updateCar")
	@ResponseBody
	public ResultObj updateCar(CarVo carVo){
		ResultObj obj = null;
		
		try{
			carService.updateCar(carVo);
			obj = new ResultObj(SysConstast.CODE_SUCCESS,SysConstast.OPERATION_DELETE_SUCCESS);
		}catch(Exception e){
			e.printStackTrace();
			obj = new ResultObj(SysConstast.CODE_ERROR, SysConstast.OPERATION_DELETE_ERROR);
		}
		
		return obj;
	}
	
	@RequestMapping("deleteCar")
	@ResponseBody
	public ResultObj deleteCar(CarVo carVo){
		ResultObj obj = null;
		
		try{
			carService.deleteCar(carVo.getCarnumber());
			obj = new ResultObj(SysConstast.CODE_SUCCESS,SysConstast.OPERATION_DELETE_SUCCESS);
		}catch(Exception e){
			e.printStackTrace();
			obj = new ResultObj(SysConstast.CODE_ERROR, SysConstast.OPERATION_DELETE_ERROR);
		}

		return obj;
	}


	
}
