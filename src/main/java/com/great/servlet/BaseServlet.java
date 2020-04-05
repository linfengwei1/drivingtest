package com.great.servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;

@WebServlet(name = "BaseServlet")
public class BaseServlet extends HttpServlet
{
	public BaseServlet()
	{
	}

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
	{
		//请求内部设置的键值对
		String methodName = req.getParameter("method");
		System.out.println(methodName);
		//获取当前对象字节码对象
		Class clazz = this.getClass();
		System.out.println(clazz.getName());
		if(methodName != null && !"".equals(methodName.trim()))
		{
			try
			{
				//获取方法对象
				Method method = clazz.getMethod(methodName, HttpServletRequest.class, HttpServletResponse.class);
				if(method != null)
				{
					String path = (String)method.invoke(this, req, resp);
					if(path != null)
					{
						req.getRequestDispatcher(path).forward(req, resp);
					}

				}
			} catch (NoSuchMethodException e)
			{
				e.printStackTrace();
			} catch (IllegalAccessException e)
			{
				e.printStackTrace();
			} catch (InvocationTargetException e)
			{
				e.printStackTrace();
			} {

			}
		}

	}
}
