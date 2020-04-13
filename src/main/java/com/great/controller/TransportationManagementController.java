package com.great.controller;


import com.google.gson.Gson;
import com.great.entity.Notice;
import com.great.entity.ObjectResult;
import com.great.entity.Subject;
import com.great.entity.Transportation;
import com.great.service.TransportationService;
import com.great.service.serviceimpl.TransportationServiceImp;
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
import java.io.IOException;
import java.util.Date;
import java.util.List;
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
     * 学员信息表
     * @param page
     * @param limit
     * @param state
     * @param name
     * @param response
     * @return
     */
    @RequestMapping("/getStudentTbl")
    @ResponseBody
    public String getStudentTbl(Integer page, Integer limit ,String state,String name,HttpServletResponse response){

        // 设置浏览器字符集编码.
        response.setHeader("Content-Type","text/html;charset=UTF-8");
        // 设置response的缓冲区的编码.
        response.setCharacterEncoding("UTF-8");

        ObjectResult objectResult=transportationService.getStudentTbl(page,limit ,state,name);

        return g.toJson(objectResult);
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
	 * 获取公告列表
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

		// 设置浏览器字符集编码.
		response.setHeader("Content-Type","text/html;charset=UTF-8");
		// 设置response的缓冲区的编码.
		response.setCharacterEncoding("UTF-8");

		Notice updatenotice = g.fromJson(notice, Notice.class);
		System.out.println(updatenotice);

		request.getSession().setAttribute("Subject",transportationService.updateNoticeMsg(updatenotice));

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
	 * 更新通告信息
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

//		request.getSession().setAttribute("Subject",transportationService.updateNoticeMsg(updatenotice));

		return "";
	}

}
