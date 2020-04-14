package com.great.service;

import com.great.entity.Coach;
import com.great.entity.SchoolAdmin;
import com.great.entity.TableUtils;

public interface CoachManageService
{
    Integer changeCoachpwd(Coach coach);

    Coach login(String account, String pwd);

    /**
     * 查询学生信息
     * @param utils
     * @return
     */
    Object getCoachStudentTable(TableUtils utils);
}
