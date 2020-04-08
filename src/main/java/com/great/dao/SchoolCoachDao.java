package com.great.dao;


import com.great.entity.Coach;
import com.great.entity.SchoolAdmin;
import com.great.entity.TableUtils;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface SchoolCoachDao
{
//	//登录
////	public SchoolAdmin login(Map<String, String> map);

	//查询教练记录并分页
	public List<Coach> findCoachByPage(TableUtils u);

	//查找教练信息总数
	public Integer findCoachCount(TableUtils u);

	//删除驾校管理员
	public Integer deleteCount(Integer id);

	//更新驾校管理员信息
	public Integer updateCoach(Coach coach);

	//查看账号是否被注册
	public Integer CheckCoachAccount(String account);

	//添加驾校管理员
	public Integer addCoach(Coach coach);

    //查询所有教练
    public List<Coach> findAllCoach(Integer schoolid);
}
