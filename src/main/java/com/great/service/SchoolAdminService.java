package com.great.service;

import com.great.dao.SchoolAdminDao;
import com.great.entity.SchoolAdmin;
import com.great.entity.TableUtils;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

@Service
public class SchoolAdminService {

    @Resource
    private SchoolAdminDao schoolAdminDao;

    //驾校管理员登录
    public SchoolAdmin login(String account, String pwd){
        Map<String,String> loginMap = new LinkedHashMap<>();
        loginMap.put("account",account);
        loginMap.put("pwd",pwd);
        return schoolAdminDao.login(loginMap);
    }

//    //查询驾校管理员记录并分页
//    public List<SchoolAdmin> findSchoolAdminByPage(Map map){
//        return schoolAdminDao.findSchoolAdminByPage(map);
//    }
//
//    //查找当前用户信息总数
//    public Integer findSchoolAdminCount(Map map){
//
//        return schoolAdminDao.findSchoolAdminCount(map);
//    }


    //
    public Object sds(TableUtils utils){


        Map<String,Object>InfMap = new LinkedHashMap<>();
        List<SchoolAdmin> list=schoolAdminDao.findSchoolAdminByPage(utils);
        Integer a =schoolAdminDao.findSchoolAdminCount(utils);
        InfMap.put("list",list);
        InfMap.put("count",a);

        return InfMap;
    }
}
