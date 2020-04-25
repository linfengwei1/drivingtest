package com.great.interceptor;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class SchoolLoginInterceptor extends HandlerInterceptorAdapter
{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {

		//request.getSchema()可以返回当前页面使用的协议，就是上面例子中的“http”
		//request.getServerName()可以返回当前页面所在的服务器的名字，就是上面例子中的“localhost"
		//request.getServerPort()可以返回当前页面所在的服务器使用的端口，
		//request.getContextPath()可以返回当前页面所在的应用的名字
		String uri = request.getRequestURI();
		String path = request.getContextPath();
		String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;

		//判断是否登录
		if(request.getSession() != null && request.getSession().getAttribute("SchoolAdmin") != null)
		{
			return true;
		}
		//给验证码放行
		if( request.getSession().getAttribute("vcode") != null)
		{
			return true;
		}
		System.out.println("学校执行了拦截器");
		response.sendRedirect(basePath+"/school/path/SchoolLogin");
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