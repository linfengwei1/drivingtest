package com.great.controller;


import com.google.gson.Gson;
import com.great.entity.QuestionList;
import com.great.entity.Student;
import com.great.service.StudentManageService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.Random;

@Controller
@RequestMapping("/student")
public class StudentController
{
	private Gson g = new Gson();
	private Random random = new Random();
	@Resource(name = "studentManageServiceImpl")
	private StudentManageService studentManageServiceImpl;


	@RequestMapping("/login")
	@ResponseBody
	public String login(Student student, HttpServletRequest request, HttpServletResponse response) throws IOException
	{
		String YZM = (String)request.getSession().getAttribute("vcode");//拿到验证码
		Boolean confirm = student.getVerification().equalsIgnoreCase(YZM);//不区分大小写

		if (confirm) {
			Student newStudent =studentManageServiceImpl.login(student.getAccount(),student.getPwd());
			if (null!=newStudent){
				request.getSession().setAttribute("student",newStudent);
				return "success";
			}else{
				return "error";
			}
		}else{
			return "yzm";
		}

	}
	@RequestMapping("/checkStudyAuthority")
	@ResponseBody
	public String checkStudyAuthority(String studentId, String vedioId,String subject,HttpServletRequest request, HttpServletResponse response) throws IOException
	{
		String result = studentManageServiceImpl.checkStudyAuthority(studentId,vedioId,subject);
		return result;
	}

	@RequestMapping("/exercise/{subject}")
	public String exercise(HttpServletRequest request,@PathVariable(value = "subject") String subject)
	{
		QuestionList questionList = studentManageServiceImpl.getQuestionsBySubject(subject);
		request.setAttribute("questionList",questionList);//考试题目存入请求
		return "student/jsp/Exercise";
	}

	@RequestMapping("/addStudy1Time")
	@ResponseBody
	public String addStudy1Time(String studentId,String subject,HttpServletRequest request, HttpServletResponse response) throws IOException
	{
		String result = studentManageServiceImpl.addStudy1Time(studentId,subject);
		return result;
	}

	//地址映射,path是个方法名,可以随便改动,{url}是参数
	@RequestMapping("/path/{url}")
	public String getUrl(@PathVariable(value = "url") String path){
		return "student/jsp/" +path;
	}





	//获取验证码
	@RequestMapping("/CheckCode")
	public void CheckCodeServlet(HttpServletRequest request, HttpServletResponse response) throws IOException
	{
		//内存图片对象(TYPE_INT_BGR 选择图片模式RGB模式)
		BufferedImage image = new BufferedImage(100, 35, BufferedImage.TYPE_INT_BGR);
		//得到画笔
		Graphics graphics = image.getGraphics();
		//画之前要设置颜色，设置画笔颜色
		graphics.setColor(new Color(236,255,253,255));
		//设置字体类型、字体大小、字体样式　
		graphics.setFont(new Font("黑体", Font.BOLD, 23));
		//填充矩形区域（指定要画的区域设置区）
		graphics.fillRect(0, 0, 100, 35);
		//为了防止黑客软件通过扫描软件识别验证码。要在验证码图片上加干扰线
		//给两个点连一条线graphics.drawLine();
		for (int i = 0; i < 5; i++)
		{
			//颜色也要随机（设置每条线随机颜色）
			graphics.setColor(getRandomColor());
			int x1 = random.nextInt(100);
			int y1 = random.nextInt(35);
			int x2 = random.nextInt(100);
			int y2 = random.nextInt(35);
			graphics.drawLine(x1, y1, x2, y2);
		}

		//拼接4个验证码，画到图片上
		char[] arrays = {'A','B','C','D','E','F','G','H','J','K','L','M','N','P','Q','R','S','T','W','X','Y','Z','1','2','3','4','5','6','7','8','9'};
		StringBuilder builder = new StringBuilder();
		for (int i = 0; i < 4; i++)
		{
			//设置字符的颜色

			int index = random.nextInt(arrays.length);
			builder.append(arrays[index]);
		}
		//创建session对象将生成的验证码字符串以名字为checkCode保存在session中request.getSession().setAttribute("checkCode",builder.toString());
		//将4个字符画到图片上graphics.drawString(str ,x,y);一个字符一个字符画
		request.getSession().setAttribute("vcode",builder.toString());
		for (int i = 0; i < builder.toString().length(); i++)
		{
			graphics.setColor(getRandomColor());
			char item = builder.toString().charAt(i);
			graphics.drawString(item + "", 10 + (i * 20), 25);
		}

		//输出内存图片到输出流
		ImageIO.write(image, "jpg", response.getOutputStream());
	}
	private Color getRandomColor()
	{
		int r = random.nextInt(256);
		int g = random.nextInt(256);
		int b = random.nextInt(256);
		return new Color(r, g, b);
	}
}
