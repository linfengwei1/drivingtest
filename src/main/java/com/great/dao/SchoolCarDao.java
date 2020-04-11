package com.great.dao;


import com.great.entity.Coach;
import com.great.entity.CoachCar;
import com.great.entity.Student;
import com.great.entity.TableUtils;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface SchoolCarDao
{

	//查询车辆记录并分页
	public List<CoachCar> getCar(TableUtils u);

	//查找车辆总数
	public Integer findCount(TableUtils u);

	//删除学员
	public Integer deleteStudent(Integer id);

	//车辆人员变更
	public Integer updateCar(CoachCar coachCar);

	//查看账号是否被注册
	public Integer CheckStudentAccount(String account);

	//添加学员
	public Integer addStudent(Student coach);

    //查询驾校的所有教练
    public List<Coach> findCoach(Integer cid);

    //excel插入数据库
    public Integer insertStudentByExcel(List<Student> list);

}
