package com.great.controller;

import com.great.entity.Coach;
import com.great.service.CoachManageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@Controller
@RequestMapping("/coach")
public class CoachController
{
    @Autowired
    public CoachManageService coachManageService;
    //地址映射,path是个方法名,可以随便改动,{url}是参数
    @RequestMapping("/path/{url}")
    public String getUrl(@PathVariable(value = "url") String path){
        return "coach/jsp/" +path;
    }

    @RequestMapping("/back" )
    public String backManage()
    {
        return "coach/jsp/back";
    }

    @RequestMapping("/changePwd" )
    public void changePwd(Coach coach, HttpServletResponse response) throws IOException {
        System.out.println("changepwd------");
        System.out.println("Coach=="+coach.toString());
        Integer a= coachManageService.changeCoachpwd(coach);
        if (1==a){
            response.getWriter().print("success");
        }else{
            response.getWriter().print("error");
        }
    }

    @RequestMapping("/login" )
    public String login()
    {
        return "coach/jsp/CoachLogin";
    }
}
