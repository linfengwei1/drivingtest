package com.great.interceptor;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LoginInterceptor extends HandlerInterceptorAdapter
{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		String uri = request.getRequestURI();
		String path = request.getContextPath();
		String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
		if(uri.endsWith("/login") || uri.endsWith("/loginPage"))
		{
			if(request.getSession() != null && request.getSession().getAttribute("user") != null)
			{
				response.sendRedirect(basePath+"/user/UserMain");
				return false;
			}else
			{
				return true;
			}
		}
		if(request.getSession() != null && request.getSession().getAttribute("user") != null)
		{
			return true;
		}
		System.out.println("执行了拦截器");
		response.sendRedirect(basePath+"/user/loginPage");
		return false;
	}

//	@Override
//	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
//			ModelAndView modelAndView) throws Exception {
//		System.out.println("--1--HandlerInterceptor1.postHandle");
//	}
//
//	@Override
//	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
//			throws Exception {
//		System.out.println("--1--HandlerInterceptor1.afterCompletion");
//	}
}