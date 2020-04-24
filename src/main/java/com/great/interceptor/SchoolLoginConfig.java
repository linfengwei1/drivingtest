package com.great.interceptor;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class SchoolLoginConfig implements WebMvcConfigurer
{
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		//注册TestInterceptor拦截器
		InterceptorRegistration registration = registry.addInterceptor(new SchoolLoginInterceptor());
		registration.addPathPatterns("/school/**");                      //所有驾校操作路径都被拦截
		registration.excludePathPatterns(                         //添加不拦截路
				"/school/path/SchoolLogin",//驾校登录
				"/school/login",
				"/school/path/SchoolFaceLogin",//驾校人脸登录
				"/school/faceLogin",
				"/school/path/ChangePwd",//忘记密码
				"/school/CheckCodeServlet",//验证码
				"/school/phoneMsg",//获取手机验证码
				"/school/changePwdByPhone",//手机验证码更改
				"/school/index2",
				"/school/school",
				"/school/WelcomeTable",
				"/school/jumpNwePage"
				);
	}
}
