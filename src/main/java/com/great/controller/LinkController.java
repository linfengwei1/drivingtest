package com.great.controller;

//import com.alibaba.druid.util.StringUtils;这个包错了，换成下面这个！！！
import org.springframework.util.StringUtils;
import com.google.gson.Gson;
import com.google.gson.JsonParser;
import com.great.aoplog.Log;
import com.great.entity.*;
import com.great.service.LinkService;
import com.great.service.SchoolManageService;
//import javafx.scene.chart.Chart;我这个没找到，注销了
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.text.html.HTML;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller//控制层controller控制器
@RequestMapping("/link")//访问路径：如果只是@RequestMapping则返回的是jsp页面，如果再加上@ResponseBody则返回的是字符串
public class LinkController {

	@RequestMapping("/first")
	public String first(){
		return "/frontjsp/jsp/Welcome";
	}

	@Autowired//自动注入、自动装配
	private LinkService linkService;
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
		List<School> schoolList = linkService.findAllSchool();
		Gson g = new Gson();
		dt.setCode(0);
		dt.setCount(schoolList.size());// 总条数
		dt.setData(schoolList);
		System.out.println(schoolList);
		return dt;//返回前端的数据
	}

	//文件上传
	@RequestMapping("/fileUpload")
	@ResponseBody//ajax返回值json格式转换
	public Object test(@RequestParam(value="file",required = false) MultipartFile file, HttpServletRequest request) throws IOException {
		System.out.println("fileUpload");
		System.out.println("file:"+file);
		if (!StringUtils.isEmpty(file) && file.getSize()>0){
			System.out.println("in");
			String name= file.getOriginalFilename();//是得到上传时的文件名。
			System.out.println("name:"+name);
			String suffix = name.substring(name.lastIndexOf(".") + 1);
			System.out.println("suffix:"+suffix);
//			User user = (User) request.getSession().getAttribute("user");
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss ");//设置时间格式
			String rtime = sdf.format(new Date());//操作时间
//			Chart document=null;
//			document.setDownscore(Integer.valueOf(downScore));
//			document.setTitle(bookName);
//			document.setIntro(intro);
//			document.setTypename(suffix);
//			document.setUptime(rtime);
//			document.setDstate("待审核");
//			document.setDowncount(0);
//			document.setUserid( user.getUserid());
//			document.setUrl("D:\\test\\" + name);
//			List<DocumentType> documentTypes=myService.findDocumentType();
//			List typeName = new ArrayList();//存类型名
//			for (int i= 0;i<documentTypes.size();i++){
//				typeName.add(documentTypes.get(i).getTypename());
//			}
//			if (typeName.contains(suffix)){//集合是否包含要上传的文档类型
//				Integer a= myService.insertInfByUid(document);
//				file.transferTo(new File("D:\\test\\" + name));
//				return "{\"code\":0, \"msg\":\"\", \"data\":{}}";
//			}
			return "{\"code\":0, \"msg\":\"\", \"data\":{}}";
		}
		return "{\"code\":3, \"msg\":\"\", \"data\":{}}";
	}


//	public final static String UPLOAD_FILE_PATH = "D:\\file\\";
//	@RequestMapping("uploadFile")
//	public String uploadImage(@RequestParam("file") MultipartFile file) {
//		if (!file.isEmpty()) {
//			Map<String, String> resObj = new HashMap<>();
//			try {
//				BufferedOutputStream out = new BufferedOutputStream(
//						new FileOutputStream(new File(UPLOAD_FILE_PATH, file.getOriginalFilename())));
//				out.write(file.getBytes());
//				out.flush();
//				out.close();
//			} catch (IOException e) {
//				resObj.put("msg", "error");
//				resObj.put("code", "1");
//				return JSONObject.toJSONString(resObj);
//			}
//			resObj.put("msg", "ok");
//			resObj.put("code", "0");
//			return JSONObject.toJSONString(resObj);
//		} else {
//			return null;
//		}
//	}

}
