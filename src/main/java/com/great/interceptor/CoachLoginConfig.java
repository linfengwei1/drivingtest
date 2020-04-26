package com.great.interceptor;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class CoachLoginConfig implements WebMvcConfigurer
{
    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        //注册TestInterceptor拦截器
        InterceptorRegistration registration = registry.addInterceptor(new CoachLoginInterceptor());
        registration.addPathPatterns("/coach/**");                      //所有驾校操作路径都被拦截
        registration.excludePathPatterns(                         //添加不拦截路
                "/coach/login",//教练登录
                "/coach/CheckCodeServlet",//验证码
                "coach/checkLogin"
        );
    }
}
