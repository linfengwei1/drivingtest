package com.great.controller;

//import com.alibaba.druid.util.StringUtils;这个包错了，换成下面这个！！！
import com.great.service.SchoolManageService;
import org.springframework.util.StringUtils;
import com.google.gson.Gson;
import com.great.entity.*;
import com.great.service.LinkService;
//import javafx.scene.chart.Chart;我这个没找到，注销了

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller//控制层controller控制器
@RequestMapping("/link")//访问路径：如果只是@RequestMapping则返回的是jsp页面，如果再加上@ResponseBody则返回的是字符串
public class LinkController {

	@Autowired//自动注入、自动装配
	private LinkService linkService;

	@Autowired//自动注入、自动装配
	private SchoolManageService schoolAdminService;
    @RequestMapping("/path/{url}") // 访问路径的路口：path/{url是作为参数PathVariable路径变量}
    public ModelAndView getUrl(@PathVariable(value = "url") String path) {
		List<Link> linkList = linkService.findAllLink();//调用查询所有友情链接数据接口，得到友情链接数据列表linkList
		ModelAndView mav = new ModelAndView("/frontjsp/jsp/" + path);//实例化ModelAndView对象，给mav对象指定名称为/frontjsp/jsp/+ 路径path
		List<Notice> noticeList =  schoolAdminService.getNotice();//获取首页通知公告的内容
		List<Notice> noticeDS = linkService.getNoticeDS();//获取前台驾驶技巧通告
		List<Notice> noticeCS = linkService.getNoticeCS();//获取学车课堂通告
		Map<String,Object> model = new HashMap<String,Object>();
		model.put("linkList",linkList);
		model.put("noticeList",noticeList);
		model.put("noticeDS",noticeDS);//将前台驾驶技巧通告添加到mav对象里
		model.put("noticeCS",noticeCS);//学车课堂通告添加到mav对象里
		mav.addObject("model",model);
		return mav;

    }








//	/**
//	 * 增加友情链接图片上传
//	 * @param file
//	 * @return
//	 * @throws Exception
//	 */
//	@RequestMapping("/linkImage")
//	@ResponseBody
//	public Object  linkImage( MultipartFile file,HttpServletRequest request) throws Exception {
//		Map<String,Object> map= (Map<String, Object>) linkImage(file,request);
//		return map;
//	}

	/**
	 * 友情链接图片上传
	 * @param file
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/linkImage")
	@ResponseBody
	public Object linkImage( MultipartFile file, HttpServletRequest request) throws Exception {

		String prefix="";
		String dateStr="";
		//保存上传
		OutputStream out = null;
		InputStream fileInput=null;
		try{
			if(file!=null){
				String originalName = file.getOriginalFilename();
				prefix=originalName.substring(originalName.lastIndexOf(".")+1);
				Date date = new Date();
				//使用UUID+后缀名保存文件名，防止中文乱码问题
				String uuid = UUID.randomUUID()+"";
				SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
				dateStr = simpleDateFormat.format(date);
				String savePath = request.getSession().getServletContext().getRealPath("/images/");
				String projectPath = savePath  + dateStr+File.separator + uuid+"." + prefix;;
				System.out.println("projectPath=="+projectPath);
				File files=new File(projectPath);
				//打印查看上传路径
				if(!files.getParentFile().exists()){//判断目录是否存在
					System.out.println("files11111="+files.getPath());
					files.getParentFile().mkdirs();
				}
				file.transferTo(files); // 将接收的文件保存到指定文件中
				Map<String,Object> map2=new HashMap<>();
				Map<String,Object> map=new HashMap<>();
				map.put("code",0);
				map.put("msg","");
				map.put("data",map2);
				map2.put("src","/images/"+ dateStr+"/"+uuid+"." + prefix);
				return map;
			}
		}catch (Exception e){
			e.printStackTrace();
		}finally{
			try {
				if(out!=null){
					out.close();
				}
				if(fileInput!=null){
					fileInput.close();
				}
			} catch (IOException e) {
			}
		}
		Map<String,Object> map=new HashMap<>();
		map.put("code",1);
		map.put("msg","");
		return map;

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

	//文件上传（上传图片）
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
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss ");//设置时间格式
			String rtime = sdf.format(new Date());//操作时间
			return "{\"code\":0, \"msg\":\"\", \"data\":{}}";
		}
		return "{\"code\":3, \"msg\":\"\", \"data\":{}}";
	}




























































































































	@RequestMapping("/getSchoolInfoByPage")
	@ResponseBody
	public SchoolInfoList getSchoolInfoByPage(String curr,String shcoolName, String addr,HttpServletRequest request, HttpServletResponse response) throws IOException
	{
		SchoolInfoList schoolInfoList = null;
		schoolInfoList = linkService.getSchoolInfoByPage(curr,shcoolName,addr);

		return schoolInfoList;
	}

}
