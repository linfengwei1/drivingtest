package com.great.service;


import com.great.entity.FileList;
import com.great.entity.User;
import com.great.entity.UserList;

import javax.servlet.http.HttpServletResponse;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

public interface UserManageService
{
	public int findcount(HashMap<String, Object> map);
	public User findUser(String uname, String pwd);
	public List<User> findAll(HashMap<String, Object> map) throws SQLException;

	public String getMenu(String roleid, HttpServletResponse response) throws SQLException;

	public UserList getUserList(String page, String limit, String uname, String pwd, HttpServletResponse response) throws SQLException;

	public HashMap<String,Object>  getHasMenu(String roleid) throws SQLException;

	public String changeMenu(String[] menuid, String roleid) throws Exception;

	public void uploadFile(User user, String filename);

	public FileList getFileList(String page, String limit, String uname, String pwd, HttpServletResponse response);
}
