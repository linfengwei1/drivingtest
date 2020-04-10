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
import java.util.Date;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/link")
public class LinkController {

	@Autowired
	private LinkService linkService;

	@RequestMapping("/path/{url}")
	public String getUrl(@PathVariable(value = "url") String path) {
		return "/frontjsp/jsp/" + path;
	}

	// 新增用户
	@RequestMapping("/addLink")
	public void addLink(Link link, HttpServletRequest request, HttpServletResponse response) throws IOException {

		linkService.addLinkUrl(link);

		response.getWriter().print("success");

	}

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
		return dt;
	}

}
