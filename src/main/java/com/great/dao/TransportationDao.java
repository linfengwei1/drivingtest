package com.great.dao;

import com.great.entity.*;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * ClassName: TransportationDao <br/>
 * Description: <br/>
 * date: 2020/4/8 10:14<br/>
 *
 * @author lenovo<br />
 * @since JDK 1.8
 */
@Mapper
public interface TransportationDao {

    /**
     * 登录
     * @param map
     * @return
     */
    public Transportation login(Map<String, String> map);

    /**
     * 获取科目一题数
     * @param map
     * @return
     */
    public Integer getOneSubjectCount(Map<String, Object> map);

    /**
     * 获取科目一题表
     * @param map
     * @return
     */
    public List<?> getOneSubject(Map<String, Object> map);

    /**
     * 获取科目四题数
     * @param map
     * @return
     */
    public Integer getFourthSubjectCount(Map<String, Object> map);

    /**
     * 获取科目四题表
     * @param map
     * @return
     */
    public List<?> getFourthSubject(Map<String, Object> map);

    /**
     * 获取科目一题目信息
     * @param id
     * @return
     */
    public Subject getOneSubjectMsg(Integer id);

    /**
     * 获取科目四题目信息
     * @param id
     * @return
     */
    public Subject getFourthSubjectMsg(Integer id);

    /**
     * 删除科目一题目
     * @param id
     * @return
     */
    public Integer deleteOneSubjectMsg(Integer id);

    /**
     * 删除科目四题目
     * @param id
     * @return
     */
    public Integer deleteFourthSubjectMsg(Integer id);

    /**
     * 更新科目一题目
     * @param subject
     * @return
     */
    public Integer updateOneSubjectMsg(Subject subject);

    /**
     * 更新科目四题目
     * @param subject
     * @return
     */
    public Integer updateFourthSubjectMsg(Subject subject);

    /**
     * 获取学员信息条数
     * @param map
     * @return
     */
    public Integer getStudentCount(Map<String, Object> map);


    /**
     * 获取学员信息
     * @param map
     * @return
     */
    public List<?> getStudentTbl(Map<String, Object> map);

    /**
     * 获取学校列表
     * @return
     */
    public List<School> getSchoolList();


    /**
     * 获取学生状态列表
     * @return
     */
    public List<String> getStudentState();

    /**
     * 获取学校条数
     * @param map
     * @return
     */
    public Integer getSchoolCount(Map<String, Object> map);

    /**
     * 获取学校列表
     * @param map
     * @return
     */
    public List<?> getSchoolTbl(Map<String, Object> map);

    /**
     * 获取学校状态
     * @return
     */
    public List<String> getSchoolState();

    /**
     * 获取教练状态
     * @return
     */
    public List<String> getCoachState();

    /**
     * 获取教练记录数
     * @param map
     * @return
     */
    public Integer getCoachCount(Map<String, Object> map);

    /**
     * 获取教练表
     * @param map
     * @return
     */
    public List<?> getCoachTbl(Map<String, Object> map);

    /**
     * 获取学员信息
     * @param id
     * @return
     */
    public Student getStudentMsg(Integer id);

    /**
     * 获取学学校信息
     * @param id
     * @return
     */
    public School getSchoolMsg(Integer id);

    /**
     * 获取教练信息
     * @param id
     * @return
     */
    public Coach getCoachMsg(Integer id);

    /**
     * 根据学校id获取学生数量
     * @param id
     * @return
     */
    public Integer getStudentCountBySchoolId(Integer id);

    /**
     * 根据学校id获取教练数量
     * @param id
     * @return
     */
    public Integer getCoachCountBySchoolId(Integer id);

    /**
     * 根据学校id获取教练车数量
     * @param id
     * @return
     */
    public Integer getCoachCarCountBySchoolId(Integer id);

    /**
     * 获取教练车数量
     * @param tableUtils
     * @return
     */
    public Integer getCoachCarCount(TableUtils tableUtils);

    /**
     * 获取教练车列表
     * @param map
     * @return
     */
    public List<?> getCoachCarTbl(Map<String, Object> map);

    /**
     * 修改学员审核

     */
    public void examineStudent(Map<String, Object> map);

    /**
     * 修改学校审核

     */
    public void examineSchool(Map<String, Object> map);

    /**
     * 修改教练审核
     *
     */
    public void examineCoach(Map<String, Object> map);

    /**
     * 修改教练车审核
     *
     */
    public void examineCoachCar(Map<String, Object> map);

    /**
     * 获取公告数
     * @param map
     * @return
     */
    public Integer getNoticeCount(Map<String, Object> map);


    /**
     * 获取公告表
     * @param map
     * @return
     */
    public List<Notice> getNotice(Map<String, Object> map);

    /**
     * 获取公告类型
     * @return
     */
    public List<?> getNoticeType();

    /**
     * 删除通告
     * @param id
     * @return
     */
    public Integer deleteNotice(Integer id);

    /**
     * 更新通告
     * @param notice
     * @return
     */
    public Integer updateNoticeMsg(Notice notice);


    /**
     * 获取通告信息
     * @param id
     * @return
     */
    public Notice getNoticeMsg(Integer id);

    /**
     * 新增公告数
     * @param notice
     * @return
     */
    public Integer insertNotice(Notice notice);

    /**
     * 或考试时间
     * @return
     */
    public List<TestTime> getExamTime();

    /**
     * 获取时间区间
     * @param sid
     * @return
     */
    public List<TestTime> getExamTimeBySchoolId(String sid);

    /**
     * 更新时间
     */
    public void updateExamTime(Map<String, Object> map1);

    /**
     * 插入时间
     */
    public void insertExamTime(Map<String, Object> map1);

    /**
     * 删除时间配置
     * @param tid
     * @return
     */
    public Integer deleteExamTime(Integer tid);

    /**
     * 统计一阶段人数
     * @return
     */
    public Integer CountSubject1();

    /**
     * 统计2阶段人数
     */
    public Integer CountSubject2();

    /**
     * 统计3阶段人数
     */
    public Integer CountSubject3();

    /**
     *  统计4阶段人数
     */
    public Integer CountSubject4();

    /**
     * 统计毕业人数
     */
    public Integer CountOver();

    /**
     * 禁止学校
     * @param map
     */
    public void stopApplySchool(Map<String, Object> map);

    /**
     * 禁止记录
     * @param map
     */
    public void recordApply(Map<String, Object> map);

    /**
     *  封停学校
     * @param map
     */
    public void stopDoingSchool(Map<String, Object> map);

    /**
     * 封停教练
     * @param id
     */
    public void stopDoingCoach(Integer id);

    /**
     * 封停记录
     * @param map
     */
    public void recordDoing(Map<String, Object> map);

    /**
     * 解禁驾校
     * @param map
     */
    public void relieveApplySchool(Map<String, Integer> map);

    /**
     * 解封驾校
     * @param map
     */
    public void relieveDoingSchool(Map<String, Integer> map);

    /**
     * 解封教练
     * @param id
     */
    public void relieveDoingCoach(Integer id);

    /**
     * 获取教练通过学校id
     * @param id
     */
    public List<Coach> getCoachBySchoolId(Integer id);

    /**
     * 获取违规条数
     * @param map
     * @return
     */
    public Integer getPunishTabCount(Map<String, Object> map);

    /**
     * 获取违规列表
     * @param map
     * @return
     */
    public List<?> getPunishTable(Map<String, Object> map);

    /**
     * 删除违规记录
     * @param id
     */
    public void deletePunish(Integer id);

    /**
     * 获取预约记录条数
     * @param map
     * @return
     */
    public Integer getAppointCount(Map<String, Object> map);

    /**
     * 获取预约表
     * @param map
     * @return
     */
    public List<?> getAppointTbl(Map<String, Object> map);

    /**
     * 批准考试
     * @param map
     */
    public void auditAppoint(Map<String, Object> map);

    /**
     *
     * @param id
     * @return
     */
    public School getSchoolUrl(Integer id);


    /**
     *判断是否已经预约改为0
     * @param id
     * @return
     */
    public Integer AppointNo(Integer id);

    /**
     *把学员状态改成考试中的状态
     * @param
     * @return
     */
    public Integer AppointYes(Map<String, Object> map);

    /**
     * 插入考试分数到分数表
     * @param list
     */
    public int insertScoreByExcel(@Param("list")List<TestScore> list);
}
