package com.great.service.serviceimpl;

import com.great.aoplog.SystemLog;
import com.great.dao.IUserDao;
import com.great.service.SystemLogService;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class SystemLogServiceImpl implements SystemLogService
{

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	@Override
	public void insertLog(SystemLog systemLog)
	{
		IUserDao userDao = sqlSessionTemplate.getMapper(IUserDao.class);//获得代理对象
		userDao.insertLog(systemLog);
	}
}
