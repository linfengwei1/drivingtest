package com.great.controller;


import com.great.entity.Student;
import com.great.service.StudentManageService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
@RequestMapping("/student")
public class StudentController
{
	@Resource(name = "studentManageServiceImpl")
	private StudentManageService studentManageServiceImpl;


	@RequestMapping("/login")
	public String login(String uname, String pwd, HttpServletRequest request, HttpServletResponse response)
	{
		Student student = studentManageServiceImpl.login(uname,pwd);
//		HttpSession hs=request.getSession();
//		hs.setAttribute("user",user);
//		return "front/jsp/UserMain";
		System.out.println(student);
		return null;
	}

}
