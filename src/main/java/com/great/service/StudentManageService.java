package com.great.service;


import com.great.entity.Student;

import java.util.HashMap;

public interface StudentManageService
{

	Student login(String account, String pwd);
	//	public User findUser(String uname, String pwd);
//	public List<User> findAll(HashMap<String, Object> map) throws SQLException;
//
//	public String getMenu(String roleid, HttpServletResponse response) throws SQLException;
//
//	public UserList getUserList(String page, String limit, String uname, String pwd, HttpServletResponse response) throws SQLException;
//
//	public HashMap<String,Object>  getHasMenu(String roleid) throws SQLException;
//
//	public String changeMenu(String[] menuid, String roleid) throws Exception;
//
//	public void uploadFile(User user, String filename);
//
//	public FileList getFileList(String page, String limit, String uname, String pwd, HttpServletResponse response);
}
