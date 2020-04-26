package com.great.service;

import com.great.entity.*;

import java.util.List;

import java.util.List;

public interface CoachManageService
{
    /**
     * 教练修改密码
     * @param coach
     * @return
     */
    Integer changeCoachpwd(Coach coach);

    /**
     * 教练登录
     * @param account
     * @param pwd
     * @return
     */
    Coach login(String account, String pwd);

    /**
     * 查询学生信息
     * @param utils
     * @return
     */
    Object getCoachStudentTable(TableUtils utils);

    /**
     * 查询驾校教练人数
     * @return
     */
    public List getSchoolCoach();

    /**
     * 查询学生评价
     * @param utils
     * @return
     */
    Object getCoachStudentEvaluation(TableUtils utils);




    List<Student> getStudentBySubject(String subject, String coachId);

    String getOrderTimeBydate(String schoolId, String data);

    String toOrder(Orders orders);
}
