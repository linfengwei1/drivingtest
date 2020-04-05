package com.great.dao;


import com.great.aoplog.SystemLog;
import com.great.entity.File;
import com.great.entity.Menu;
import com.great.entity.TreeData;
import com.great.entity.User;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

public interface IUserDao {


    public List<User> findAll(HashMap<String, Object> map) throws SQLException;
    public List<Menu> findMenuByPid(int roleid) throws  SQLException;
    public List<Menu> getMenuById(HashMap<String, Integer> map1) throws  SQLException;
    public List<TreeData> findAllRecursion(Integer roleid) throws  SQLException;
    public List<TreeData> findAllMenu() throws  SQLException;
    public void addUser(User user) throws  SQLException;
    public int updateUser(HashMap<String, Object> map) throws  SQLException;
    User login(HashMap<String, String> map);
	int findCount(HashMap<String, Object> map);
	int addUser(HashMap<String, String> map);
	int delUser(int uid);
	void deleteMenuByRoleid(int parseInt);
	void insertMenuByRoleId(HashMap<String, Integer> map);
	void insertLog(SystemLog systemLog);


	void uploadFile(File file);

	List<File> findAllFile(HashMap<String, Object> map);

	int findFileCount(HashMap<String, Object> map);
}
