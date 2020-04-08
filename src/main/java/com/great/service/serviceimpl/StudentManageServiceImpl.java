package com.great.service.serviceimpl;


import com.great.aoplog.Log;
import com.great.dao.IStudentDao;
import com.great.entity.Student;
import com.great.service.StudentManageService;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
@Service("studentManageServiceImpl")
@Transactional
public class StudentManageServiceImpl implements StudentManageService
{

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;


	@Override
	@Log(operationType = "登录操作", operationName = "学员登录")
	public Student login(String account, String pwd)
	{
		Student student = null;
		HashMap<String,String> map = new HashMap<>();
		map.put("account", account);
		map.put("pwd", pwd);
		IStudentDao iStudentDao = sqlSessionTemplate.getMapper(IStudentDao.class);//获得代理对象
		student = iStudentDao.login(map);
		return student;
	}
}
