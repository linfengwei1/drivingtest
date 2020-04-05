package com.great.servlet;


import com.great.dao.IUserDao;
import com.great.entity.Menu;
import com.great.entity.User;
import com.great.util.MyBatisUtils;
import com.great.util.ResponseUtils;
import org.apache.ibatis.session.SqlSession;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

@WebServlet(name = "GetUserListServlet",urlPatterns = "/GetUserListServlet")
public class LoginServlet extends HttpServlet
{

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
        doPost(request, response);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{
	    request.setCharacterEncoding("UTF-8");
        String uname = request.getParameter("uname");
        String pwd = request.getParameter("pwd");
        HashMap<String,String> map = new HashMap<>();
        map.put("uname",uname);
        map.put("pwd", pwd);
        SqlSession sqlSession = MyBatisUtils.getSession();
        IUserDao userDao = sqlSession.getMapper(IUserDao.class);//获得代理对象
        User user = userDao.login(map);
        sqlSession.close();
        if(user != null){

            SqlSession sqlSession1 = MyBatisUtils.getSession();
            IUserDao userDao1 = sqlSession1.getMapper(IUserDao.class);//获得代理对象

            HashMap<String, List<Menu>> menuMap = new HashMap<String, List<Menu>>();
            List<Menu> menuList = null;//找出该角色的一级菜单
            try
            {
                menuList = userDao1.findMenuByPid(user.getRoleid());//找出该角色的一级菜单
                for (int i = 0;i<menuList.size();i++)
                {
                    HashMap<String, Integer> map1= new HashMap<String, Integer>();
                    Menu menu = menuList.get(i);
                    map1.put("id", menu.getId());
                    map1.put("roleid", user.getRoleid());
                    List<Menu> menuList2 = userDao1.getMenuById(map1);//找出该角色的二级菜单
                    menuMap.put(menu.getName(),menuList2);
                }
            } catch (SQLException e)
            {
                e.printStackTrace();
            }


            sqlSession1.close();


            HttpSession hs=request.getSession();
            hs.setAttribute("user",user);
            hs.setAttribute("menumap",menuMap);
            request.getRequestDispatcher("front/jsp/UserMain.jsp").forward(request, response);
        }else{
            ResponseUtils.outHtml(response,"登录失败");
        }
    }
}
