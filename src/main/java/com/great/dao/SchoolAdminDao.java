package com.great.dao;


import com.great.entity.SchoolAdmin;
import com.great.entity.TableUtils;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface SchoolAdminDao
{
	//登录
	public SchoolAdmin login(Map<String, String> map);

	//查询驾校管理员记录并分页
	public List<SchoolAdmin> findSchoolAdminByPage(TableUtils u);

	//查找当前用户信息总数
	public Integer findSchoolAdminCount(TableUtils u);

	//删除驾校管理员
	public Integer deleteSchoolAdmin(Integer id);

	//更新驾校管理员信息
	public Integer updateSchoolAdmin(SchoolAdmin schoolAdmin);

	//查看账号是否被注册
	public Integer CheckAccount(String account);

	//添加驾校管理员
	public Integer addSchoolAdmin(SchoolAdmin schoolAdmin);
}
