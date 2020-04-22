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
        utils.setMaxLimit(utils.getMaxLimit()*4);
        utils.setMinLimit(utils.getMinLimit()*4);
        List<Score> studentScoreList = schoolCoachDao.findStudentScore(utils);
        List<StudyCondition> studyConditions = schoolCoachDao.findStudentTime(utils);
//        System.out.println("studyConditions:"+studyConditions);
//        System.out.println("studentScoreList:"+studentScoreList);
//        System.out.println("list:"+list);
//        System.out.println(list.size()+"---"+studentScoreList.size());


        for(int i = 0;i<list.size();i++)
        {
            for(int j = 0;j<4;j++)
            {
                //成绩判断
                if(studentScoreList.get(j).getSubject()==1)
                {
                    list.get(i).setOneScore(studentScoreList.get(i*4).getScore());
                }
                else if(studentScoreList.get(j).getSubject()==2)
                {
                    list.get(i).setTwoScore(studentScoreList.get(i*4+1).getScore());
                }
                else if(studentScoreList.get(j).getSubject()==3)
                {
                    list.get(i).setThreeScore(studentScoreList.get(i*4+2).getScore());
                }
                else if(studentScoreList.get(j).getSubject()==4)
                {
                    list.get(i).setFourScore(studentScoreList.get(i*4+3).getScore());
                }

                //学时判断
                if(list.get(i).getStudent_state_id()==1||list.get(i).getStudent_state_id()==9||list.get(i).getStudent_state_id()==13)
                {
                    list.get(i).setTime(studyConditions.get(i*4).getTime());
                }
                else if (list.get(i).getStudent_state_id()==2||list.get(i).getStudent_state_id()==10||list.get(i).getStudent_state_id()==14)
                {
                    list.get(i).setTime(studyConditions.get(i*4+1).getTime());
                }
                else if (list.get(i).getStudent_state_id()==3||list.get(i).getStudent_state_id()==11||list.get(i).getStudent_state_id()==15)
                {
                    list.get(i).setTime(studyConditions.get(i*4+2).getTime());
                }
                else if (list.get(i).getStudent_state_id()==4||list.get(i).getStudent_state_id()==12||list.get(i).getStudent_state_id()==16)
                {
                    list.get(i).setTime(studyConditions.get(i*4+3).getTime());
                }
            }
        }

        InfMap.put("list",list);
        InfMap.put("count",a);
        return InfMap;
    }

    //查询驾校教练人数
	@Override
	public List getSchoolCoach()
	{
		return schoolCoachDao.getSchoolCoach();
	}

    @Override
    public Object getCoachStudentEvaluation(TableUtils utils)
    {
        Map<String,Object> InfMap = new LinkedHashMap<>();

        List<EvaluationToCoach> evaluationToCoaches = schoolCoachDao.findStudentEvaluation(utils);
        System.out.println("list:"+evaluationToCoaches);
        Integer count = schoolCoachDao.findStudentEvaluationByCount(utils);

        InfMap.put("list",evaluationToCoaches);
        InfMap.put("count",count);
        return InfMap;
    }
}
