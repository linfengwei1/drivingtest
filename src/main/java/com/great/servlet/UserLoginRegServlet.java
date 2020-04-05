package com.great.servlet;


import com.google.gson.Gson;
import com.great.dao.IUserDao;
import com.great.entity.TreeData;
import com.great.util.MyBatisUtils;
import org.apache.ibatis.session.SqlSession;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

@WebServlet(name = "UserLoginRegServlet",urlPatterns = "/UserLoginRegServlet")
public class UserLoginRegServlet extends BaseServlet
{

	public String regPage(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException
	{
		String path = "front/jsp/UserReg.jsp";
		return path;
	}
	public void reg(HttpServletRequest request, HttpServletResponse response) throws IOException, SQLException
	{
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String uname =  request.getParameter("uname");
		String pwd =  request.getParameter("pwd");

		HashMap<String,String> map = new HashMap<>();
		map.put("uname",uname);
		map.put("pwd", pwd);
		SqlSession sqlSession = MyBatisUtils.getSession();
		IUserDao userDao = sqlSession.getMapper(IUserDao.class);//获得代理对象
		int i = userDao.addUser(map);
		sqlSession.commit();
		sqlSession.close();
		if(i>0)
		{
			response.getWriter().write("success");
		}else
		{
			response.getWriter().write("error");
		}

	}
	public void getMenu(HttpServletRequest request, HttpServletResponse response) throws IOException, SQLException
	{
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String roleid =  request.getParameter("roleid");

		SqlSession sqlSession = MyBatisUtils.getSession();
		IUserDao userDao = sqlSession.getMapper(IUserDao.class);//获得代理对象
		List<TreeData> list1 = userDao.findAllMenu();//所有的菜单
		List<TreeData> list2 = userDao.findAllRecursion(Integer.parseInt(roleid));//已经选择的菜单
		sqlSession.close();
		if(list1 != null)
		{
			HashMap<String,Object> map = new HashMap<>();
			map.put("menulist",list1);//所有的菜单
			map.put("hasmenu",list2);//已经选择的菜单
			Gson gson = new Gson();
			String data = gson.toJson(map);
			response.setCharacterEncoding("UTF-8");
			response.getWriter().write(data);
		}else
		{
			response.getWriter().write("error");
		}

	}
	public void getHasMenu(HttpServletRequest request, HttpServletResponse response) throws IOException, SQLException
	{
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String roleid =  request.getParameter("roleid");

		SqlSession sqlSession = MyBatisUtils.getSession();
		IUserDao userDao = sqlSession.getMapper(IUserDao.class);//获得代理对象
		List<TreeData> list = userDao.findAllRecursion(Integer.parseInt(roleid));
		sqlSession.commit();
		sqlSession.close();
		if(list != null)
		{
			Gson gson = new Gson();
			String data = gson.toJson(list);

			response.getWriter().write(data);
		}else
		{
			response.getWriter().write("error");
		}

	}
	public void saveMenu(HttpServletRequest request, HttpServletResponse response) throws IOException, SQLException
	{
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String[] menuid =  request.getParameterValues("menuid[]");
		String roleid =  request.getParameter("roleid");


		SqlSession sqlSession = MyBatisUtils.getSession();
		IUserDao userDao = sqlSession.getMapper(IUserDao.class);//获得代理对象
	    userDao.deleteMenuByRoleid(Integer.parseInt(roleid));
		sqlSession.commit();
		for (String s : menuid)
		{
			HashMap<String,Integer> map = new HashMap<>();
			map.put("roleid", Integer.parseInt(roleid));
			map.put("menuid", Integer.parseInt(s));

			userDao.insertMenuByRoleId(map);

		}
		sqlSession.commit();

		sqlSession.close();

		response.getWriter().write("success");


	}




}
