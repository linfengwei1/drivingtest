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

	@Override
	public String checkStudyAuthority(String studentId, String vedioId, String subject)
	{
		String result = null;
		switch(Integer.parseInt(subject)){
		    case 1://查询科一学时，并且判断是否有权限观看该视频
			    HashMap<String,Integer> map = new HashMap<>();
			    map.put("studentId", Integer.parseInt(studentId));//传学员ID
			    map.put("subject", Integer.parseInt(subject));//传科目ID
			    IStudentDao iStudentDao = sqlSessionTemplate.getMapper(IStudentDao.class);//获得代理对象
			    int finishTime = iStudentDao.checkStudyAuthority(map);
			    if(finishTime == 0)
			    {
				    result = "first";
			    }else if(Integer.parseInt(vedioId) <= finishTime)
			    {

			    }
		        break;
		    case 4:
		        break;

		}
		return result;
	}
}
