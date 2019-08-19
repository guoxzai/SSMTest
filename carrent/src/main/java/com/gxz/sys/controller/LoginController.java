package com.gxz.sys.controller;

import java.sql.Timestamp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.gxz.sys.constast.SysConstast;
import com.gxz.sys.domain.User;
import com.gxz.sys.service.LoginInfoService;
import com.gxz.sys.service.LoginService;
import com.gxz.sys.utils.WebUtils;
import com.gxz.sys.vo.LoginInfoVo;
import com.gxz.sys.vo.UserVo;


@Controller
@RequestMapping("login")
public class LoginController {

	@Autowired
	private LoginService loginService;
	
	@Autowired
	private LoginInfoService loginInfoService;
	
	@RequestMapping("toLogin")
	public String toLogin(){
		return "forward:/WEB-INF/view/system/login.jsp";
	}
	
	@RequestMapping("checkLogin")
	public String checkLogin(UserVo userVo,Model model){
		User user = loginService.login(userVo);
		if(null == user){
			model.addAttribute("error", SysConstast.LOGIN_ERROR_USERNAME);
			return "forward:/WEB-INF/view/system/login.jsp";
		}else if(!user.getPwd().equals(userVo.getPwd())){
			model.addAttribute("error", SysConstast.LOGIN_ERROR_PWD);
			return "forward:/WEB-INF/view/system/login.jsp";
		}
		
		WebUtils.getCurrentHttpServletRequest().getSession().setAttribute("user", user);
		//插入日志 记录
		LoginInfoVo loginFoVo = new LoginInfoVo();
		loginFoVo.setLoginip(WebUtils.getCurrentHttpServletRequest().getRemoteAddr());
		loginFoVo.setLoginname(user.getLoginname()+"-->"+user.getRealname());
		loginFoVo.setLogintime(new Timestamp(System.currentTimeMillis()));
		loginInfoService.addLoginInfo(loginFoVo);
		return "forward:/WEB-INF/view/system/index.jsp";
	}
	
}
