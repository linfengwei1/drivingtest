package com.great.service.serviceimpl;

import com.great.dao.SchoolAdminDao;
import com.great.dao.SchoolCoachDao;
import com.great.entity.Coach;
import com.great.entity.Student;
import com.great.entity.TableUtils;
import com.great.service.CoachManageService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.LinkedHashMap;
import java.util.List;
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

    //查询学员记录并分页
    @Override
    public Object getCoachStudentTable(TableUtils utils){
        Map<String,Object>InfMap = new LinkedHashMap<>();
        List<Student> list=schoolCoachDao.findStudentByPage(utils);
        Integer a =schoolCoachDao.findCount(utils);
        InfMap.put("list",list);
        InfMap.put("count",a);
        return InfMap;
    }
}
