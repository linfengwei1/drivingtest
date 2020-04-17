package com.great.service.serviceimpl;

import com.great.dao.SchoolAdminDao;
import com.great.dao.SchoolCoachDao;
import com.great.entity.*;
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
        Map<String,Object> InfMap = new LinkedHashMap<>();
        List<StudentTable> list=schoolCoachDao.findStudentByPage(utils);
        Integer a =schoolCoachDao.findCount(utils);
        List<StudyCondition> studentScoreList = schoolCoachDao.findStudentScore(utils);
        System.out.println("studentScoreList:"+studentScoreList);
        System.out.println("list:"+list);
        System.out.println(list.size()+"---"+studentScoreList.size());
        for(int i = 0;i<list.size();i++)
        {
            System.out.println("循环");
            for(int j = 0;j<4;j++)
            {
                if(studentScoreList.get(j).getSubject_id()==1)
                {
                    list.get(i).setOneScore(studentScoreList.get(j*i).getPractise_score());
                    System.out.println("listname:"+list.get(i).getName());
                    System.out.println("分数："+list.get(i).getOneScore());
                }
                if(studentScoreList.get(j).getSubject_id()==2)
                {
                    list.get(i).setTwoScore(studentScoreList.get(j*i+1).getPractise_score());
                }
                if(studentScoreList.get(j).getSubject_id()==3)
                {
                    list.get(i).setThreeScore(studentScoreList.get(j*i+2).getPractise_score());
                }
                if(studentScoreList.get(j).getSubject_id()==4)
                {
                    list.get(i).setFourScore(studentScoreList.get(j*i+3).getPractise_score());
                }
            }
        }

        InfMap.put("list",list);
        InfMap.put("count",a);
        return InfMap;
    }
}
