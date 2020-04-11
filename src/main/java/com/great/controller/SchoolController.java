package com.great.controller;


import com.google.gson.Gson;
import com.great.entity.*;
//import com.great.service.MyService;
import com.great.service.SchoolManageService;
import com.great.service.TransportationService;
import com.great.utils.ExcelCreate;
import com.great.utils.ExcelUtils;
import com.great.utils.ExportExcelSeedBack;
import com.great.utils.IDNumber;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.DateUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.imageio.ImageIO;
import javax.servlet.ServletContext;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.*;
import java.net.URLEncoder;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.*;
import java.util.List;

@Controller
@RequestMapping("/school")//@RequestMapping：可以为控制器指定处理可以请求哪些URL请求。
public class SchoolController {
    Gson g = new Gson();
    private Random random = new Random();
    @Autowired
    private SchoolManageService schoolAdminService;
    @Resource
    private TransportationService transportationService;
    @Autowired
    private DateTable dateTable;

//    @RequestMapping("/index2")
//    public String index2(){
//        return "back/jsp/A";
//    }
    //地址映射,path是个方法名,可以随便改动,{url}是参数
    @RequestMapping("/path/{url}")
    public String getUrl(@PathVariable(value = "url") String path){
        return "/school/jsp/" +path;
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
    public void Login(SchoolAdmin schoolAdmin , HttpServletRequest request, HttpServletResponse response) throws IOException {
        String YZM = (String)request.getSession().getAttribute("vcode");//拿到验证码
        Boolean confirm = schoolAdmin.getVerification().equalsIgnoreCase(YZM);//不区分大小写
        if (confirm) {
            SchoolAdmin admin =schoolAdminService.login(schoolAdmin.getAccount(),schoolAdmin.getPwd());
            if (null!=admin){
                request.getSession().setAttribute("SchoolAdmin",admin);
                response.getWriter().print("success");
            }else{
                response.getWriter().print("error");
            }
        }else{
            response.getWriter().print("yzm");
        }

    }

    //注销登录
    @RequestMapping("/deleteAdmin")
    public String deleteAdmin(HttpServletRequest request, HttpServletResponse response) throws IOException {

        System.out.println("注销方法");
        //获取sesson对象
        HttpSession hs = request.getSession();
        //注销
        hs.invalidate();
        //返回页面
        return "school/jsp/SchoolLogin";
    }

    //获取驾校管理信息表格显示
    @RequestMapping("/SchoolAdminTable")
    @ResponseBody//ajax返回值json格式转换
    public DateTable SchoolAdminTable(TableUtils utils, HttpServletRequest request, HttpServletResponse response) throws IOException {
        Integer page= Integer.parseInt(request.getParameter("page"));
        Integer limit= Integer.parseInt(request.getParameter("limit"));
        utils.setMinLimit((page-1)*limit);
        utils.setMaxLimit(limit);
//        System.out.println("utils=="+utils.toString());
        Map map = (Map) schoolAdminService.getSchoolAdminTable(utils);
        if (null!=map.get("list")){
            dateTable.setData((List<?>) map.get("list"));
            dateTable.setCode(0);
            dateTable.setCount((Integer) map.get("count"));//总条数
            return dateTable;
        }
        return null;
    }

    //删除用户
    @RequestMapping("/deleteSchoolAdmin")
//    @Log(operationType = "删除操作", operationName = "删除上传文档")
    public void deleteSchoolAdmin(SchoolAdmin schoolAdmin,  HttpServletResponse response) throws IOException {
        Integer a = schoolAdminService.deleteSchoolAdmin(schoolAdmin.getId());
        if (1==a){
            response.getWriter().print("success");
        }else{
            response.getWriter().print("error");
        }
    }

    //更新用户信息
    @RequestMapping("/UpdateSchoolAdmin")
    public void UpdateSchoolAdmin(SchoolAdmin admin,HttpServletRequest request, HttpServletResponse response) throws IOException, SQLException {
        System.out.println("admin=="+admin.toString());
        Integer a= schoolAdminService.updateSchoolAdmin(admin);
        if (1==a){
            response.getWriter().print("1111");
        }else{
            response.getWriter().print("2222");
        }
    }

    //判断用户名是否被注册
    @RequestMapping("/CheckAccount")
    public void CheckAccount(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String account = request.getParameter("name");
        if (null!=account||!"".equals(account)){
            Integer a = schoolAdminService.CheckAccount(account);
            if (1>a){
                response.getWriter().print("1111");
            }else{
                response.getWriter().print("2222");
            }
        }
    }

    //新增用户
    @RequestMapping("/addSchoolAdmin")
    public void addSchoolAdmin(SchoolAdmin admin, HttpServletRequest request, HttpServletResponse response) throws IOException {
        SchoolAdmin schoolAdmin = (SchoolAdmin) request.getSession().getAttribute("SchoolAdmin");
        admin.setSchool_state_id(3);
        admin.setSchool_id(schoolAdmin.getSchool_id());
        admin.setTime(new Date());//获取当前系统时间
        Integer a  =schoolAdminService.addSchoolAdmin(admin);
        if (0<a){
            response.getWriter().print("success");
        }else{
            response.getWriter().print("error");
        }

    }


    //获取教练信息表格显示
    @RequestMapping("/SchoolCoachTable")
    @ResponseBody//ajax返回值json格式转换
    public DateTable SchoolCoachTable(TableUtils utils, HttpServletRequest request, HttpServletResponse response) throws IOException {
        Integer page= Integer.parseInt(request.getParameter("page"));
        Integer limit= Integer.parseInt(request.getParameter("limit"));
        utils.setMinLimit((page-1)*limit);
        utils.setMaxLimit(limit);
        Map map = (Map) schoolAdminService.getSchoolCoachTable(utils);
        if (null!=map.get("list")){
            dateTable.setData((List<?>) map.get("list"));
            dateTable.setCode(0);
            dateTable.setCount((Integer) map.get("count"));//总条数
            return dateTable;
        }
        return null;
    }

    //更新教练信息
    @RequestMapping("/UpdateCoach")
    public void UpdateCoach(Coach coach, HttpServletRequest request, HttpServletResponse response) throws IOException, SQLException {
        Integer a= schoolAdminService.updateCoach(coach);
        if (1==a){
            response.getWriter().print("1111");
        }else{
            response.getWriter().print("2222");
        }
    }

    //删除教练
    @RequestMapping("/deleteCount")
//    @Log(operationType = "删除操作", operationName = "删除上传文档")
    public void deleteCount(Coach coach,  HttpServletResponse response) throws IOException {
        Integer a = schoolAdminService.deleteCount(coach.getId());
        if (1==a){
            response.getWriter().print("success");
        }else{
            response.getWriter().print("error");
        }
    }

    //判断教练账号是否被注册
    @RequestMapping("/CheckCoachAccount")
    public void CheckCoachAccount(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String account = request.getParameter("name");
        if (null!=account||!"".equals(account)){
            Integer a = schoolAdminService.CheckCoachAccount(account);
            if (1>a){
                response.getWriter().print("1111");
            }else{
                response.getWriter().print("2222");
            }
        }
    }

    //新增教练
    @RequestMapping("/addCoach")
    public void addCoach(Coach coach, HttpServletRequest request, HttpServletResponse response) throws IOException {

          SchoolAdmin schoolAdmin = (SchoolAdmin) request.getSession().getAttribute("SchoolAdmin");
          Boolean demo= IDNumber.isIDNumber(coach.getIdnumber());
          if (demo){
              coach.setCoach_state_id(4);
              coach.setSchool_id(schoolAdmin.getSchool_id());
              Integer a= schoolAdminService.addCoach(coach);
             if (0<a){
                 response.getWriter().print("success");
            }else{
                response.getWriter().print("error");
            }
          }else {
              response.getWriter().print("IdError");
          }

    }

    //以excel的形式导出所有教练信息
    @RequestMapping("/export")
    public void export( HttpServletRequest request, HttpServletResponse response) throws IOException {
        SchoolAdmin schoolAdmin = (SchoolAdmin) request.getSession().getAttribute("SchoolAdmin");
        schoolAdminService.findAllCoach(schoolAdmin.getSchool_id(),response);
//        Boolean demo= ExcelCreate.ExcelCreate(list,response);
//       if (demo){
//           response.getWriter().print("success");
//
////           response.getWriter().write("<script>alert('导出成功！'); window.location='/WEB-INF/A.jsp'; window.close();</script>");
//       }
    }

    /**
     * 获取学员状态信息
     * @param request
     * @return
     */
    @RequestMapping("/getStudentState")
    public String getStudentState(HttpServletRequest request){

        Map<Integer,String>  map=transportationService.getStudentState();
        if (map!=null){
            request.setAttribute("stateMap",map);
        }

        return "school/jsp/SchoolStudentManage";
    }


    //获取学员信息表格显示
    @RequestMapping("/SchoolStudentTable")
    @ResponseBody//ajax返回值json格式转换
    public DateTable SchoolStudentTable(TableUtils utils, HttpServletRequest request, HttpServletResponse response) throws IOException {
        Integer page= Integer.parseInt(request.getParameter("page"));
        Integer limit= Integer.parseInt(request.getParameter("limit"));
        utils.setMinLimit((page-1)*limit);
        utils.setMaxLimit(limit);
        Map map = (Map) schoolAdminService.getSchoolStudentTable(utils);
        if (null!=map.get("list")){
            dateTable.setData((List<?>) map.get("list"));
            dateTable.setCode(0);
            dateTable.setCount((Integer) map.get("count"));//总条数
            return dateTable;
        }
        return null;
    }

    //更新学员信息
    @RequestMapping("/UpdateStudent")
    public void UpdateStudent(Student student, HttpServletRequest request, HttpServletResponse response) throws IOException, SQLException {
        Integer a= schoolAdminService.updateStudent(student);
        if (1==a){
            response.getWriter().print("1111");
        }else{
            response.getWriter().print("2222");
        }
    }

    //删除学员
    @RequestMapping("/deleteStudent")
//    @Log(operationType = "删除操作", operationName = "删除上传文档")
    public void deleteStudent(Student student,  HttpServletResponse response) throws IOException {
        Integer a = schoolAdminService.deleteStudent(student.getId());
        if (1==a){
            response.getWriter().print("success");
        }else{
            response.getWriter().print("error");
        }
    }

    //判断学员账号是否被注册
    @RequestMapping("/CheckStudentAccount")
    public void CheckStudentAccount(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String account = request.getParameter("name");
        if (null!=account||!"".equals(account)){
            Integer a = schoolAdminService.CheckStudentAccount(account);
            if (1>a){
                response.getWriter().print("1111");
            }else{
                response.getWriter().print("2222");
            }
        }
    }

    //新增学员
    @RequestMapping("/addStudent")
    public void addStudent(MultipartFile file,Student student, HttpServletRequest request, HttpServletResponse response) throws IOException {

        SchoolAdmin schoolAdmin = (SchoolAdmin) request.getSession().getAttribute("SchoolAdmin");
        Boolean demo= IDNumber.isIDNumber(student.getIdNumber());
        String name= file.getOriginalFilename();
        System.out.println("文件名=="+name);
        if (demo){
            student.setStudent_state_id(5);
            student.setSchool_id(schoolAdmin.getSchool_id());
            Integer a= schoolAdminService.addStudent(student);
            if (0<a){
                response.getWriter().print("success");
            }else{
                response.getWriter().print("error");
            }
        }else {
            response.getWriter().print("IdError");
        }

    }

    @RequestMapping("/headImg")
    @ResponseBody
    public Object headImg(@RequestParam(value="file",required=false) MultipartFile file, HttpServletRequest request, HttpServletResponse response) throws Exception {
        String prefix="";
        String dateStr="";
        //保存上传
        OutputStream out = null;
        InputStream fileInput=null;
        try{
            if(file!=null){
                String originalName = file.getOriginalFilename();
                prefix=originalName.substring(originalName.lastIndexOf(".")+1);
//                dateStr = format.format(new Date());
                String filepath = request.getServletContext().getRealPath("/static")  + dateStr + "." + prefix;
                filepath = filepath.replace("\\", "/");
                File files=new File(filepath);
                //打印查看上传路径
                System.out.println(filepath);
                if(!files.getParentFile().exists()){
                    files.getParentFile().mkdirs();
                }
                file.transferTo(files);
            }
        }catch (Exception e){
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
        Map<String,Object> map2=new HashMap<>();
        Map<String,Object> map=new HashMap<>();
        map.put("code",0);
        map.put("msg","");
        map.put("data",map2);
        map2.put("src","../../../static" + dateStr + "." + prefix);
        return map;
    }

    /**
     * 学员信息ecxcel导入
     * @param file
     * @param request
     * @param response
     * @return
     */
    @RequestMapping("/ImportExcel")
    @ResponseBody
    public String ImportExcel(@RequestParam("file") MultipartFile file,HttpServletRequest request, HttpServletResponse response ) {

        String name = file.getOriginalFilename();
        if (name.length() < 6 || !name.substring(name.length() - 5).equals(".xlsx")) {
            return "文件格式错误";
        }
        List<Student> list = null;
        try {
            list = ExcelUtils.excelToShopIdList(file.getInputStream(),request);
            if (list == null || list.size() <= 0) {
                return "导入的数据为空";
            }
            //excel的数据保存到数据库
            try {
                for (Student student : list) {
                    System.out.println(student.toString());
                }
                schoolAdminService.insertStudentByExcel(list);
            } catch (Exception e) {
                System.out.println(e.getMessage());
                return e.getMessage();
            }

        } catch (Exception e) {
            System.out.println(e.getMessage());
            return e.getMessage();
        }
        return "保存成功";
    }

    @RequestMapping("/upload1")
    @ResponseBody
    public Object add( MultipartFile file, HttpServletRequest request) throws Exception {
        String name= file.getOriginalFilename();//是得到上传时的文件名。
        System.out.println("name="+name);


//        String pid = request.getParameter("pid");
//        String type = request.getParameter("type");
//        int t = Integer.parseInt(type);

//        Image i= new Image();
//        i.setType(type);
//        i.setPid(t);
//        imgMapper.add(i);
//        String folder = "img/";
//        if(type.equals("1")){
//            folder +="imgshow";
//        }
//        else{
//            folder +="imgDetail";
//        }
//        File  imageFolder= new File(request.getServletContext().getRealPath(folder));
//        File file = new File(imageFolder,pid+".jpg");
//        String fileName = file.getName();
//        if(!file.getParentFile().exists())
//            file.getParentFile().mkdirs();
//        try {
//            image.transferTo(file);
//            BufferedImage img = ImageUtil.change2jpg(file);
//            ImageIO.write(img, "jpg", file);
//        } catch (IOException e) {
//            e.printStackTrace();
//        }
        Map<String,Object> map=new HashMap<>();
        map.put("code",0);
        map.put("msg","");
        return map;
    }




    //获取教练车信息表格显示
    @RequestMapping("/SchoolCarTable")
    @ResponseBody//ajax返回值json格式转换
    public DateTable SchoolCarTable(TableUtils utils, HttpServletRequest request, HttpServletResponse response) throws IOException {
        Integer page= Integer.parseInt(request.getParameter("page"));
        Integer limit= Integer.parseInt(request.getParameter("limit"));
        utils.setMinLimit((page-1)*limit);
        utils.setMaxLimit(limit);
        Map map = (Map) schoolAdminService.getCarTable(utils);
        if (null!=map.get("list")){
            dateTable.setData((List<?>) map.get("list"));
            dateTable.setCode(0);
            dateTable.setCount((Integer) map.get("count"));//总条数
            return dateTable;
        }
        return null;
    }


    //查找驾校的所有信息
    @RequestMapping("/findCoach")
    public String findCoach(CoachCar coachCar, HttpServletRequest request, HttpServletResponse response) throws IOException, SQLException {
      SchoolAdmin schoolAdmin = (SchoolAdmin) request.getSession().getAttribute("SchoolAdmin");
        List<Coach> coach= schoolAdminService.findCoach(schoolAdmin.getSchool_id());
        if (coach!=null){
            request.setAttribute("Coach",coach);
        }
        return "school/jsp/UpdateCar";
    }

    //更新教练车信息
    @RequestMapping("/UpdateCar")
    public void UpdateCar(CoachCar coachCar, HttpServletRequest request, HttpServletResponse response) throws IOException, SQLException {
        System.out.println("coachCar="+coachCar.toString());
         Integer a= schoolAdminService.updateCar(coachCar);
        if (1==a){
            response.getWriter().print("1111");
        }else{
            response.getWriter().print("2222");
        }
    }

    //删除教练车
    @RequestMapping("/deleteCar")
//    @Log(operationType = "删除操作", operationName = "删除上传文档")
    public void deleteCar(Student student,  HttpServletResponse response) throws IOException {
        Integer a = schoolAdminService.deleteStudent(student.getId());
        if (1==a){
            response.getWriter().print("success");
        }else{
            response.getWriter().print("error");
        }
    }
}
