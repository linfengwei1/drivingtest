package com.great.controller;


import com.google.gson.Gson;
import com.great.entity.Student;
import com.great.service.StudentManageService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
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
	public String login(String account, String pwd, HttpServletRequest request, HttpServletResponse response)
	{
		Student student = studentManageServiceImpl.login(account,pwd);
		HttpSession hs=request.getSession();
		hs.setAttribute("student",student);
		System.out.println(student);
		return null;
	}
	@RequestMapping("/loginPage")
	public String loginPage()
	{
		return "student/jsp/StudentLogin";

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
