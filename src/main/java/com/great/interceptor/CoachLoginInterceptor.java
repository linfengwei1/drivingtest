package com.great.interceptor;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CoachLoginInterceptor extends HandlerInterceptorAdapter
{
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
            throws Exception {
        String uri = request.getRequestURI();
        String path = request.getContextPath();
        String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;

        if(request.getSession() != null && request.getSession().getAttribute("coach") != null)
        {
            return true;
        }

        if( request.getSession().getAttribute("vcode") != null)
        {
            return true;
        }
        System.out.println("教练执行了拦截器");
        response.sendRedirect(basePath+"/coach/login");
        return false;


    }
}
