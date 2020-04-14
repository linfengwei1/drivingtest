package com.great.controller;

import com.google.gson.Gson;
import com.google.gson.JsonParser;
import com.great.entity.*;
import com.great.service.LinkService;
import com.great.service.SchoolManageService;
import com.great.service.SchoolSearchService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.text.html.HTML;
import java.io.IOException;
import java.util.Date;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

@Controller//控制层controller控制器
@RequestMapping("/link")//访问路径：如果只是@RequestMapping则返回的是jsp页面，如果再加上@ResponseBody则返回的是字符串
public class LinkController {

	@Autowired//自动注入、自动装配
	private LinkService linkService;
	private SchoolSearchService schoolSearchService;
	@RequestMapping("/path/{url}")//访问路径的路口：path/{url是作为参数PathVariable路径变量}
	public String getUrl(@PathVariable(value = "url") String path) {
		return "/frontjsp/jsp/" + path;//返回
	}

	// 新增友情链接：插入成功返回前台success
	@RequestMapping("/addLink")
	public void addLink(Link link, HttpServletRequest request, HttpServletResponse response) throws IOException {

		linkService.addLink(link);

		response.getWriter().print("success");//有成功打印出success

	}
    //查询友情链接数据列表：需要返回数据给前台
	@RequestMapping("/findAllLink")
	@ResponseBody // ajax返回值json格式转换
	public DateTable ShowAllLink(HttpServletRequest request, HttpServletResponse response) throws IOException {
		Integer page = Integer.parseInt(request.getParameter("page"));
		Integer limit = Integer.parseInt(request.getParameter("limit"));

		DateTable dt = new DateTable();
		List<Link> linkList = linkService.findAllLink();
		Gson g = new Gson();
		dt.setCode(0);
		dt.setCount(linkList.size());// 总条数
		dt.setData(linkList);
		System.out.println(linkList);
		return dt;//返回前端的数据
	}
	//更新友情链接：
	@RequestMapping("updateLink")
	public void updateLink(Link link, HttpServletRequest request, HttpServletResponse response) throws IOException {

		linkService.updateLink(link);

		response.getWriter().print("success");//有成功打印出success
	}
	//删除友情链接：ddd
	@RequestMapping("/deleteLink")
	public void deleteLink(Link link,  HttpServletRequest request, HttpServletResponse response) throws IOException {

		linkService.deleteLink(link);

		response.getWriter().print("success");
	}

	//查询驾校数据列表：需要返回数据给前台
	@RequestMapping("findAllSchool")//findAllSchool
	@ResponseBody // ajax返回值json格式转换：
	public DateTable ShowAllSchool(HttpServletRequest request, HttpServletResponse response) throws IOException {
		Integer page = Integer.parseInt(request.getParameter("page"));
		Integer limit = Integer.parseInt(request.getParameter("limit"));

		DateTable dt = new DateTable();
		List<School> schoolList = schoolSearchService.findAllSchool();
		Gson g = new Gson();
		dt.setCode(0);
		dt.setCount(schoolList.size());// 总条数
		dt.setData(schoolList);
		System.out.println(schoolList);
		return dt;//返回前端的数据
	}
}
