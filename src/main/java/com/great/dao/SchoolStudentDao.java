package com.great.dao;


import com.great.entity.AppointTest;
import com.great.entity.Student;
import com.great.entity.StudyCondition;
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

	//删除学员对应的学时信息
	public Integer deleteStudentStudycondition(Integer id);


	//更新学员信息
	public Integer updateStudent(Student coach);

	//查看账号是否被注册
	public Integer CheckStudentAccount(String account);

	//添加学员
	public Integer addStudent(Student coach);

	//添加学员学时表

	public Integer addStudyCondition(List<StudyCondition> list);



  	//单独插入图片
	public Integer AddStudentImage(Map map);

	//查询所有学员
    public List<Student> findAllStudent(Integer schoolid);

    //excel插入数据库

    public Integer insertStudentByExcel(List<Student> list);


	//判断excel插入的账号是否被注册
	public String CheckAccount(String account);

	//改变学员状态
	public Integer ChangeStudentState(Map map);

	//查找学员学习时间
	public List<StudyCondition> findStudyTime(Integer a);

	//统计一阶段人数
	public Integer CountSubject1(Integer a);

	//统计2阶段人数
	public Integer CountSubject2(Integer a);

	//统计3阶段人数
	public Integer CountSubject3(Integer a);

	//统计4阶段人数
	public Integer CountSubject4(Integer a);

	//统计毕业人数
	public Integer CountOver(Integer a);



	/**
	 * 单个批准考试或驳回
	 * @param map
	 */
	public void auditAppoint(Map<String, Object> map);



	//批量审核通过学员预约
	public Integer changeAppointState(List list);


	//批量驳回过学员预约
	public Integer batchRejected(List list);

//	//批量驳回学员预约后，根据不同的科目改成不同的申请考试状态
	public Integer AppointNo(Map<String, Object> map);

	/**
	 *当驳回的时候，根据不同科目改成不同科目的申请状态
	 * @param
	 * @return
	 */
	public Integer AppointNoByOne(Map<String, Object> map);


	//获取预约条数
	public Integer getAppointCount(TableUtils u);

	//查询学员记录并分页
	public List<AppointTest> getAppointTbl(TableUtils u);

}
