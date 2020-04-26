package com.great.interceptor;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class TransportationlLoginConfig implements WebMvcConfigurer
{
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		//注册TestInterceptor拦截器
		InterceptorRegistration registration = registry.addInterceptor(new TLoginInterceptor());
		registration.addPathPatterns("/TM/**");                      //所有驾校操作路径都被拦截
		registration.excludePathPatterns(                         //添加不拦截路
				"/TM/path/TransportationLogin",//驾校登录
				"/TM/Login",
				"/TM/CheckCodeServlet"//验证码


				);
	}
}
