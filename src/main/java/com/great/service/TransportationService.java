package com.great.service;

import com.alibaba.druid.util.StringUtils;
import com.great.entity.*;

import javax.print.attribute.IntegerSyntax;
import java.util.List;
import java.util.Map;


/**
 * ClassName: TransportationService <br/>
 * Description: <br/>
 * date: 2020/4/8 10:35<br/>
 *
 * @author lenovo<br />
 * @since JDK 1.8
 */
public interface TransportationService {

    /**
     * 验证运管登陆
     * @param account
     * @param pwd
     * @return
     */
    public Transportation login(String account, String pwd);

    /**
     * 获取科目一题表
     * @param page
     * @param limit
     * @return
     */
    public ObjectResult getOneSubject(Integer page, Integer limit, String question, String type);

    /**
     * 获取科目四题表
     * @param page
     * @param limit
     * @return
     */
    public ObjectResult getFourthSubject(Integer page, Integer limit, String question, String type);

    /**
     * 获取科目一题目信息
     * @param subject
     * @return
     */
    public Subject getOneSubjectMsg(Subject subject);

    /**
     * 获取科目四题目信息
     * @param subject
     * @return
     */
    public Subject getFourthSubjectMsg(Subject subject);

    /**
     * 删除科目一题目
     * @param subject
     * @return
     */
    public Integer deleteOneSubjectMsg(Subject subject);

    /**
     * 删除科目四题目
     * @param subject
     * @return
     */
    public Integer deleteFourthSubjectMsg(Subject subject);

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
     * 获取学员列表
     * @return
     */
    public ObjectResult getStudentTbl(Integer page, Integer limit, String state, String name, String type);

    /**
     * 获取学校表
     * @return
     */
    public List<School> getSchoolList();

    /**
     * 获取学员状态
     * @return
     */
    public Map<Integer, String> getStudentState();

    /**
     * 获取驾校列表
     * @param page
     * @param limit
     * @param state
     * @param name
     * @return
     */
    public ObjectResult getSchoolTbl(Integer page, Integer limit, String state, String name);

    /**
     * 获取学校状态
     * @return
     */
    public Map<Integer, String> getSchoolState();

    /**
     * 获取教练状态
     * @return
     */
    public Map<Integer, String> getCoachState();

    /**
     * 获取教练表
     * @param page
     * @param limit
     * @param name
     * @param sex
     * @param type
     * @param school
     * @return
     */
    public ObjectResult getCoachTbl(Integer page, Integer limit, String name, String sex, String type, String school);

    /**
     * 获取学员信息
     * @param id
     * @return
     */
    public  Student getStudentMsg(Integer id);

    /**
     * 获取学校形信息
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
     * 获取教练车表
     * @param page
     * @param limit
     * @param name
     * @param type
     * @param school
     * @return
     */
    public ObjectResult getCoachCarTbl(Integer page, Integer limit, String name, String type, String school);

    /**
     * 修改学员审核
     * @param id
     * @param text
     * @param i
     */
    public void examineStudent(Integer id, String text, Integer i);

    /**
     * 修改驾校审核
     * @param id
     * @param text
     * @param i
     */
    public void examineSchool(Integer id, String text, Integer i);

    /**
     * 修改教练审核
     * @param id
     * @param text
     * @param i
     */
    public void examineCoach(Integer id, String text, Integer i);

    /**
     * 修改教练车审核
     * @param id
     * @param text
     * @param i
     */
    public void examineCoachCar(Integer id, String text, String i);

    /**
     * 获取公告表
     * @param page
     * @param limit
     * @return
     */
    public ObjectResult getNotice(Integer page, Integer limit, String title, String date, String type);

    /**
     * 获取公告类型
     * @return
     */
    public List<?> getNoticeType();

    /**
     * 删除通告
     * @param notice
     * @return
     */
    public Integer deleteNotice(Notice notice);

    /**
     * 更新通告
     * @param notice
     * @return
     */
    public Integer updateNoticeMsg(Notice notice);

    /**
     * 获取通告信息
     * @param notice
     * @return
     */
    public Notice getNoticeMsg(Notice notice);

    /**
     * 新增公告数
     * @param notice
     * @return
     */
    public Integer insertNotice(Notice notice);

}
