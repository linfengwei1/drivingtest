package com.great.service.serviceimpl;

import com.great.dao.SchoolAdminDao;
import com.great.dao.SchoolCoachDao;
import com.great.entity.Coach;
import com.great.service.CoachManageService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.LinkedHashMap;
import java.util.Map;

@Service
public class CoachManageServiceImpl implements CoachManageService
{
    @Resource
    private SchoolCoachDao schoolCoachDao;
    @Override
    public Integer changeCoachpwd(Coach coach)
    {
        return schoolCoachDao.changeCoachpwd(coach);
    }

    @Override
    public Coach login(String account, String pwd)
    {
        Map<String,String> loginMap = new LinkedHashMap<>();
        loginMap.put("account",account);
        loginMap.put("pwd",pwd);
        return schoolCoachDao.login(loginMap);
    }
}
