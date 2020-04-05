package com.great.controller;

import com.great.entity.User;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/admin")
public class AdminController
{

	@RequestMapping("/test")
	public ModelAndView test()
	{
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("index");
		return modelAndView;
	}
	@RequestMapping("/testStr")
	public String testStr()
	{
		return "index";
	}
	@RequestMapping("/tologin")
	public String tologin(String uname, String pwd, HttpServletRequest request)
	{
		User user = new User();
		user.setUname("老张");
		request.setAttribute("user",user);
		System.out.println("用户账号是"+uname);
		System.out.println("用户密码是"+pwd);
		return "success";
	}
	@RequestMapping("/login")
	public String login()
	{
		return "login";
	}
}
