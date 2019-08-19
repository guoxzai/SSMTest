package com.gxz.bus.controller;

import java.util.Date;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gxz.bus.constast.BusConstast;
import com.gxz.bus.service.CheckService;
import com.gxz.bus.utils.CarrentRandomUtils;
import com.gxz.bus.vo.CheckVo;
import com.gxz.sys.constast.SysConstast;
import com.gxz.sys.domain.User;
import com.gxz.sys.utils.WebUtils;
import com.gxz.sys.utils.jsondata.DataGridView;
import com.gxz.sys.utils.jsondata.ResultObj;

@Controller
@RequestMapping("check")
public class CheckController {
	
	@Autowired
	private CheckService checkService;
	
	@RequestMapping("toCheckCarManager")
	public String toCheckCarManager(){
		return "/WEB-INF/view/business/checkCarManager.jsp";
	}
	
	/***************汽车入库开始*******************/
	@RequestMapping("initCheckFrm")
	@ResponseBody
	public Map<String,Object> initCheckFrm(CheckVo checkVo){
		Map<String,Object> map = checkService.queryCheckCarCustomer(checkVo);
		checkVo.setCheckdate(new Date());
		checkVo.setCheckid(CarrentRandomUtils.createRandomStringId(BusConstast.PROFIX_JC));
		checkVo.setOpername(WebUtils.getCurrentUser(User.class, "user").getRealname());
		
		map.put("check", checkVo);
		return map;
	} 
	
	@RequestMapping("addCheck")
	@ResponseBody
	public ResultObj addCheck(CheckVo checkVo){
		ResultObj obj=null;
		try {
			checkService.addCheck(checkVo);//修改出租状态  和  汽车状态
			obj = new ResultObj(SysConstast.CODE_SUCCESS,SysConstast.OPERATION_ADD_SUCCESS);
		} catch (Exception e) {
			e.printStackTrace();
			obj = new ResultObj(SysConstast.CODE_ERROR,SysConstast.OPERATION_ADD_ERROR);
		}
		
		return obj;
	}
	/***************汽车入库结束*******************/
	
	
	/***************检查单管理******************/
	@RequestMapping("toCheckManager")
	public String toCheckManager(){
		return "forward:/WEB-INF/view/business/checkManager.jsp";
	}					
	
	@RequestMapping("loadAllCheck")
	@ResponseBody
	public DataGridView loadAllCheck(CheckVo checkVo){
		return checkService.loadAllCheck(checkVo);
	}
	
	@RequestMapping("updateCheck")
	@ResponseBody
	public ResultObj updateCheck(CheckVo checkVo){
		ResultObj obj = null;
		try {
			checkService.updateCheck(checkVo);
			obj = new ResultObj(SysConstast.CODE_SUCCESS,SysConstast.OPERATION_UPDATE_ERROR);
		} catch (Exception e) {
			e.printStackTrace();
			obj = new ResultObj(SysConstast.CODE_ERROR,SysConstast.OPERATION_UPDATE_ERROR);
		}
		return obj;
	}
}
