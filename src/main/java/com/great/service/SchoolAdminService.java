package com.great.service;

import com.great.dao.SchoolAdminDao;
import com.great.entity.SchoolAdmin;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.LinkedHashMap;
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
}
