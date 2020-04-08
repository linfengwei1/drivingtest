package com.great.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/coach")//@RequestMapping：可以为控制器指定处理可以请求哪些URL请求。
public class CoachController
{
    @RequestMapping("/login")
    public ModelAndView test()
    {
        System.out.println("login-----------");
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("coach/jsp/SchoolLogin");
        return modelAndView;
    }
}

