package com.gxz.sys.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gxz.sys.constast.SysConstast;
import com.gxz.sys.service.LoginInfoService;
import com.gxz.sys.utils.WebUtils;
import com.gxz.sys.utils.jsondata.DataGridView;
import com.gxz.sys.utils.jsondata.ResultObj;
import com.gxz.sys.vo.LoginInfoVo;


@Controller
@RequestMapping("logInfo")
public class LoginInfoController {

	@Autowired
	private LoginInfoService loginInfoService;
	
	@RequestMapping("toLogInfoManager")
	public String toLogInfoManager(){
		return "forward:/WEB-INF/view/system/loginInfoManager.jsp";
	}
	
	@RequestMapping("loadAllLoginInfo")
	@ResponseBody
	public DataGridView loadAllLoginInfo(LoginInfoVo loginInfoVo){
		return loginInfoService.loadAllLoginInfo(loginInfoVo);
	}
	
	@RequestMapping("deleteLoginInfo")
	@ResponseBody
	public ResultObj deleteLoginInfo(LoginInfoVo loginInfoVo){
		ResultObj obj = null;
		
		try{
			loginInfoService.deleteLoginInfo(loginInfoVo.getId());
			obj = new ResultObj(SysConstast.CODE_SUCCESS,SysConstast.OPERATION_DELETE_SUCCESS);
		}catch(Exception e){
			e.printStackTrace();
			obj = new ResultObj(SysConstast.CODE_ERROR, SysConstast.OPERATION_DELETE_ERROR);
		}
		
		return obj;
	}
	
	@RequestMapping("exitLogin")
	public String exitLogin(){
		WebUtils.getCurrentHttpServletRequest().getSession().invalidate();
		return "redirect:/index.jsp";
	}
}
