package com.great.controller;


import com.google.gson.Gson;
import com.great.aoplog.Log;
import com.great.entity.*;
import com.great.service.TransportationService;
import org.apache.commons.io.FileUtils;
import org.apache.commons.io.FilenameUtils;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.Random;

//import com.great.service.MyService;

@Controller
@RequestMapping("/TM")//@RequestMapping：可以为控制器指定处理可以请求哪些URL请求。
public class TransportationManagementController {
    Gson g = new Gson();
    private Random random = new Random();

    @Resource
    private TransportationService transportationService;
//    @Autowired
//    private DateTable dateTable;

    @RequestMapping("/login")
    public String index2(){
        return "/transportation/jsp/TransportationLogin";
    }
    //地址映射,path是个方法名,可以随便改动,{url}是参数
    @RequestMapping("/path/{url}")
    public String getUrl(@PathVariable(value = "url") String path){
        return "transportation/jsp/" +path;
    }

    //获取验证码
    @RequestMapping("/CheckCodeServlet")
    public void CheckCodeServlet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        //内存图片对象(TYPE_INT_BGR 选择图片模式RGB模式)
        BufferedImage image = new BufferedImage(100, 35, BufferedImage.TYPE_INT_BGR);
        //得到画笔
        Graphics graphics = image.getGraphics();
        //画之前要设置颜色，设置画笔颜色
        graphics.setColor(new Color(236,255,253,255));
        //设置字体类型、字体大小、字体样式　
        graphics.setFont(new Font("黑体", Font.BOLD, 23));
        //填充矩形区域（指定要画的区域设置区）
        graphics.fillRect(0, 0, 100, 35);
        //为了防止黑客软件通过扫描软件识别验证码。要在验证码图片上加干扰线
        //给两个点连一条线graphics.drawLine();
        for (int i = 0; i < 5; i++)
        {
            //颜色也要随机（设置每条线随机颜色）
            graphics.setColor(getRandomColor());
            int x1 = random.nextInt(100);
            int y1 = random.nextInt(35);
            int x2 = random.nextInt(100);
            int y2 = random.nextInt(35);
            graphics.drawLine(x1, y1, x2, y2);
        }

        //拼接4个验证码，画到图片上
        char[] arrays = {'A','B','C','D','E','F','G','H','J','K','L','M','N','P','Q','R','S','T','W','X','Y','Z','1','2','3','4','5','6','7','8','9'};
        StringBuilder builder = new StringBuilder();
        for (int i = 0; i < 4; i++)
        {
            //设置字符的颜色

            int index = random.nextInt(arrays.length);
            builder.append(arrays[index]);
        }
        //创建session对象将生成的验证码字符串以名字为checkCode保存在session中request.getSession().setAttribute("checkCode",builder.toString());
        //将4个字符画到图片上graphics.drawString(str ,x,y);一个字符一个字符画
        request.getSession().setAttribute("vcode",builder.toString());
        for (int i = 0; i < builder.toString().length(); i++)
        {
            graphics.setColor(getRandomColor());
            char item = builder.toString().charAt(i);
            graphics.drawString(item + "", 10 + (i * 20), 25);
        }

        //输出内存图片到输出流
        ImageIO.write(image, "jpg", response.getOutputStream());
    }
    private Color getRandomColor() {
        int r = random.nextInt(256);
        int g = random.nextInt(256);
        int b = random.nextInt(256);
        return new Color(r, g, b);

    }


    /**
     * 运管登录
     * @param account
     * @param pwd
     * @param rePass
     * @param request
     * @return
     * @throws IOException
     */
    @RequestMapping("/Login")
    @ResponseBody
    public String Login(String account,String pwd,String rePass , HttpServletRequest request) throws IOException {
        String YZM = (String)request.getSession().getAttribute("vcode");//拿到验证码
        Boolean confirm = rePass.equalsIgnoreCase(YZM);//不区分大小写
        String filepath2 = System.getProperty("user.dir");
        System.out.println(filepath2);
        if (confirm) {
            Transportation transportation =transportationService.login(account,pwd);
            if (null!=transportation){
                request.getSession().setAttribute("Transportation",transportation);
                return "success";
            }else{
                return "error";
            }
        }else{
            return "yzm";
        }
    }

    /**
     * 获取科目一题目列表
     * @return
     */
    @RequestMapping("/getOneSubject")
    @ResponseBody
    public String getOneSubject(Integer page, Integer limit,String question,String type,HttpServletResponse response){

        // 设置浏览器字符集编码.
        response.setHeader("Content-Type","text/html;charset=UTF-8");
        // 设置response的缓冲区的编码.
        response.setCharacterEncoding("UTF-8");

        ObjectResult objectResult=transportationService.getOneSubject(page,limit,question,type);

        return g.toJson(objectResult);
    }

    /**
     * 获取科目四题目列表
     * @return
     */
    @RequestMapping("/getFourthSubject")
    @ResponseBody
    public String getFourthSubject(Integer page, Integer limit,String question,String type,HttpServletResponse response){

        // 设置浏览器字符集编码.
        response.setHeader("Content-Type","text/html;charset=UTF-8");
        // 设置response的缓冲区的编码.
        response.setCharacterEncoding("UTF-8");

        ObjectResult objectResult=transportationService.getFourthSubject(page,limit,question,type);

        return g.toJson(objectResult);
    }

    /**
     * 删除题目
     * @param sub
     * @param who
     * @param response
     * @return
     */
    @RequestMapping("/deleteSubject")
    @ResponseBody
    public String deleteSubject(String sub,String who, HttpServletResponse response,HttpServletRequest request){

        // 设置浏览器字符集编码.
        response.setHeader("Content-Type","text/html;charset=UTF-8");
        // 设置response的缓冲区的编码.
        response.setCharacterEncoding("UTF-8");

        Subject subject=g.fromJson(sub,Subject.class);

        if (who.equals("one")){
            request.getSession().setAttribute("Subject",transportationService.deleteOneSubjectMsg(subject));
        }else {
            request.getSession().setAttribute("Subject",transportationService.deleteFourthSubjectMsg(subject));
        }

        return "";
    }

    /**
     * 更新题目信息
     * @param sub
     * @param who
     * @param response
     * @return
     */
    @RequestMapping("/updateSubject")
    @ResponseBody
    public String updateSubject(String sub,String who,HttpServletResponse response,HttpServletRequest request){

        // 设置浏览器字符集编码.
        response.setHeader("Content-Type","text/html;charset=UTF-8");
        // 设置response的缓冲区的编码.
        response.setCharacterEncoding("UTF-8");

        Subject subject=g.fromJson(sub,Subject.class);

        if (who.equals("one")){
            request.getSession().setAttribute("Subject",transportationService.updateOneSubjectMsg(subject));
        }else {
            request.getSession().setAttribute("Subject",transportationService.updateFourthSubjectMsg(subject));
        }


        return "";
    }

    /**
     * 获取题目信息
     * @param sub
     * @param response
     * @param request
     * @return
     */
    @RequestMapping("/getSubjectMsg")
    @ResponseBody
    public String getSubjectMsg(String sub,String who,HttpServletResponse response,HttpServletRequest request){

        // 设置浏览器字符集编码.
        response.setHeader("Content-Type","text/html;charset=UTF-8");
        // 设置response的缓冲区的编码.
        response.setCharacterEncoding("UTF-8");

        Subject subject=g.fromJson(sub,Subject.class);

        if (who.equals("one")){

            request.getSession().setAttribute("subject",transportationService.getOneSubjectMsg(subject));
            System.out.println(transportationService.getOneSubjectMsg(subject));
        }else {
            request.getSession().setAttribute("subject",transportationService.getFourthSubjectMsg(subject));
        }

        return "";
    }

    /**
     * 获取所有学校名和状态信息
     * @param request
     * @return
     */
    @RequestMapping("/gASA")
    public String getAllSchoolAndStudentState(HttpServletRequest request){

        List<School> schools =transportationService.getSchoolList();

        Map<Integer,String>  map=transportationService.getStudentState();

        if (schools!=null){
            request.setAttribute("schools",schools);
        }

        if (map!=null){
            request.setAttribute("stateMap",map);
        }

        return "transportation/jsp/StudentTbl";
    }

    /**
     * 学员信息表
     * @param page
     * @param limit
     * @param school
     * @param type
     * @param response
     * @return
     */
    @RequestMapping("/getStudentTbl")
    @ResponseBody
    public String getStudentTbl(Integer page, Integer limit ,String school,String name,String type,HttpServletResponse response){

        // 设置浏览器字符集编码.
        response.setHeader("Content-Type","text/html;charset=UTF-8");
        // 设置response的缓冲区的编码.
        response.setCharacterEncoding("UTF-8");

        ObjectResult objectResult=transportationService.getStudentTbl(page,limit ,school,name,type);

        return g.toJson(objectResult);
    }

    /**
     * 获取学员信息
     * @param response
     * @return
     */
    @RequestMapping("/getStudentMsg")
    @ResponseBody
    public String getStudentMsg (Integer id,HttpServletResponse response,HttpServletRequest request){

        // 设置浏览器字符集编码.
        response.setHeader("Content-Type","text/html;charset=UTF-8");
        // 设置response的缓冲区的编码.
        response.setCharacterEncoding("UTF-8");

        request.getSession().setAttribute("student",transportationService.getStudentMsg(id));

        System.out.println(request.getSession().getAttribute("student"));

        return "";
    }

    /**
     * 获取驾校信息
     * @param response
     * @return
     */
    @RequestMapping("/getSchoolMsg")
    @ResponseBody
    public String getSchoolMsg (Integer id,HttpServletResponse response,HttpServletRequest request){

        // 设置浏览器字符集编码.
        response.setHeader("Content-Type","text/html;charset=UTF-8");
        // 设置response的缓冲区的编码.
        response.setCharacterEncoding("UTF-8");

        request.getSession().setAttribute("school",transportationService.getSchoolMsg(id));

        request.getSession().setAttribute("studentNum",transportationService.getStudentCountBySchoolId(id));

        request.getSession().setAttribute("coachNum",transportationService.getCoachCountBySchoolId(id));

        request.getSession().setAttribute("coachCarNum",transportationService.getCoachCarCountBySchoolId(id));

        System.out.println(request.getSession().getAttribute("school"));

        return "";
    }

    /**
     * 获取教练信息
     * @param response
     * @return
     */
    @RequestMapping("/getCoachMsg")
    @ResponseBody
    public String getCoachMsg (Integer id,HttpServletResponse response,HttpServletRequest request){

        // 设置浏览器字符集编码.
        response.setHeader("Content-Type","text/html;charset=UTF-8");
        // 设置response的缓冲区的编码.
        response.setCharacterEncoding("UTF-8");

        request.getSession().setAttribute("coach",transportationService.getCoachMsg(id));

        System.out.println(request.getSession().getAttribute("coach"));

        return "";
    }


    /**
     * 审核学生（修改状态，插入审核结果）
     * @param response
     * @return
     */
    @RequestMapping("/examineStudent")
    @ResponseBody
    public String examineStudent(Integer id,String text,String doing,HttpServletResponse response){

        System.out.println(doing);

        if ("通过".equals(doing)){
            transportationService.examineStudent(id,text,1);
        }else {
            transportationService.examineStudent(id,text,6);
        }


        return "Success";
    }

    /**
     * 审核学校（修改状态，插入审核结果）
     * @param response
     * @return
     */
    @RequestMapping("/examineSchool")
    @ResponseBody
    public String examineSchool(Integer id,String text,String doing,HttpServletResponse response){

        if ("通过".equals(doing)){
            transportationService.examineSchool(id,text,3);
        }else {
            transportationService.examineSchool(id,text,5);
        }

        return "Success";
    }


    /**
     * 审核教练（修改状态，插入审核结果）
     * @param response
     * @return
     */
    @RequestMapping("/examineCoach")
    @ResponseBody
    public String examineCoach(Integer id,String text,String doing,HttpServletResponse response){

        if ("通过".equals(doing)){
            transportationService.examineCoach(id,text,1);
        }else {
            transportationService.examineCoach(id,text,6);
        }


        return "Success";
    }


    /**
     * 审核教练车（修改状态，插入审核结果）
     * @param response
     * @return
     */
    @RequestMapping("/examineCoachCar")
    @ResponseBody
    public String examineCoachCar(Integer id,String text,String doing,HttpServletResponse response){

        if ("通过".equals(doing)){
            transportationService.examineCoachCar(id,text,"审核通过");
        }else {
            transportationService.examineCoachCar(id,text,"审核失败");
        }


        return "Success";
    }

    /**
     * 获取学校列表
     * @param response
     * @return
     */
    @RequestMapping("/getSchoolTbl")
    @ResponseBody
    public String getSchoolTbl(Integer page, Integer limit ,String state,String name,HttpServletResponse response){
       // 设置浏览器字符集编码.
       response.setHeader("Content-Type","text/html;charset=UTF-8");
        // 设置response的缓冲区的编码.
        response.setCharacterEncoding("UTF-8");

        ObjectResult objectResult=transportationService.getSchoolTbl(page,limit ,state,name);

        return g.toJson(objectResult);
    }

    /**
     * 获取学校的筛选条件，打开学校表
     * @param request
     * @return
     */
    @RequestMapping("/gASN")
    public String getAllSchoolNameAndState(HttpServletRequest request){

        List<School> schools =transportationService.getSchoolList();

        Map<Integer,String>  map=transportationService.getSchoolState();

        if (schools!=null){
            request.setAttribute("schools",schools);
        }

        if (map!=null){
            request.setAttribute("stateMap",map);
        }

        return "transportation/jsp/SchoolTbl";
    }

    /**
     * 获取学校的筛选条件，打开教练表
     * @param request
     * @return
     */
    @RequestMapping("/gASC")
    public String getAllSchoolNameAndCoachState(HttpServletRequest request){

        List<School> schools =transportationService.getSchoolList();

        Map<Integer,String>  map=transportationService.getCoachState();

        if (schools!=null){
            request.setAttribute("schools",schools);
        }

        if (map!=null){
            request.setAttribute("stateMap",map);
        }

        return "transportation/jsp/CoachTbl";
    }

    /**
     * 获取学校的筛选条件，打开教练车表
     * @param request
     * @return
     */
    @RequestMapping("/gASB")
    public String getAllSchoolNameByCoachCar(HttpServletRequest request){

        List<School> schools =transportationService.getSchoolList();

        if (schools!=null){
            request.setAttribute("schools",schools);
        }

        return "transportation/jsp/CoachCarTbl";
    }

    /**
     * 获取教练表
     * @param page
     * @param limit
     * @param school
     * @param name
     * @param sex
     * @param type
     * @param response
     * @return
     */
    @RequestMapping("/getCoachTbl")
    @ResponseBody
    public String getCoachTbl(Integer page, Integer limit ,String school,String name,String sex,String type,HttpServletResponse response){
        // 设置浏览器字符集编码.
        response.setHeader("Content-Type","text/html;charset=UTF-8");
        // 设置response的缓冲区的编码.
        response.setCharacterEncoding("UTF-8");

        ObjectResult objectResult=transportationService.getCoachTbl(page,limit,name,sex,type,school);

        return g.toJson(objectResult);
    }

    /**
     * 获取教练车表
     * @param page
     * @param limit
     * @param school
     * @param name
     * @param type
     * @param response
     * @return
     */
    @RequestMapping("/getCoachCarTbl")
    @ResponseBody
    public String getCoachCarTbl(Integer page, Integer limit ,String school,String name,String type,HttpServletResponse response){
        // 设置浏览器字符集编码.
        response.setHeader("Content-Type","text/html;charset=UTF-8");
        // 设置response的缓冲区的编码.
        response.setCharacterEncoding("UTF-8");

        ObjectResult objectResult=transportationService.getCoachCarTbl(page,limit,name,type,school);

        System.out.println(objectResult);

        return g.toJson(objectResult);
    }

    /**
     * 插入考试时间配置
     * @param end
     * @param response
     * @return
     */
    @RequestMapping("/insertExamTime")
    @ResponseBody
    public String insertExamTime(String start,String end,String sid,String scolor, HttpServletResponse response){

        System.out.println(sid);
        System.out.println(start);
        System.out.println(end);
        System.out.println(scolor);
        //验证后台时间是否有包含，如果有的话合并，没有的话新搞一条出来

        Integer num=transportationService.insertExamTime(start,end,sid,scolor);

        return "";
    }

    /**
     * 删除考试时间配置
     * @param response
     * @return
     */
    @RequestMapping("/deleteExamTime")
    @ResponseBody
    public String deleteExamTime(String stitle,Integer tid, HttpServletResponse response){

        System.out.println(stitle);
        System.out.println(tid);

        //验证后台时间是否有包含，如果有的话合并，没有的话新搞一条出来

        Integer num=transportationService.deleteExamTime(tid);

        return "";
    }


    /**
     * 获取考试时段后台数据
     * @param response
     * @return
     * @throws IOException
     */
    @RequestMapping("/getExamTime")
    @ResponseBody
    public String getExamTime( HttpServletResponse response) throws IOException {

        List<TestTime> testTimes=transportationService.getExamTime();

        System.out.println(testTimes);

        return g.toJson(testTimes);
    }

    /**
     * 记载日历插件页面
     * @param request
     * @param response
     * @return
     * @throws IOException
     */
    @RequestMapping("/gSGH")
    public String getSchoolGiveHtml( HttpServletRequest request,HttpServletResponse response) throws IOException {

        // 设置浏览器字符集编码.
        response.setHeader("Content-Type","text/html;charset=UTF-8");
        // 设置response的缓冲区的编码.
        response.setCharacterEncoding("UTF-8");

        List<School> schools=transportationService.getSchoolList();

        request.getSession().setAttribute("school",schools);

        return "transportation/jsp/FullCalendar";
    }


    /**
     * 图表统计各阶段学员人数
     * @param request
     * @param response
     * @return
     * @throws IOException
     */
    @RequestMapping("/Statistics")
    @ResponseBody
    public List Statistics(HttpServletRequest request, HttpServletResponse response) throws IOException {

        List list= transportationService.countStatistics();
        System.out.println("list=="+list.toString());
        if (list!=null){
            return list;
        }
        return null;
    }

    /**
     * 处理驾校的限制
     * @param request
     * @param response
     * @return
     * @throws IOException
     */
    @RequestMapping("/stopSchool")
    @ResponseBody
    public String stopSchool(Integer id,String content ,String result,String doing,HttpServletRequest request, HttpServletResponse response) throws IOException {

        if ("禁止".equals(doing)){
            transportationService.stopApply(id,content,result,1);
        }else if ("封停".equals(doing)){
            transportationService.stopDoing(id,content,result,2);
        }else if ("解禁".equals(doing)){
            transportationService.relieveApply(id,3);
        }else if ("解封".equals(doing)){
            transportationService.relieveDoing(id,3);
        }

        return "Success";

    }

    /**
     * 获取驾校违规列表
     * @param request
     * @param response
     * @return
     * @throws IOException
     */
    @RequestMapping("/punishTable")
    @ResponseBody
    public String punishTable(Integer page, Integer limit ,String time1,String time2,HttpServletRequest request, HttpServletResponse response) throws IOException {

        // 设置浏览器字符集编码.
        response.setHeader("Content-Type","text/html;charset=UTF-8");
        // 设置response的缓冲区的编码.
        response.setCharacterEncoding("UTF-8");

        ObjectResult objectResult=transportationService.punishTable(page,limit,time1,time2);

        System.out.println(objectResult);

        return g.toJson(objectResult);

    }

    /**
     * 删除违规记录
     * @param id
     * @param request
     * @param response
     * @return
     * @throws IOException
     */
    @RequestMapping("/deletePunish")
    @ResponseBody
    public String deletePunish(Integer id,HttpServletRequest request, HttpServletResponse response) throws IOException {

        transportationService.deletePunish(id);

        return "Success";

    }


    /**
     * 学校学员人数统计
     * @param request
     * @param response
     * @return
     */
    @RequestMapping("/schoolStudentView")
    @ResponseBody
    public Map<String,List<String>> schoolStudentView(HttpServletRequest request, HttpServletResponse response){

        return transportationService.schoolStudentView();

    }

    /**
     * 加载预约页面
     * @param request
     * @param response
     * @return
     */
    @RequestMapping("/getAT")
    public String getAT(HttpServletRequest request, HttpServletResponse response){

        List<School> schools =transportationService.getSchoolList();

        if (schools!=null){
            request.setAttribute("schools",schools);
        }


        return "transportation/jsp/AppointTest";
    }


    /**
     * 获取预约列表
     * @param request
     * @param response
     * @return
     */
    @RequestMapping("/getAppointTest")
    @ResponseBody
    public String getAppointTest(Integer page,Integer limit,String id,HttpServletRequest request, HttpServletResponse response){
        // 设置浏览器字符集编码.
        response.setHeader("Content-Type","text/html;charset=UTF-8");
        // 设置response的缓冲区的编码.
        response.setCharacterEncoding("UTF-8");

        ObjectResult objectResult=transportationService.getAppointTest(page,limit,id);

        System.out.println(objectResult);

        return g.toJson(objectResult);

    }


    /**
     * 审核预约
     * @param response
     * @return
     */
    @RequestMapping("/auditAppoint")
    @ResponseBody
    public String auditAppoint(Integer id,String doing,String name,Integer studentId ,HttpServletResponse response){

        System.out.println("name=="+name);
        System.out.println("studentId=="+studentId);
            transportationService.auditAppoint(id,doing,name,studentId);

        return "Success";
    }


    /**
     * 注销登录
     * @param request
     * @param response
     * @return
     * @throws IOException
     */
    @RequestMapping("/deleteAdmin")
    public String deleteAdmin(HttpServletRequest request, HttpServletResponse response) throws IOException {

        System.out.println("注销方法");
        //获取sesson对象
        HttpSession hs = request.getSession();
        //注销
        hs.invalidate();
        //返回页面
        return "/transportation/jsp/TransportationLogin";
    }



	/**
	 * 获取公告列表
	 * @return
	 */
	@RequestMapping("/getNotice")
	@ResponseBody
	public String getNotice(Integer page, Integer limit, String title , String date, String type, HttpServletResponse response){

		// 设置浏览器字符集编码.
		response.setHeader("Content-Type","text/html;charset=UTF-8");
		// 设置response的缓冲区的编码.
		response.setCharacterEncoding("UTF-8");

        System.out.println("data:"+page+"---"+limit+"---"+title+"---"+date+"---"+type);
		ObjectResult objectResult = transportationService.getNotice(page, limit, title, date, type);

//        System.out.println("tmc:"+objectResult);

		return g.toJson(objectResult);
	}

	/**
	 * 获取公告列表类型
	 * @return
	 */
	@RequestMapping("/getNoticeType")
	@ResponseBody
	public String getNoticeType(HttpServletResponse response){

		// 设置浏览器字符集编码.
		response.setHeader("Content-Type","text/html;charset=UTF-8");
		// 设置response的缓冲区的编码.
		response.setCharacterEncoding("UTF-8");

		List<?> noticeType = transportationService.getNoticeType();
		System.out.println("type:"+noticeType);

		//        System.out.println("tmc:"+objectResult);

		return g.toJson(noticeType);
	}

	/**
	 * 删除通告
	 * @param notice
	 * @param response
	 * @return
	 */
	@RequestMapping("/deleteNotice")
	@ResponseBody
	public String deleteNotice(String notice, HttpServletResponse response,HttpServletRequest request){

		// 设置浏览器字符集编码.
		response.setHeader("Content-Type","text/html;charset=UTF-8");
		// 设置response的缓冲区的编码.
		response.setCharacterEncoding("UTF-8");

		Notice message = g.fromJson(notice, Notice.class);
		System.out.println(message);
		request.getSession().setAttribute("Notice",transportationService.deleteNotice(message));
		System.out.println("删除成功");
		return "";
	}


	/**
	 * 更新通告信息
	 * @param notice
	 * @param response
	 * @return
	 */
	@RequestMapping("/updateNotice")
	@ResponseBody
	public String updateNotice(String notice,HttpServletResponse response,HttpServletRequest request){
		System.out.println("updateNotice");
		// 设置浏览器字符集编码.
		response.setHeader("Content-Type","text/html;charset=UTF-8");
		// 设置response的缓冲区的编码.
		response.setCharacterEncoding("UTF-8");

		Notice updatenotice = g.fromJson(notice, Notice.class);
		System.out.println("update:"+updatenotice);

		request.getSession().setAttribute("Notice",transportationService.updateNoticeMsg(updatenotice));

		return "";
	}

	/**
	 * 获取题目信息
	 * @param notice
	 * @param response
	 * @param request
	 * @return
	 */
	@RequestMapping("/getNoticeMsg")
	@ResponseBody
	public String getNoticeMsg(String notice,HttpServletResponse response,HttpServletRequest request){

		// 设置浏览器字符集编码.
		response.setHeader("Content-Type","text/html;charset=UTF-8");
		// 设置response的缓冲区的编码.
		response.setCharacterEncoding("UTF-8");

		Notice noticemsg = g.fromJson(notice, Notice.class);

		request.getSession().setAttribute("noticemsg",transportationService.getNoticeMsg(noticemsg));
		System.out.println(transportationService.getNoticeMsg(noticemsg));

		return "";
	}

	/**
	 * 增加通告信息
	 * @param notice
	 * @param response
	 * @return
	 */
	@RequestMapping("/saveNotice")
	@ResponseBody
	public String saveNotice(Notice notice,HttpServletResponse response,HttpServletRequest request){
		System.out.println("saveNotice");
		// 设置浏览器字符集编码.
		response.setHeader("Content-Type","text/html;charset=UTF-8");
		// 设置response的缓冲区的编码.
		response.setCharacterEncoding("UTF-8");
		System.out.println("get:"+notice);
//		Notice addNotice = g.fromJson(notice, Notice.class);

		request.getSession().setAttribute("Notice",transportationService.insertNotice(notice));

		return "";
	}


    /**
     * 文件下载
     * @param id
     * @return
     * @throws IOException
     */
    @RequestMapping("/down")
    @ResponseBody//ajax返回值json格式转换
//    @Log(operationType = "下载操作", operationName = "下载文件")
    public ResponseEntity<byte[]> downDocumentInf(String id,HttpServletRequest request) throws IOException {
       School school= transportationService.getSchoolUrl(Integer.valueOf(id.trim()));
        String savePath = request.getSession().getServletContext().getRealPath("/");
        String projectPath = savePath  + school.getInformation();
        System.out.println("路径=="+projectPath);
        String extension = FilenameUtils.getExtension(school.getInformation());
        String name =school.getName()+"."+extension;
        File file=new File(projectPath);
        //设置HttpHeaders,使得浏览器响应下载
        HttpHeaders headers = new HttpHeaders();
        //为了解决中文名称乱码问题
        String fileName=new String(name.getBytes("UTF-8"),"iso-8859-1");
        //设置响应文件 attachment附件的意思
        headers.setContentDispositionFormData("attachment", fileName);
        //设置响应方式  APPLICATION_OCTET_STREAM 二进制流数据（如常见的文件下载）
        headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
        //把文件以二进制形式写回
        return new ResponseEntity<byte[]>(FileUtils.readFileToByteArray(file),
                headers, HttpStatus.CREATED);

    }

}
