package com.great.controller;


import com.great.entity.Student;
import com.great.service.StudentManageService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/student")
public class StudentController
{
	@Resource(name = "studentManageServiceImpl")
	private StudentManageService studentManageServiceImpl;


	@RequestMapping("/login")
	public String login(String account, String pwd, HttpServletRequest request, HttpServletResponse response)
	{
		Student student = studentManageServiceImpl.login(account,pwd);
		HttpSession hs=request.getSession();
		hs.setAttribute("user",student);
		System.out.println(student);
		return null;
	}
	@RequestMapping("/loginPage")
	public String loginPage()
	{
		return "student/jsp/StudentLogin";

	}
}
