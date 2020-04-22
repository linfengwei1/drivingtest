package com.great.service;

import com.great.entity.Coach;
import com.great.entity.SchoolAdmin;
import com.great.entity.TableUtils;

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
     * 查询学生评价
     * @param utils
     * @return
     */
    Object getCoachStudentEvaluation(TableUtils utils);
}
