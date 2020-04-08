package com.great.controller;


import com.google.gson.Gson;
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
        return "/transportation/jsp/" +path;
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
    private Color getRandomColor()
    {
        int r = random.nextInt(256);
        int g = random.nextInt(256);
        int b = random.nextInt(256);
        return new Color(r, g, b);

    }


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

//    @RequestMapping("/menu")
//    public String menu(HttpServletRequest request, HttpSession hs){
//        User user = (User) request.getSession().getAttribute("admin");
//        hs.setAttribute("name",user.getName());
//        hs.setAttribute("roleType",user.getRole().getType());
//        Map<String, List<Menu>> menuMap =myService.FindMenuByRoleId(user.getRole().getRoleid());//拿到菜单
//        request.setAttribute("menuMap",menuMap);
//        return "back/jsp/sss";
//    }

    //注销登录
    @RequestMapping("/deleteAdmin")
    public String deleteAdmin(HttpServletRequest request, HttpServletResponse response) throws IOException {

        System.out.println("注销方法");
        //获取sesson对象
        HttpSession hs = request.getSession();
        //注销
        hs.invalidate();
        //返回页面
        return "back/jsp/login";
    }



}
