package com.great.service.serviceimpl;

import com.great.aoplog.SystemLog;
import com.great.dao.IStudentDao;
import com.great.service.SystemLogService;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class SystemLogServiceImpl implements SystemLogService
{

	@Resource
	private IStudentDao studentDao;
	@Override
	public void insertLog(SystemLog systemLog)
	{
		studentDao.insertLog(systemLog);
	}
}
