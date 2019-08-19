package com.gxz.sys.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.gxz.sys.domain.User;
import com.gxz.sys.utils.WebUtils;

public class AppSessionInterceptor implements HandlerInterceptor{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response,
			Object object) throws Exception {
		System.err.print("preHandle");
		User user = WebUtils.getCurrentUser(User.class, "user");
		if(null != user){
			return true;
		}
		
		String path = WebUtils.getCurrentHttpServletRequest().getServletContext().getContextPath();
		response.sendRedirect(path+"/index.jsp");
		return false;
	}
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse arg1,
			Object arg2, ModelAndView arg3) throws Exception {
		System.err.print("postHandle");
	}
	
	@Override
	public void afterCompletion(HttpServletRequest arg0,
			HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
		System.err.print("afterCompletion");
		
	}

	

	

}
