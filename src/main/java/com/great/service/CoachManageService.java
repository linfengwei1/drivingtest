package com.great.service;

import com.great.entity.Coach;
import com.great.entity.SchoolAdmin;

public interface CoachManageService
{
    Integer changeCoachpwd(Coach coach);

    Coach login(String account, String pwd);
}
