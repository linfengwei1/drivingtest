package com.great.service;

import com.great.entity.Coach;
import com.great.entity.SchoolAdmin;
import com.great.entity.TableUtils;

import java.util.List;

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

	/**
	 * 查询驾校教练人数
	 * @return
	 */
	public List getSchoolCoach();
}
