package com.great.controller;

import com.great.entity.FileList;
import com.great.entity.User;
import com.great.entity.UserList;
import com.great.service.UserManageService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.util.HashMap;

@Controller
@RequestMapping("/user")
public class UserController
{
	@Resource(name = "userManageServiceImpl")
	private UserManageService userManageServiceImpl;
	@RequestMapping("/login")
	public String login(String uname, String pwd, HttpServletRequest request, HttpServletResponse response)
	{
		User user = userManageServiceImpl.findUser(uname,pwd);
		HttpSession hs=request.getSession();
		hs.setAttribute("user",user);
		return "front/jsp/UserMain";
	}
	@RequestMapping("/getMenu")
	@ResponseBody
	public String getMenu(String roleid, HttpServletResponse response) throws IOException, SQLException
	{
		String menuMap =  userManageServiceImpl.getMenu(roleid,response);
		return menuMap;
	}
	@RequestMapping("/getUserList")
	@ResponseBody
	public UserList getUserList(String page, String limit, String uname, String pwd, HttpServletResponse response) throws IOException, SQLException
	{
		UserList userList = userManageServiceImpl.getUserList(page,limit,uname,pwd,response);
		return userList;
	}
	@RequestMapping("/getFileList")
	@ResponseBody
	public FileList getFileList(String page, String limit, String uname, String pwd, HttpServletResponse response) throws IOException, SQLException
	{
		FileList fileList = userManageServiceImpl.getFileList(page,limit,uname,pwd,response);
		return fileList;
	}
	@RequestMapping("/loginPage")
	public String loginPage()
	{
		System.out.println("执行了");
		return "front/jsp/UserLogin";
	}
	@RequestMapping("/UserMain")
	public String UserMain()
	{
		System.out.println();
		return "front/jsp/UserMain";
	}
	@RequestMapping("/fielList")
	public String fielList()
	{
		return "front/jsp/FileList";
	}
	@RequestMapping("/uploadPage")
	public String Upload()
	{
		return "front/jsp/Upload";
	}
	@RequestMapping("/UserList")
	public String UserList()
	{
		return "front/jsp/UserList";
	}
	@RequestMapping("/UserMenuManage")
	public String UserMenuManage()
	{
		return "front/jsp/MenuManage";
	}
	@RequestMapping("/getHasMenu")
	@ResponseBody
	public HashMap<String,Object> getHasMenu(String roleid) throws SQLException
	{
		HashMap<String,Object> map=  userManageServiceImpl.getHasMenu(roleid);
		return map;
	}
	@RequestMapping("/changeMenu")
	@ResponseBody
	public String changeMenu(@RequestParam(value = "menuid[]") String[] menuid, String roleid) throws Exception
	{
		String result =  userManageServiceImpl.changeMenu(menuid,roleid);
		return result;
	}
	@RequestMapping("/upload")
	@ResponseBody
	public void upload(@RequestParam("file") MultipartFile file, HttpServletRequest req, HttpServletResponse response)
			throws IllegalStateException, IOException {

		// 判断文件是否为空，空则返回失败页面
		if (file.isEmpty()) {
			response.setContentType("application/json; charset=utf-8");
			response.getWriter().write("{\"code\":1, \"msg\":\"\", \"data\":{}}");
			response.getWriter().flush();
			response.getWriter().close();
		}
		// 获取文件存储路径（绝对路径）
		String path = req.getServletContext().getRealPath("/WEB-INF/file");
		// 获取原文件名
		String fileName = file.getOriginalFilename();
		String filename  = req.getParameter("bookName");
		System.out.println(filename);
		// 创建文件实例
		File filePath = new File(path, fileName);
		// 如果文件目录不存在，创建目录
		if (!filePath.getParentFile().exists()) {
			filePath.getParentFile().mkdirs();
			System.out.println("创建目录" + filePath);
		}
		User user = (User)req.getSession().getAttribute("user");
		userManageServiceImpl.uploadFile(user,filename);
		// 写入文件
		file.transferTo(filePath);
		response.setContentType("application/json; charset=utf-8");
		response.getWriter().write("{\"code\":0, \"msg\":\"\", \"data\":{}}");
		response.getWriter().flush();
		response.getWriter().close();
	}
}
