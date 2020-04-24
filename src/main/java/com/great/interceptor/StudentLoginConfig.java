package com.great.interceptor;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class StudentLoginConfig implements WebMvcConfigurer
{
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		//注册TestInterceptor拦截器
		InterceptorRegistration registration = registry.addInterceptor(new StudentLoginInterceptor());
		registration.addPathPatterns("/student/**");                      //所有学员操作路径都被拦截
		registration.excludePathPatterns(                         //添加不拦截路径
				"/student/path/StudentLogin",          //登录
				"/student/login",          //登录
				"/student/CheckCode"           //登录

		);
	}
}
