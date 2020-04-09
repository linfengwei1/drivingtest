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
	@Log(operationType = "普通操作", operationName = "学员观看视频")
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
			    if(finishTime == 0)//学员没看过视频
			    {
			    	if(Integer.parseInt(vedioId)==1)//学员选择看视频1
				    {
					    result = "first";//表示第一次看
				    }else
				    {
					    result = "error";//表示没有权限看视频
				    }
			    }else if(finishTime == 1)//学员只看过视频1
			    {
				    if(Integer.parseInt(vedioId)==1)//学员选择看视频0
				    {
					    result = "free";//表示可以自由看，不记录学时
				    }else if(Integer.parseInt(vedioId)==2)//学员选择看视频2
				    {
					    result = "first";//表示第一次看
				    }else
			        {
				        result = "error";//表示没有权限看视频
				    }
			    }else if(finishTime == 2)//学员只看过视频2
			    {
				    if(Integer.parseInt(vedioId)==1)//学员选择看视频0
				    {
					    result = "free";//表示可以自由看，不记录学时
				    }else if(Integer.parseInt(vedioId)==2)//学员选择看视频2
				    {
					    result = "free";//表示可以自由看，不记录学时
				    }else
				    {
					    result = "first";//表示第一次看
				    }
			    }else if(finishTime == 3)//学员只看过视频3
			    {
				    result = "free";
			    }
		        break;
		    case 4:
		        break;

		}
		return result;
	}

	@Override
	@Transactional
	@Log(operationType = "普通操作", operationName = "学员科目1增加学时")
	public String addStudy1Time(String studentId, String subject)
	{
		IStudentDao iStudentDao = sqlSessionTemplate.getMapper(IStudentDao.class);//获得代理对象
		int i = iStudentDao.addStudy1Time(Integer.parseInt(studentId),Integer.parseInt(subject));
		if(i>0)
		{
			return "success";

		}else {
			return "error";
		}
	}
}
