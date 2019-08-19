package com.gxz.sys.utils;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

public class WebUtils {

	/**
	 * 得到当前线程的HttpServletRequest
	 */
	public static HttpServletRequest getCurrentHttpServletRequest() {
		ServletRequestAttributes requestAttributes = (ServletRequestAttributes) RequestContextHolder
				.getRequestAttributes();
		HttpServletRequest request = requestAttributes.getRequest();
		return request;
	}

	/**
	 * 得到session
	 * 
	 */
	public static HttpSession getCurrentSession() {
		return getCurrentHttpServletRequest().getSession();
	}

	/**
	 * 得到context
	 * 
	 */
	public static ServletContext getServletContext() {
		return getCurrentHttpServletRequest().getServletContext();
	}
	

	
	@SuppressWarnings("all")
	public static <T> T getCurrentUser(Class<T> clz,String attributeName){
		return (T) getCurrentHttpServletRequest().getSession().getAttribute(attributeName);
	}
	
}
