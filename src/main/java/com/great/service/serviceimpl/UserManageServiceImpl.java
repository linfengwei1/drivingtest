package com.great.service.serviceimpl;


import com.google.gson.Gson;
import com.great.aoplog.Log;
import com.great.dao.IUserDao;
import com.great.entity.*;
import com.great.service.UserManageService;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import javax.servlet.http.HttpServletResponse;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;

@Service("userManageServiceImpl")
@Transactional
public class UserManageServiceImpl implements UserManageService
{

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	@Override
	@Log(operationType = "查询操作", operationName = "查询用户数量")
	public int findcount(HashMap<String, Object> map)
	{

		int count = 0;
		IUserDao userDao = sqlSessionTemplate.getMapper(IUserDao.class);//获得代理对象
		count = userDao.findCount(map);
		return count;
	}
	@Override
	@Log(operationType = "查询操作", operationName = "查询用户")
	public List<User> findAll(HashMap<String, Object> map) throws SQLException
	{
		IUserDao userDao = sqlSessionTemplate.getMapper(IUserDao.class);//获得代理对象
		List<User> list = userDao.findAll(map);
		return list;
	}
	@Override
	@Log(operationType = "登录操作", operationName = "查询用户")
	public User findUser(String uname, String pwd)
	{
		HashMap<String,String> map = new HashMap<>();
		map.put("uname", uname);
		map.put("pwd", pwd);
		IUserDao userDao = sqlSessionTemplate.getMapper(IUserDao.class);//获得代理对象
		User user = userDao.login(map);
		return user;
	}


	@Override
	@Log(operationType = "登录操作", operationName = "获取菜单")
	public String getMenu(String roleid, HttpServletResponse response) throws SQLException
	{
		IUserDao userDao = sqlSessionTemplate.getMapper(IUserDao.class);//获得代理对象
		List<TreeData> list1 = userDao.findAllMenu();//所有的菜单
		List<TreeData> list2 = userDao.findAllRecursion(Integer.parseInt(roleid));//已经选择的菜单

		HashMap<String,Object> map = new HashMap<>();
		map.put("menulist",list1);//所有的菜单
		map.put("hasmenu",list2);//已经选择的菜单
		Gson gson = new Gson();
		String data = gson.toJson(map);
		return data;

	}

	@Override
	@Log(operationType = "查询操作", operationName = "查询用户信息列表")
	public UserList getUserList(String page, String limit, String uname, String pwd, HttpServletResponse response) throws SQLException
	{
		int beg = (Integer.parseInt(page)-1)*Integer.parseInt(limit);
		int end = Integer.parseInt(limit);
		HashMap<String,Object> map = new HashMap<>();
		map.put("beg",beg);
		map.put("end",end);
		map.put("uname",uname);
		map.put("pwd",pwd);
		IUserDao userDao = sqlSessionTemplate.getMapper(IUserDao.class);//获得代理对象
		List<User> list = userDao.findAll(map);
		int count = userDao.findCount(map);
		UserList userList = new UserList();
		userList.setData(list);
		userList.setMsg("");
		userList.setCode(0);
		userList.setCount(count);
		return userList;
	}

	@Override
	@Log(operationType = "修改操作", operationName = "修改用户权限")
	public HashMap<String, Object> getHasMenu(String roleid) throws SQLException
	{
		HashMap<String,Object> map = new HashMap<>();
		IUserDao userDao = sqlSessionTemplate.getMapper(IUserDao.class);//获得代理对象
		List<TreeData> list1 = userDao.findAllMenu();//所有的菜单
		List<TreeData> list2 = userDao.findAllRecursion(Integer.parseInt(roleid));//已经选择的菜单
		map.put("menulist",list1);//所有的菜单
		map.put("hasmenu",list2);//已经选择的菜单
		return map;
	}

	@Override
	@Transactional
	@Log(operationType = "修改操作", operationName = "修改用户权限")
	public String changeMenu(String[] menuid, String roleid)
	{
		String result = null;

		IUserDao userDao = sqlSessionTemplate.getMapper(IUserDao.class);//获得代理对象
		userDao.deleteMenuByRoleid(Integer.parseInt(roleid));//删除角色所有菜单
		int i = 5/0;
		for (String s : menuid)
		{
			HashMap<String, Integer> map = new HashMap<>();
			map.put("roleid", Integer.parseInt(roleid));
			map.put("menuid", Integer.parseInt(s));
			userDao.insertMenuByRoleId(map);//插入角色修改后的菜单
		}
		result = "success";

		return result;
	}

	@Override
	@Log(operationType = "文件上传", operationName = "用户文件上传")
	@Transactional(propagation= Propagation.REQUIRED,readOnly=false)
	public void uploadFile(User user, String filename)
	{
		IUserDao userDao = sqlSessionTemplate.getMapper(IUserDao.class);
		File f = new File();
		f.setFileName(filename);
		f.setUname(user.getUname());
		f.setStyleId(2);
		f.setTimes(0);
		f.setUid(user.getUid());
		f.setUploadTime(new Timestamp(System.currentTimeMillis()));
		userDao.uploadFile(f);
	}

	@Override
	@Log(operationType = "查询操作", operationName = "查询文档信息")
	public FileList getFileList(String page, String limit, String uname, String pwd, HttpServletResponse response)
	{
		int beg = (Integer.parseInt(page)-1)*Integer.parseInt(limit);
		int end = Integer.parseInt(limit);
		HashMap<String,Object> map = new HashMap<>();
		map.put("beg",beg);
		map.put("end",end);
		map.put("uname",uname);
		map.put("pwd",pwd);
		IUserDao userDao = sqlSessionTemplate.getMapper(IUserDao.class);//获得代理对象
		List<File> list = userDao.findAllFile(map);
		int count = userDao.findFileCount(map);
		FileList fileList = new FileList();
		fileList.setData(list);
		fileList.setMsg("");
		fileList.setCode(0);
		fileList.setCount(count);
		return fileList;
	}


}
