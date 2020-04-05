package com.great.servlet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.OutputStream;
import java.util.Random;

@WebServlet(name = "CheckCodeServlet",urlPatterns ="/CheckCodeServlet" )

public class CheckCodeServlet extends HttpServlet
{

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*	一、绘图
		 */
		//1画布
		BufferedImage image = new BufferedImage(90, 30, BufferedImage.TYPE_INT_RGB);
		//2获得画笔
		Graphics g = image.getGraphics();
		//3给画笔设置颜色
		g.setColor(new Color(255,255,255));
		//4给画布设置背景颜色
		g.fillRect(0, 0, 90, 30);
		g.setFont(new Font(null, Font.ITALIC, 24));

		//5重试给画笔设置颜色
		Random r = new Random();
		g.setColor(new Color(r.nextInt(255), r.nextInt(255), r.nextInt(255)));

		//6生成一个随机数,介于[0,99999)之间
		//		String number = r.nextInt(99999)+"";

		//生成一个长度为5的验证码，在A~Z,2~9之间,去掉I和O
		String number = getNumber();

		//画图
		g.drawString(number, 2, 25);
		//画干扰线
		for (int i = 0; i < 8; i++) {
			g.setColor(new Color(r.nextInt(255), r.nextInt(255), r.nextInt(255)));
			g.drawLine(r.nextInt(90), r.nextInt(30), r.nextInt(90), r.nextInt(30));
		}
		/*
		 * 二 、压缩图片，输出
		 * */
		response.setContentType("image/jpg");
		//获得字节输出流。之前用的out 是字符流不可以用了(管道)
		OutputStream ops = response.getOutputStream();
		//压缩图片并输出，算法有现成的方法可用
		//imagoio中有一个类
		javax.imageio.ImageIO.write(image, "jpeg", ops);
		//关闭管道
		ops.close();

	}
	private  String  getNumber() {
		String number = "";
		String chars = "ABCDEFGHGKLMNPQRSTUVWXYZ23456789";
		Random r = new Random();
		for (int i = 0; i < 5; i++) {
			number += chars.charAt(r.nextInt(chars.length()));
		}
		return number;
	}



}
