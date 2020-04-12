package com.great.dao;


import com.great.entity.Student;
import com.great.entity.TableUtils;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface SchoolStudentDao
{

	//查询学员记录并分页
	public List<Student> findStudentByPage(TableUtils u);

	//查找学员总数
	public Integer findCount(TableUtils u);

	//删除学员
	public Integer deleteStudent(Integer id);

	//更新学员信息
	public Integer updateStudent(Student coach);

	//查看账号是否被注册
	public Integer CheckStudentAccount(String account);

	//添加学员
	public Integer addStudent(Student coach);

  	//单独插入图片
	public Integer AddStudentImage(Map map);

	//查询所有学员
    public List<Student> findAllStudent(Integer schoolid);

    //excel插入数据库
    public Integer insertStudentByExcel(List<Student>list);

	//改变学员状态
	public Integer ChangeStudentState(Map map);

}
