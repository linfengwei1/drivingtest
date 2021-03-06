package com.great.dao;


import com.great.entity.*;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface SchoolAdminDao
{
	//登录
	public SchoolAdmin login(Map<String, String> map);

	//人脸登录
	public SchoolAdmin faceLogin(Integer a);

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

	//查询驾校信息
	public List<School> getSchoolInf(Integer id);

	//更改驾校信息
	public Integer updateSchoolInf(School school);

	//查询评价
	public List<Evaluation> getEvaluation(TableUtils u);

	//评价数
	public Integer EvaluationCount(TableUtils u);

	//查看手机号是否被注册
	public Integer CheckAdminPhone(String phone);

	//通过手机号码改密码
	public Integer changePwdByPhone(SchoolAdmin schoolAdmin);

	//查询驾校名称
	public List<School> getSchoolName();

	//查询驾校学生人数
	public List getSchoolStudents();

	//驾校申请
	public Integer SchoolApply(School school);

	//首页圆形图
	public List<School> School();

	//首页圆形图
	public Integer SchoolCountById(Integer id);

	//首页表格
	public List<School> SchoolInf(TableUtils tableUtils);

	//首页表格
	public Integer SchoolCountCoachById(Integer id);

	//首页表格
	public Integer SchoolCountCarById(Integer id);

	//首页表格驾校数
	public Integer SchoolCount();


	//首页通知公告信息显示
	public List<Notice> getNotice();


	//首页通知公告信息跳转到详情页
	public Notice jumpNwePage(Integer id);

}
