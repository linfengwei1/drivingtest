package com.great.servlet;


import com.great.dao.IUserDao;
import com.great.entity.User;
import com.great.entity.UserList;
import com.great.service.UserManageService;
import com.great.util.MyBatisUtils;
import com.great.util.ResponseUtils;
import org.apache.ibatis.session.SqlSession;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

@WebServlet(name = "GetUserListServlet",urlPatterns = "/GetUserListServlet")
public class GetUserListServlet extends BaseServlet
{
	ApplicationContext ac = new ClassPathXmlApplicationContext(
			"springmvc.xml");

	UserManageService userManageService = (UserManageService) ac.getBean("userManageServiceImpl");

	public String getUserList(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException
	{
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		String page = request.getParameter("page");
		String limit = request.getParameter("limit");
		String uname = request.getParameter("uname");
		String pwd = request.getParameter("pwd");
		int beg = (Integer.parseInt(page)-1)*Integer.parseInt(limit);
		int end = Integer.parseInt(limit);
		HashMap<String,Object> map = new HashMap<>();
		map.put("beg",beg);
		map.put("end",end);
		map.put("uname",uname);
		map.put("pwd",pwd);
		List<User> list = userManageService.findAll(map);
		int count = userManageService.findcount(map);
		UserList userList = new UserList();
		userList.setData(list);
		userList.setMsg("");
		userList.setCode(0);
		userList.setCount(count);
		ResponseUtils.outJson(response, userList);
		return null;
	}
	public void update(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException
	{
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		String uname = request.getParameter("uname");
		String pwd = request.getParameter("pwd");
		String id = request.getParameter("id");
		System.out.println(uname);
		HashMap<String,Object> map = new HashMap<>();
		map.put("uname",uname);
		map.put("pwd", pwd);
		map.put("uid", Integer.parseInt(id));


		SqlSession sqlSession = MyBatisUtils.getSession();
		IUserDao userDao = sqlSession.getMapper(IUserDao.class);//获得代理对象
		int i = userDao.updateUser(map);
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
	public void delUser(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException
	{
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		String id = request.getParameter("id");
		System.out.println(id);


		SqlSession sqlSession = MyBatisUtils.getSession();
		IUserDao userDao = sqlSession.getMapper(IUserDao.class);//获得代理对象
		int i = userDao.delUser(Integer.parseInt(id));
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

}
