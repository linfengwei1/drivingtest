package com.great.controller;

import com.great.entity.Link;
import com.great.service.LinkService;
import com.great.service.SchoolManageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@Controller
//@RequestMapping("/welcome")
public class LinkController {

    @Autowired
    private LinkService linkService;

    @RequestMapping("/path/{url}")
    public String getUrl(@PathVariable(value = "url") String path){
        return "/frontjsp/" +path;
    }

        @RequestMapping("/welcome")
    public String welcomePage(HttpServletRequest request, HttpServletResponse response) {
//		request.setCharacterEncoding("UTF-8");
//		response.setContentType("text/html");
//		response.setCharacterEncoding("UTF-8");
//		ResponseUtils.outJson(response,dateWrite);
        return "frontjsp/jsp"+"/Welcome";
    }
    //新增链接
    @RequestMapping("/addLinkUrl")
    public void addLinkUrl(Link link, HttpServletRequest request, HttpServletResponse response) throws IOException {

        linkService.addLinkUrl(link);
        response.getWriter().print("success");

    }

}
