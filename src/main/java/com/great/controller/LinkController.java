package com.great.controller;

import com.google.gson.Gson;
import com.google.gson.JsonParser;
import com.great.entity.*;
import com.great.service.LinkService;
import com.great.service.SchoolManageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.text.html.HTML;
import java.io.IOException;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/link")
public class LinkController {

    @Autowired
    private LinkService linkService;

    @RequestMapping("/findAllLink")
    @ResponseBody//ajax返回值json格式转换
    public String ShowAllLink(HttpServletRequest request, HttpServletResponse response) throws IOException {

        List<Link> linkList= linkService.findAllLink();
        Gson g = new Gson();
        System.out.println(linkList);
        return g.toJson(linkList);
    }



}
