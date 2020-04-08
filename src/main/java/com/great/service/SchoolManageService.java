package com.great.service;

import com.great.dao.SchoolAdminDao;
import com.great.dao.SchoolCoachDao;
import com.great.entity.Coach;
import com.great.entity.SchoolAdmin;
import com.great.entity.TableUtils;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

@Service
public class SchoolManageService {

    @Resource
    private SchoolAdminDao schoolAdminDao;
    @Resource
    private SchoolCoachDao schoolCoachDao;

    //驾校管理员登录
    public SchoolAdmin login(String account, String pwd){
        Map<String,String> loginMap = new LinkedHashMap<>();
        loginMap.put("account",account);
        loginMap.put("pwd",pwd);
        return schoolAdminDao.login(loginMap);
    }

    //查询驾校管理员记录并分页
    public Object getSchoolAdminTable(TableUtils utils){

        Map<String,Object>InfMap = new LinkedHashMap<>();
        List<SchoolAdmin> list=schoolAdminDao.findSchoolAdminByPage(utils);
        Integer a =schoolAdminDao.findSchoolAdminCount(utils);
        InfMap.put("list",list);
        InfMap.put("count",a);

        return InfMap;
    }

    //删除驾校管理员信息
    public Integer deleteSchoolAdmin(Integer id){
        return schoolAdminDao.deleteSchoolAdmin(id);
    }

    //更新驾校管理员信息
    public Integer updateSchoolAdmin(SchoolAdmin schoolAdmin){
        return schoolAdminDao.updateSchoolAdmin(schoolAdmin);
    }

    //查看账号是否被注册
    public Integer CheckAccount(String account){
        return schoolAdminDao.CheckAccount(account);
    }

    //添加驾校管理员
    public Integer addSchoolAdmin(SchoolAdmin schoolAdmin){
        return schoolAdminDao.addSchoolAdmin(schoolAdmin);
    }


    //查询驾校管理员记录并分页
    public Object getSchoolCoachTable(TableUtils utils){
        Map<String,Object>InfMap = new LinkedHashMap<>();
        List<Coach> list=schoolCoachDao.findCoachByPage(utils);
        Integer a =schoolCoachDao.findCoachCount(utils);
        InfMap.put("list",list);
        InfMap.put("count",a);
        return InfMap;
    }

    //更新教练信息
    public Integer updateCoach(Coach coach){
        return schoolCoachDao.updateCoach(coach);
    }

    //删除教练
    public Integer deleteCount(Integer id){
        return schoolCoachDao.deleteCount(id);
    }

    //查看账号是否被注册
    public Integer CheckCoachAccount(String account){
        return schoolCoachDao.CheckCoachAccount(account);
    }

    //添加教练
    public Integer addCoach(Coach coach){
        return schoolCoachDao.addCoach(coach);
    }

    //查询所有教练
    public List<Coach> findAllCoach(Integer schoolid){
        return schoolCoachDao.findAllCoach(schoolid);
    }
}
