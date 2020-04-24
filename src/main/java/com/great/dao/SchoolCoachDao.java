package com.great.dao;

import com.great.entity.*;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

@Mapper
public interface SchoolCoachDao
{

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

	//单独插入图片
	public Integer AddCoachImage(Map map);

	//插入图片改变状态
	public Integer ChangeCoachState(Map map);

	//查询教练违规记录并分页
	public List<Punish> getPunish(TableUtils u);

	//查询教练违规信息总数
	public Integer findPunishCount(TableUtils u);

	//添加处罚记录
	public Integer AddPunish(Punish punish);

	//删除处罚记录
	public Integer deletePunish(Integer punish);

	//处罚记录改变状态
	public Integer updatePunish(Integer id);

	//处罚记录改变状态
	public Integer coachStateByStop(Integer id);

	//处罚记录改变状态
	public Integer coachStateByNo(Integer id);

	//excel插入数据库
	public Integer insertCoachByExcel(List<Coach> list);



	/**
	 * 修改教练密码 2020-4-9 16：46 王良德
	 * @param coach 教练信息
	 * @return 修改密码是否成功
	 */
	Integer changeCoachpwd(Coach coach);

	/**教练登录 2020-4-10 9：49 王良德
	 * 教练登录
	 * @return 登录是否成功
	 */
	Coach login(Map<String, String> map);

	//查询学员记录并分页
	public List<StudentTable> findStudentByPage(TableUtils tableUtils);

	//查找学员总数
	public Integer findCount(TableUtils tableUtils);

	//查询驾校教练人数
	public List getSchoolCoach();
	//查询学生分数
	List<Score> findStudentScore(TableUtils tableUtils);

	List<StudentTable> newFindstudentBypage(TableUtils tableUtils);

	//查询学生学时
    List<StudyCondition> findStudentTime(TableUtils tableUtils);

    //查询学生评论
	List<EvaluationToCoach> findStudentEvaluation(TableUtils tableUtils);

	//查询学生评论页数
	Integer findStudentEvaluationByCount(TableUtils tableUtils);

	List<Student> getStudentBySubject(@Param("subject") int subject, @Param("coachId") Integer coachId);
	int getOrderTimeBySchool(@Param("time") String time, @Param("schoolId") Integer schoolId);
	int checkHasOrder(@Param("subject") Integer subject, @Param("date") String date);

	List<Integer> getOrderTimeId(@Param("subject") Integer subject, @Param("date") String date);

	void addOrderRecord(@Param("timeId") Integer timeId, @Param("list") List<Integer> studentIds);

	int addOrderTimeId(OrderTime orderTime);
	int updateOrderStatus(@Param("list") List<Integer> studentIds);
}
