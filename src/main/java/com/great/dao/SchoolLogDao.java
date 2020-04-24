package com.great.dao;



import com.great.entity.SchoolAdmin;
import com.great.entity.TableUtils;
import com.great.entity.TbLog;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface SchoolLogDao
{


	//查询日志记录并分页
	public List<TbLog> findSchoolLogByPage(TableUtils u);

	//查找日志信息总数
	public Integer findSchoolLogCount(TableUtils u);

	public Integer addLog(TbLog systemLog);

	//更新驾校管理员信息
	public Integer updateSchoolAdmin(SchoolAdmin schoolAdmin);



}
