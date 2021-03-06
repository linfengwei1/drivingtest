package com.great.controller;


import com.google.gson.Gson;
import com.great.aoplog.Log;
import com.great.entity.*;
import com.great.service.SchoolManageService;
import com.great.service.TransportationService;
import com.great.utils.*;
import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;

import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.imageio.ImageIO;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.awt.*;
import java.awt.image.BufferedImage;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.*;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

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



    @RequestMapping("/index2")
    public String index2(){
        return "frontjsp/jsp/Welcome";
    }
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


    //普通登录
    @RequestMapping("/Login")
    @ResponseBody
    @Log(operationType = "登录操作", operationName = "普通登录")
    public String Login(SchoolAdmin schoolAdmin , HttpServletRequest request, HttpServletResponse response) throws IOException {
        String YZM = (String)request.getSession().getAttribute("vcode");//拿到验证码
        Boolean confirm = schoolAdmin.getVerification().equalsIgnoreCase(YZM);//不区分大小写
        if (confirm) {
            String PwdMd5 = MD5Utils.md5(schoolAdmin.getPwd());
            System.out.println("PwdMd5=="+PwdMd5);
            SchoolAdmin admin =schoolAdminService.login(schoolAdmin.getAccount(),PwdMd5);
            if (null!=admin){
                request.getSession().setAttribute("SchoolAdmin",admin);
                if (1!=admin.getSchool_state_id()&&3!=admin.getSchool_state_id()){
                    return "no";
                }
                return "success";
            }else{
                return "error";
            }
        }else{
            return "yzm";
        }

    }

    //人脸登录
    @RequestMapping("/faceLogin")
    @ResponseBody
    @Log(operationType = "登录操作", operationName = "人脸登录")
    public String faceLogin(String imageString , HttpServletRequest request, HttpServletResponse response) throws IOException {
        imageString = imageString.replaceAll(" ","+");
        String msg=  schoolAdminService.faceLogin(imageString,request);
        System.out.println("返回的msg=="+msg);
        return msg;
    }


    //人脸添加
    @RequestMapping("/faceAdd")
    @ResponseBody
    public String faceAdd(String imageString, HttpServletRequest request, HttpServletResponse response) throws IOException {
        SchoolAdmin schoolAdmin = (SchoolAdmin) request.getSession().getAttribute("SchoolAdmin");
        imageString = imageString.replaceAll(" ","+");
        String user_id = schoolAdmin.getId().toString();
        //user_id是在百度账号人脸识别库中的id,唯一的,可以在添加的时候把用户的id填进去,到时验证的时候用
        String msg = schoolAdminService.faceAdd(imageString,user_id);
        return msg;
    }



    //获取手机验证码
    @RequestMapping("/phoneMsg")
    public void phoneMsg(HttpServletRequest request, HttpServletResponse response) throws IOException {

        String msg = request.getParameter("phone");
        //判断手机号是否存在
        Integer a =schoolAdminService.CheckAdminPhone(msg);
        System.out.println("手机是否存在=="+a);
        if (0<a){
            if (null!=msg||!"".equals(msg.trim())){
                String phoneMsg = PhoneCode.getPhonemsg(msg);
                request.getSession().setAttribute("phoneMsg",phoneMsg);
                response.getWriter().print("success");
                //5分钟后移除存在域里的验证码
                HttpSession hs = request.getSession();
                //创建一个计时器
                final Timer timer=new Timer();
                //schedule(TimerTask t,Date time);改方法是指在指定的time时间内执行指定的任务
                timer.schedule(new TimerTask() {
                    @Override
                    public void run() {
                        hs.removeAttribute("phoneMsg");
                        System.out.println("checkCode删除成功");
                        timer.cancel();
                    }
                },5*60*1000);
            }
        }else {
            //手机号码不存在
            response.getWriter().print("no");
        }



    }
    //手机验证码更改密码
    @RequestMapping("/changePwdByPhone")
    public void changePwdByPhone(SchoolAdmin schoolAdmin, HttpServletRequest request, HttpServletResponse response) throws IOException {
         String phoneMsg = (String) request.getSession().getAttribute("phoneMsg");
        System.out.println("验证码="+phoneMsg);
        System.out.println("输入的值="+schoolAdmin.getPhoneMsg());
        //手机验证码不为空的情况
        if(null!=phoneMsg||!"".equals(phoneMsg)){
            //判断短信验证码是否一致
            if (phoneMsg.equals(schoolAdmin.getPhoneMsg())){
                String PwdMd5 =MD5Utils.md5(schoolAdmin.getPwd());
                schoolAdmin.setPwd(PwdMd5);
                //修改密码
                Integer b=schoolAdminService.changePwdByPhone(schoolAdmin);
                ajaxReturn(b,response); //结果返回封装
            }else {
                response.getWriter().print("error");
            }
        }else{
            //短信已失效
            response.getWriter().print("cancel");
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
//    @Log(operationType = "查询操作", operationName = "获取驾校管理信息表格")
    public DateTable SchoolAdminTable(TableUtils utils, HttpServletRequest request, HttpServletResponse response) throws IOException {
        Integer page= Integer.parseInt(request.getParameter("page"));
        Integer limit= Integer.parseInt(request.getParameter("limit"));
        utils.setMinLimit((page-1)*limit);
        utils.setMaxLimit(limit);
        SchoolAdmin schoolAdmin = (SchoolAdmin) request.getSession().getAttribute("SchoolAdmin");
        utils.setSchool_id(schoolAdmin.getSchool_id());
        Map map = (Map) schoolAdminService.getSchoolAdminTable(utils);
        if (null!=map.get("list")){
            System.out.println();
            dateTable.setData((List<?>) map.get("list"));
            dateTable.setCode(0);
            dateTable.setCount((Integer) map.get("count"));//总条数
            return dateTable;
        }
        return null;
    }

    //删除用户
    @RequestMapping("/deleteSchoolAdmin")
    @Log(operationType = "删除操作", operationName = "删除驾校管理员")
    public void deleteSchoolAdmin(SchoolAdmin schoolAdmin,HttpServletRequest request, HttpServletResponse response) throws IOException {
        SchoolAdmin schoolAdmin1 = (SchoolAdmin) request.getSession().getAttribute("SchoolAdmin");
        if (schoolAdmin1.getId()!=schoolAdmin.getId()){
            Integer a = schoolAdminService.deleteSchoolAdmin(schoolAdmin.getId());
            ajaxReturn(a,response);
        }else {
            response.getWriter().print("myself");
        }

    }

    //更新用户信息
    @RequestMapping("/UpdateSchoolAdmin")
//    @Log(operationType = "更新操作", operationName = "更新驾校管理员信息")
    public void UpdateSchoolAdmin(SchoolAdmin admin, HttpServletRequest request, HttpServletResponse response) throws IOException, SQLException {
        Integer a= schoolAdminService.updateSchoolAdmin(admin);
        ajaxReturn(a,response);
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

    //判断驾校手机是否被注册
    @RequestMapping("/CheckAdminPhone")
    @ResponseBody
    public String CheckAdminPhone(HttpServletRequest request, HttpServletResponse response) throws IOException {
      String phone = request.getParameter("phone");
        if (null!=phone||!"".equals(phone)){
            Integer a =schoolAdminService.CheckAdminPhone(phone);
            if (1>a){
                return "success";
            }
        }
        return "error";
    }

    //新增用户
    @RequestMapping("/addSchoolAdmin")
    @Log(operationType = "新增操作", operationName = "新增驾校管理员")
    public void addSchoolAdmin(SchoolAdmin admin, HttpServletRequest request, HttpServletResponse response) throws IOException {
        SchoolAdmin schoolAdmin = (SchoolAdmin) request.getSession().getAttribute("SchoolAdmin");
        admin.setSchool_state_id(3);
        String md5 = MD5Utils.md5(admin.getPwd());
        admin.setSchool_id(schoolAdmin.getSchool_id());
        admin.setTime(new Date());//获取当前系统时间
        admin.setPwd(md5);
        Integer a  =schoolAdminService.addSchoolAdmin(admin);
        ajaxReturn(a,response);

    }


    //获取教练信息表格显示
    @RequestMapping("/SchoolCoachTable")
    @ResponseBody//ajax返回值json格式转换
    public DateTable SchoolCoachTable(TableUtils utils, HttpServletRequest request, HttpServletResponse response) throws IOException {
        Integer page= Integer.parseInt(request.getParameter("page"));
        Integer limit= Integer.parseInt(request.getParameter("limit"));
        utils.setMinLimit((page-1)*limit);
        utils.setMaxLimit(limit);
        SchoolAdmin schoolAdmin = (SchoolAdmin) request.getSession().getAttribute("SchoolAdmin");
        utils.setSchool_id(Integer.valueOf(schoolAdmin.getSchool_id()));
        Map map = (Map) schoolAdminService.getSchoolCoachTable(utils);
        if (null!=map.get("list")){
            dateTable.setData((List<?>) map.get("list"));
            dateTable.setCode(0);
            dateTable.setCount((Integer) map.get("count"));//总条数
            return dateTable;
        }
        return null;
    }

    /**
     * 教练图片上传
     * @param file
     * @return
     * @throws Exception
     */
    @RequestMapping("/coachImage")
    @ResponseBody
    public Object coachImage( MultipartFile file, HttpServletRequest request) throws Exception {

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
//                String filepath = "E:/JAVA/kl/src/main/resources/static/images/"+ dateStr+File.separator + uuid+"." + prefix;
////                String filepath = "E:/JAVA/kl/src/main/resources/static/images/" + dateStr+File.separator+uuid+"." + prefix;
//                String filepath2 = System.getProperty("user.dir") +File.separator+"src"+File.separator+"mian"+File.separator+"resources"+File.separator+"static"+File.separator+"images"+ dateStr+File.separator+uuid+"." + prefix;
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

    //更新教练信息
    @RequestMapping("/UpdateCoach")
    public void UpdateCoach(Coach coach, HttpServletRequest request, HttpServletResponse response) throws IOException, SQLException {
        Integer a= schoolAdminService.updateCoach(coach);
        ajaxReturn(a,response);
    }


    //获取教练违规表格显示
    @RequestMapping("/PunishTable")
    @ResponseBody//ajax返回值json格式转换
    public DateTable PunishTable(TableUtils utils, HttpServletRequest request, HttpServletResponse response) throws IOException {
        Integer page= Integer.parseInt(request.getParameter("page"));
        Integer limit= Integer.parseInt(request.getParameter("limit"));
        utils.setMinLimit((page-1)*limit);
        utils.setMaxLimit(limit);
        SchoolAdmin schoolAdmin = (SchoolAdmin) request.getSession().getAttribute("SchoolAdmin");
        utils.setSchool_id(schoolAdmin.getSchool_id());
        Map map = (Map) schoolAdminService.getSchoolPunishTable(utils);
        if (null!=map.get("list")){
            dateTable.setData((List<?>) map.get("list"));
            dateTable.setCode(0);
            dateTable.setCount((Integer) map.get("count"));//总条数
            return dateTable;
        }
        return null;
    }

    //删除教练
    @RequestMapping("/deleteCoach")
//    @Log(operationType = "删除操作", operationName = "删除上传文档")
    public void deleteCoach( HttpServletRequest request,HttpServletResponse response) throws IOException {
        String id = request.getParameter("id");
        Integer a = schoolAdminService.deleteCount(Integer.valueOf(id));
        ajaxReturn(a,response);
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

    //在教练违规处理中把教练状态改成封停
    @RequestMapping("/coachStateByStop")
    public void coachStateByStop ( HttpServletResponse response, HttpServletRequest request) throws IOException {
        String id = request.getParameter("id");
        String cid = request.getParameter("cid");
        Integer a=schoolAdminService.coachStateByStop(Integer.valueOf(id),Integer.valueOf(cid));
        ajaxReturn(a,response); //结果返回封装

    }

    //在教练违规处理中把教练状态改成禁止报名
    @RequestMapping("/coachStateByNo")
    public void coachStateByNo ( HttpServletResponse response, HttpServletRequest request) throws IOException {
        String id = request.getParameter("id");
        String cid = request.getParameter("cid");
        Integer a=schoolAdminService.coachStateByNo(Integer.valueOf(id),Integer.valueOf(cid));
        ajaxReturn(a,response); //结果返回封装

    }


    //新增教练
    @RequestMapping("/addCoach")
    public void addCoach(Coach coach, HttpServletRequest request, HttpServletResponse response) throws IOException {


        SchoolAdmin schoolAdmin = (SchoolAdmin) request.getSession().getAttribute("SchoolAdmin");
          Boolean demo= IDNumber.isIDNumber(coach.getIdnumber());
          if (demo){
              coach.setCoach_state_id(4);
              String md5 = MD5Utils.md5(coach.getPwd());
              coach.setPwd(md5);
              coach.setSchool_id(schoolAdmin.getSchool_id());
              Integer a= schoolAdminService.addCoach(coach);
              ajaxReturn(a,response);
          }else {
              response.getWriter().print("IdError");
          }

    }

    /**
     * 教练信息ecxcel导入
     * @param file
     * @param request
     * @param response
     * @return
     */
    @RequestMapping("/AddCoachByExcel")
    @ResponseBody
    public Object AddCoachByExcel(@RequestParam("file") MultipartFile file,HttpServletRequest request, HttpServletResponse response ) {

        String name = file.getOriginalFilename();//得到文件名
        Map<String,Object> map=new HashMap<>();

        if (name.length() < 6 || !name.substring(name.length() - 5).equals(".xlsx")) {
            return "{\"code\":2, \"msg\":\"\", \"data\":{}}";
        }
        List<Coach> list = null;
        try {
            list= CoachExcelImport.excelToShopIdList(file.getInputStream(),request);
            if (list == null || list.size() <= 0) {
                return "{\"code\":3, \"msg\":\"\", \"data\":{}}";
            }

            try {
                //判断excel里的账号是否有重复的
                List<String> list3 = new ArrayList<>();
                for (int i =0;i<list.size();i++){
                    list3.add(list.get(i).getAccount());
                }
                boolean isRepeat = list3.size() != new HashSet<String>(list3).size();
                if (isRepeat){
                    return "{\"code\":5, \"msg\":\"\", \"data\":{}}";
                }
                //excel的数据保存到数据库
              List list1 = schoolAdminService.insertCoachByExcel(list);

                //把重复的账号取出来，现在在页面上
                if (null!=list1){
                    map.put("code",4);
                    map.put("msg","");
                    map.put("data",list1);
                    return map;
                }
            } catch (Exception e) {
                e.printStackTrace();
                return "{\"code\":1, \"msg\":\"\", \"data\":{}}";
            }
        } catch (Exception e) {
            e.printStackTrace();
            return "{\"code\":1, \"msg\":\"\", \"data\":{}}";
        }
        return "{\"code\":0, \"msg\":\"\", \"data\":{}}";
    }

    //以excel的形式导出所有教练信息
    @RequestMapping("/export")
    public void export( HttpServletRequest request, HttpServletResponse response) throws IOException {
        SchoolAdmin schoolAdmin = (SchoolAdmin) request.getSession().getAttribute("SchoolAdmin");
        schoolAdminService.findAllCoach(schoolAdmin.getSchool_id(),response);
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

    //获取学员预约信息表格显示
    @RequestMapping("/getAppointTbl")
    @ResponseBody//ajax返回值json格式转换
    public DateTable getAppointTbl(TableUtils utils, HttpServletRequest request, HttpServletResponse response) throws IOException {
        Integer page= Integer.parseInt(request.getParameter("page"));
        Integer limit= Integer.parseInt(request.getParameter("limit"));
        utils.setMinLimit((page-1)*limit);
        utils.setMaxLimit(limit);
        SchoolAdmin schoolAdmin = (SchoolAdmin) request.getSession().getAttribute("SchoolAdmin");
        utils.setSchool_id(schoolAdmin.getSchool_id());
        Map map = (Map) schoolAdminService.getAppointTbl(utils);
        if (null!=map.get("list")){
            dateTable.setData((List<?>) map.get("list"));
            dateTable.setCode(0);
            dateTable.setCount((Integer) map.get("count"));//总条数
            return dateTable;
        }
        return null;
    }


    /**
     * 审核预约
     * @param response
     * @return
     */
    @RequestMapping("/auditAppoint")
    @ResponseBody
    public String auditAppoint(Integer id,String doing,String name,Integer studentId ,HttpServletResponse response){

        schoolAdminService.auditAppoint(id,doing,name,studentId);
        return "Success";
    }


    //批量审批学员信息
    @RequestMapping("/batchProcessing")
    public void batchProcessing( HttpServletRequest request, HttpServletResponse response) throws IOException {
        List list = new ArrayList();
        Gson g = new Gson();
        AppointTest[] tree = g.fromJson(request.getParameter("data"), AppointTest[].class);
        for (int i = 0;i<tree.length;i++){
            list.add(tree[i].getId());
            Student s = new Student();
            s.setId(tree[i].getId());
        }
        Integer a = schoolAdminService.changeAppointState(list);
        if (tree.length==a){
            response.getWriter().print("success");
        }else{
            response.getWriter().print("error");
        }
    }

    //批量驳回学员信息
    @RequestMapping("/batchRejected")
    public void batchRejected(AppointTest appointTest, HttpServletRequest request, HttpServletResponse response) throws IOException {
        List list = new ArrayList();
        List<AppointTest> list2 = new ArrayList();
        Gson g = new Gson();
        AppointTest[] tree = g.fromJson(request.getParameter("data"), AppointTest[].class);
        for (int i = 0;i<tree.length;i++){
            list.add(tree[i].getId());
        }

        for (int i = 0;i<tree.length;i++){
            AppointTest appointTest1 = new AppointTest();
            appointTest1.setId(tree[i].getStudentId());
            appointTest1.setSubjectName(tree[i].getSubjectName());
            list2.add(appointTest1);
        }
        Integer a = schoolAdminService.batchRejected(list,list2);
        if (tree.length==a){
            response.getWriter().print("success");
        }else{
            response.getWriter().print("error");
        }
    }




    //获取学员信息表格显示
    @RequestMapping("/SchoolStudentTable")
    @ResponseBody//ajax返回值json格式转换
    public DateTable SchoolStudentTable(TableUtils utils, HttpServletRequest request, HttpServletResponse response) throws IOException {
        Integer page= Integer.parseInt(request.getParameter("page"));
        Integer limit= Integer.parseInt(request.getParameter("limit"));
        utils.setMinLimit((page-1)*limit);
        utils.setMaxLimit(limit);
        SchoolAdmin schoolAdmin = (SchoolAdmin) request.getSession().getAttribute("SchoolAdmin");
        utils.setSchool_id(schoolAdmin.getSchool_id());
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
        ajaxReturn(a,response);
    }

    //删除学员
    @RequestMapping("/deleteStudent")
    @Log(operationType = "删除操作", operationName = "删除学员")
    public void deleteStudent( HttpServletRequest request,HttpServletResponse response) throws IOException {
        Integer id = Integer.valueOf(request.getParameter("id"));
        Integer a = schoolAdminService.deleteStudent(id);
        ajaxReturn(a,response);
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



    //新增学员页面跳转
    @RequestMapping("/jumpAddStudent")
    public String jumpAddStudent( HttpServletRequest request, HttpServletResponse response) throws IOException, SQLException {
        SchoolAdmin schoolAdmin = (SchoolAdmin) request.getSession().getAttribute("SchoolAdmin");
        List<Coach> coach= schoolAdminService.findCoach(schoolAdmin.getSchool_id());
        if (coach!=null){
            request.setAttribute("Coach",coach);
        }
        return "school/jsp/AddStudent";
    }



    //新增学员
    @RequestMapping("/addStudent")
    public void addStudent(Student student, HttpServletRequest request, HttpServletResponse response) throws IOException {

        SchoolAdmin schoolAdmin = (SchoolAdmin) request.getSession().getAttribute("SchoolAdmin");
        Boolean demo= IDNumber.isIDNumber(student.getIdNumber());
        if (demo){
            student.setStudent_state_id(5);
            student.setSchool_id(schoolAdmin.getSchool_id());
            String md5 = MD5Utils.md5(student.getPwd());
            student.setPwd(md5);
            Student a= schoolAdminService.addStudent(student);
            if (0!=a.getId()){
                List<StudyCondition> list = new ArrayList<>();
                for (int i=1;i<5;i++){
                    StudyCondition s = new StudyCondition();
                    s.setSubject_id(i);
                    s.setTime(0);
                    s.setPractise_score(0);
                    s.setStudent_id(a.getId());
                    list.add(s);
                }
                schoolAdminService.addStudyCondition(list);
                response.getWriter().print("success");

            }else{
                response.getWriter().print("error");
            }
        }else {
            response.getWriter().print("IdError");
        }

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

            list = StudentExcelImport.excelToShopIdList(file.getInputStream(),request);
            if (list == null || list.size() <= 0) {
                return "导入的数据为空或表格填写不完整";
            }
            //excel的数据保存到数据库
            try {
                //判断excel里的账号是否有重复的
                List<String> list3 = new ArrayList<>();
                for (int i =0;i<list.size();i++){
                    list3.add(list.get(i).getAccount());
                }
                boolean isRepeat = list3.size() != new HashSet<String>(list3).size();
                if (isRepeat){
                    return "文件中存在账号重复,请检查后全部重新上传";
                }
              List<Student>lis1= schoolAdminService.insertStudentByExcel(list);
              if (lis1.get(0).getId()>0){
                  List<StudyCondition> list2 = new ArrayList<>();
                  for (int x=0;x<lis1.size();x++){
                      for (int i=1;i<5;i++){
                          StudyCondition s = new StudyCondition();
                          s.setSubject_id(i);
                          s.setPractise_score(0);
                          s.setTime(0);
                          s.setStudent_id(lis1.get(x).getId());
                          list2.add(s);
                      }
                  }
                  schoolAdminService.addStudyCondition(list2);//新增学员id插入学时表
              }else {
                  //把重复的账号取出来，现在在页面上
                  List list4 = new ArrayList();
                  for (int y=0;y<lis1.size();y++){
                      list4.add(lis1.get(y).getAccount());
                  }
                  return "插入失败,账号"+list4.toString()+"重复,请全部重新导入";
              }
            } catch (Exception e) {
                e.printStackTrace();
                return e.getMessage();
            }
        } catch (Exception e) {
            e.printStackTrace();
            return e.getMessage();
        }
        return "保存成功";
    }

    /**
     * 增加学员中的头像上传
     * @param file
     * @return
     * @throws Exception
     */
    @RequestMapping("/uploadImg")
    @ResponseBody
    public Object  add( MultipartFile file,HttpServletRequest request) throws Exception {
        Map<String,Object> map= (Map<String, Object>) coachImage(file,request);
        return map;
    }


    /**
     * 增加汽车中的头像上传
     * @param file
     * @return
     * @throws Exception
     */
    @RequestMapping("/carImage")
    @ResponseBody
    public Object  carImage( MultipartFile file,HttpServletRequest request) throws Exception {
        Map<String,Object> map= (Map<String, Object>) coachImage(file,request);
        return map;
    }

    public static void main(String[] args) {
//        String s = System.getProperty("user.dir")+File.separator+"src"+File.separator+"mian"+File.separator+"resources"+File.separator+"static"+File.separator+"images_dateStr"+File.separator;
//        System.out.println(System.getProperty("user.dir"));
//        System.out.println("s="+s);
//        String tomcat_path = System.getProperty("user.dir");
//        System.out.println("tomcat_path="+tomcat_path);
//        String pic_path;
//        //获取tomcat中项目同级路径
//        String bin_path = tomcat_path.substring(tomcat_path.lastIndexOf("/") + 1, tomcat_path.length());
//        System.out.println("bin_path="+bin_path);
//        if (("bin").equals(bin_path)) {
//            pic_path = tomcat_path.substring(0, System.getProperty("user.dir").lastIndexOf("/")) + "/webapps" + "/upload" + "/uploadImg/";
//            System.out.println(pic_path);
//        } else {
//            pic_path = tomcat_path + "/webapps" + "/upload" + "/uploadImg/";
//            System.out.println(pic_path);
//        }
//
//        String path = "http://47.96.112.105:8080/opt/tomcat/webapps/demo-0.0.1-SNAPSHOT";
//        System.out.println(path);



    }


    //完善学员信息上传头像
    @RequestMapping("/AddStudentImage")
    @ResponseBody
    public Object AddStudentImage( MultipartFile file, HttpServletRequest request) throws Exception {
        Integer id= Integer.valueOf(request.getParameter("id").trim())  ;
        Map<String,Object> map= (Map<String, Object>) coachImage(file,request);
        Object object = 0;
        if (object==map.get("code")){
            //拿到路径
            Map map1 = (Map) map.get("data");
            //插入图片路径
            Integer a =schoolAdminService.AddStudentImage(id, (String) map1.get("src"));
            //把信息不完善的状态改成待审核
            if (0<a){
                schoolAdminService.ChangeStudentState(id);
                Map<String,Object> map3=new HashMap<>();
                map.put("code",0);
                map.put("msg","");
                return map3;
            }
        }
        Map<String,Object> map3=new HashMap<>();
        map.put("code",1);
        map.put("msg","");
        return map3;
    }



    //获取教练车信息表格显示
    @RequestMapping("/SchoolCarTable")
    @ResponseBody//ajax返回值json格式转换
    public DateTable SchoolCarTable(TableUtils utils, HttpServletRequest request, HttpServletResponse response) throws IOException {
        Integer page= Integer.parseInt(request.getParameter("page"));
        Integer limit= Integer.parseInt(request.getParameter("limit"));
        utils.setMinLimit((page-1)*limit);
        utils.setMaxLimit(limit);
        SchoolAdmin schoolAdmin = (SchoolAdmin) request.getSession().getAttribute("SchoolAdmin");
        utils.setSchool_id(schoolAdmin.getSchool_id());
        Map map = (Map) schoolAdminService.getCarTable(utils);
        if (null!=map.get("list")){
            dateTable.setData((List<?>) map.get("list"));
            dateTable.setCode(0);
            dateTable.setCount((Integer) map.get("count"));//总条数
            return dateTable;
        }
        return null;
    }

    //完善教练车信息上传头像
    @RequestMapping("/AddCarImage")
    @ResponseBody
    public Object AddCarImage( MultipartFile file, HttpServletRequest request) throws Exception {
        Integer id= Integer.valueOf(request.getParameter("id").trim())  ;
        Map<String,Object> map= (Map<String, Object>) coachImage(file,request);
        Object object = 0;
        if (object==map.get("code")){
            //拿到路径
            Map map1 = (Map) map.get("data");
            //插入图片路径
            Integer a =schoolAdminService.AddCoachImage(id, (String) map1.get("src"));
            //把信息不完善的状态改成待审核
            if (0<a){
                schoolAdminService.ChangeCoachState(id);
                Map<String,Object> map3=new HashMap<>();
                map.put("code",0);
                map.put("msg","");
                return map3;
            }
        }
        Map<String,Object> map3=new HashMap<>();
        map.put("code",1);
        map.put("msg","");
        return map3;
    }


    //完善教练信息上传头像
    @RequestMapping("/AddCoachImage")
    @ResponseBody
    public Object AddCoachImage( MultipartFile file, HttpServletRequest request) throws Exception {
        Integer id= Integer.valueOf(request.getParameter("id").trim())  ;
        Map<String,Object> map= (Map<String, Object>) coachImage(file,request);
        Object object = 0;
        if (object==map.get("code")){
            //拿到路径
            Map map1 = (Map) map.get("data");
            //插入图片路径
            Integer a =schoolAdminService.AddCoachImage(id, (String) map1.get("src"));
            //把信息不完善的状态改成待审核
            if (0<a){
                schoolAdminService.ChangeCoachState(id);
                Map<String,Object> map3=new HashMap<>();
                map.put("code",0);
                map.put("msg","");
                return map3;
            }
        }
        Map<String,Object> map3=new HashMap<>();
        map.put("code",1);
        map.put("msg","");
        return map3;
    }

    /**
     *  根据驾校id查询教练的所有信息
     */
    @RequestMapping("/findCoach")
    public String findCoach( HttpServletRequest request, HttpServletResponse response) throws IOException, SQLException {
      SchoolAdmin schoolAdmin = (SchoolAdmin) request.getSession().getAttribute("SchoolAdmin");
        List<Coach> coach= schoolAdminService.findCoach(schoolAdmin.getSchool_id());
        if (coach!=null){
            request.setAttribute("Coach",coach);
        }
        return "school/jsp/UpdateCar";
    }

    /**
     * 获取个人教练详情信息
     * @param response
     * @return
     */
    @RequestMapping("/getCoachMsg")
    public String getCoachMsg (HttpServletResponse response,HttpServletRequest request){
        Integer id = Integer.valueOf(request.getParameter("id").trim());
        // 设置浏览器字符集编码.
        response.setHeader("Content-Type","text/html;charset=UTF-8");
        // 设置response的缓冲区的编码.
        response.setCharacterEncoding("UTF-8");
        request.setAttribute("coach",transportationService.getCoachMsg(id));
        return "school/jsp/CoachMsg";
    }


    /**
     * 更新教练车信息
     * @param coachCar
     * @param request
     * @param response
     * @throws IOException
     * @throws SQLException
     */
    @RequestMapping("/UpdateCar")
    public void UpdateCar(CoachCar coachCar, HttpServletRequest request, HttpServletResponse response) throws IOException, SQLException {
         Integer a= schoolAdminService.updateCar(coachCar);
         ajaxReturn(a,response);
    }


    /**
     * 删除教练车
     * @param request
     * @param response
     * @throws IOException
     */
    @RequestMapping("/deleteCar")
//    @Log(operationType = "删除操作", operationName = "删除上传文档")
    public void deleteCar( HttpServletRequest request, HttpServletResponse response) throws IOException {
       Integer id = Integer.parseInt( request.getParameter("id"));
        Integer a = schoolAdminService.deleteCar(id);
        ajaxReturn(a,response);
    }

    //跳转车辆新增页面
    @RequestMapping("/JumpAddCar")
    public String JumpAddCar(CoachCar coachCar, HttpServletRequest request, HttpServletResponse response) throws IOException, SQLException {
        SchoolAdmin schoolAdmin = (SchoolAdmin) request.getSession().getAttribute("SchoolAdmin");
        List<Coach> coach= schoolAdminService.findCoach(schoolAdmin.getSchool_id());
        if (coach!=null){
            request.setAttribute("Coach",coach);
        }
        return "school/jsp/AddCar";
    }

    //判断车牌号是否被使用
    @RequestMapping("/CheckCarNumber")
    public void CheckCarNumber(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String account = request.getParameter("name");
        if (null!=account||!"".equals(account)){
            Integer a = schoolAdminService.CheckCarNumber(account);
            if (1>a){
                response.getWriter().print("1111");
            }else{
                response.getWriter().print("2222");
            }
        }
    }
    //新增车辆
    @RequestMapping("/addCar")
    public void addCar(CoachCar coachCar, HttpServletRequest request, HttpServletResponse response) throws IOException {

        SchoolAdmin schoolAdmin = (SchoolAdmin) request.getSession().getAttribute("SchoolAdmin");
        coachCar.setCarState("待审核");
        coachCar.setSchool_id(schoolAdmin.getSchool_id());
        Integer a= schoolAdminService.addCar(coachCar);
        ajaxReturn(a,response); //结果返回封装
    }


    /**
     * 车辆信息ecxcel导入
     * @param file
     * @param request
     * @param response
     * @return
     */
    @RequestMapping("/AddCarByExcel")
    @ResponseBody
    public Object AddCarByExcel(@RequestParam("file") MultipartFile file,HttpServletRequest request, HttpServletResponse response ) {

        String name = file.getOriginalFilename();//得到文件名
        Map<String,Object> map=new HashMap<>();
        if (name.length() < 6 || !name.substring(name.length() - 5).equals(".xlsx")) {
            return "{\"code\":2, \"msg\":\"\", \"data\":{}}";
        }
        List<CoachCar> list = null;
        try {
            list= CarExcelImport.excelToShopIdList(file.getInputStream(),request);
            if (list == null || list.size() <= 0) {
                return "{\"code\":3, \"msg\":\"\", \"data\":{}}";
            }
            //excel的数据保存到数据库
            try {
                //判断excel里的账号是否有重复的
                List<String> list3 = new ArrayList<>();
                for (int i =0;i<list.size();i++){
                    list3.add(list.get(i).getCarNumber());
                }
                boolean isRepeat = list3.size() != new HashSet<String>(list3).size();
                if (isRepeat){
                    return "{\"code\":5, \"msg\":\"\", \"data\":{}}";
                }
             List list1 =schoolAdminService.insertCarByExcel(list);
                if (null!=list1){
                    map.put("code",4);
                    map.put("msg","");
                    map.put("data",list1);
                    return map;
                }
            } catch (Exception e) {
                System.out.println(e.getMessage());
                return "{\"code\":1, \"msg\":\"\", \"data\":{}}";
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return "{\"code\":1, \"msg\":\"\", \"data\":{}}";
        }
        return "{\"code\":0, \"msg\":\"\", \"data\":{}}";
    }


    //显示学员学时
    @RequestMapping("/findStudyTime")
    @ResponseBody
    public DateTable findStudyTime(HttpServletRequest request, HttpServletResponse response) throws IOException {
//        com.alibaba.druid.util.StringUtils.isEmpty()
       if (null!=request.getParameter("id")&&!"".equals(request.getParameter("id").trim())){
           Integer id = Integer.valueOf(request.getParameter("id"));
           System.out.println("学时id=="+ id);
           List<StudyCondition>list= schoolAdminService.findStudyTime(id);
           if (list!=null){
               dateTable.setData(list);
               dateTable.setCode(0);
               dateTable.setCount(4);//总条数
               return dateTable;
           }
       }
        return null;
    }

    //统计各阶段学员人数
    @RequestMapping("/Statistics")
    @ResponseBody
    public List Statistics(HttpServletRequest request, HttpServletResponse response) throws IOException {
        SchoolAdmin schoolAdmin = (SchoolAdmin) request.getSession().getAttribute("SchoolAdmin");
        List list= schoolAdminService.Count(schoolAdmin.getSchool_id());
        if (list!=null){
            return list;
        }
        return null;
    }

    //获取驾校信息
    @RequestMapping("/getSchoolInf")
    public String getSchoolInf(HttpServletRequest request, HttpServletResponse response) throws IOException {

        SchoolAdmin schoolAdmin = (SchoolAdmin) request.getSession().getAttribute("SchoolAdmin");
        List<School> list= schoolAdminService.getSchoolInf(schoolAdmin.getSchool_id());
        if (list!=null){
            request.setAttribute("List",list);
        }
        return "school/jsp/SchoolInf";
    }

    //获取驾校信息
    @RequestMapping("/updateSchoolInf")
    public void updateSchoolInf(School school, HttpServletRequest request, HttpServletResponse response) throws IOException {

        SchoolAdmin schoolAdmin = (SchoolAdmin) request.getSession().getAttribute("SchoolAdmin");
        school.setId(schoolAdmin.getId());
        Integer a= schoolAdminService.updateSchoolInf(school);
        ajaxReturn(a,response); //结果返回封装



    }

    //获取驾校评价表格显示
    @RequestMapping("/getEvaluation")
    @ResponseBody//ajax返回值json格式转换
    public DateTable getEvaluation(TableUtils utils, HttpServletRequest request, HttpServletResponse response) throws IOException {
        Integer page= Integer.parseInt(request.getParameter("page"));
        Integer limit= Integer.parseInt(request.getParameter("limit"));
        SchoolAdmin schoolAdmin = (SchoolAdmin) request.getSession().getAttribute("SchoolAdmin");
        utils.setSchool_id(schoolAdmin.getSchool_id());
        utils.setMinLimit((page-1)*limit);
        utils.setMaxLimit(limit);
        Map map = (Map) schoolAdminService.getEvaluation(utils);
        if (null!=map.get("list")){
            dateTable.setData((List<?>) map.get("list"));
            dateTable.setCode(0);
            dateTable.setCount((Integer) map.get("count"));//总条数
            return dateTable;
        }
        return null;
    }

    /**
     * 获取学员信息
     * @param response
     * @return
     */
    @RequestMapping("/getStudentMsg")
    public String getStudentMsg (HttpServletResponse response,HttpServletRequest request){
        Integer id = Integer.valueOf(request.getParameter("id").trim());

        // 设置浏览器字符集编码.
        response.setHeader("Content-Type","text/html;charset=UTF-8");
        // 设置response的缓冲区的编码.
        response.setCharacterEncoding("UTF-8");
        request.setAttribute("student",transportationService.getStudentMsg(id));
        return "school/jsp/StudentMsg";
    }


    //学员重新审核
    @RequestMapping("/studentResubmit")
    public void studentResubmit (HttpServletResponse response,HttpServletRequest request) throws IOException {
       Integer id =Integer.valueOf(request.getParameter("id").trim()) ;
        Integer a=schoolAdminService.ChangeStudentState(id);
        ajaxReturn(a,response); //结果返回封装

    }

    //教练重新审核
    @RequestMapping("/coachResubmit")
    public void coachCheck (HttpServletResponse response,HttpServletRequest request) throws IOException {
        Integer id =Integer.valueOf(request.getParameter("id").trim()) ;
        Integer a=schoolAdminService.ChangeCoachState(id);
        ajaxReturn(a,response); //结果返回封装

    }

    //汽车重新审核
    @RequestMapping("/carResubmit")
    public void carCheck (HttpServletResponse response,HttpServletRequest request) throws IOException {
        Integer id =Integer.valueOf(request.getParameter("id").trim()) ;
        Integer a=schoolAdminService.ChangeCarState(id);
        ajaxReturn(a,response); //结果返回封装
    }


    //获取日志表格显示
    @RequestMapping("/LogTable")
    @ResponseBody//ajax返回值json格式转换
    public DateTable LogTable(TableUtils utils, HttpServletRequest request, HttpServletResponse response) throws IOException {
        Integer page= Integer.parseInt(request.getParameter("page"));
        Integer limit= Integer.parseInt(request.getParameter("limit"));
        utils.setMinLimit((page-1)*limit);
        utils.setMaxLimit(limit);
        SchoolAdmin schoolAdmin = (SchoolAdmin) request.getSession().getAttribute("SchoolAdmin");
        utils.setSchool_id(schoolAdmin.getSchool_id());
        Map map = (Map) schoolAdminService.getSchoolLogTable(utils);
        if (null!=map.get("list")){
            dateTable.setData((List<?>) map.get("list"));
            dateTable.setCode(0);
            dateTable.setCount((Integer) map.get("count"));//总条数
            return dateTable;
        }
        return null;
    }

    //新增处罚页面跳转
    @RequestMapping("/jumpPunish")
    public String jumpPunish( HttpServletRequest request, HttpServletResponse response) throws IOException, SQLException {
        SchoolAdmin schoolAdmin = (SchoolAdmin) request.getSession().getAttribute("SchoolAdmin");
        List<Coach> coach= schoolAdminService.findCoach(schoolAdmin.getSchool_id());
        if (coach!=null){
            request.setAttribute("Coach",coach);
        }
        return "school/jsp/AddPunish";
    }


    //新增处罚
    @RequestMapping("/AddPunish")
    public void AddPunish(Punish punish, HttpServletRequest request, HttpServletResponse response) throws IOException, ParseException {
        SchoolAdmin schoolAdmin = (SchoolAdmin) request.getSession().getAttribute("SchoolAdmin");
        punish.setSchool_id(schoolAdmin.getSchool_id());
        Integer a= schoolAdminService.AddPunish(punish);
        ajaxReturn(a,response); //结果返回封装
    }

    //删除处罚
    @RequestMapping("/deletePunish")
    @Log(operationType = "删除操作", operationName = "删除处罚记录")
    public void deletePunish(String id,  HttpServletResponse response) throws IOException {
        Integer a = schoolAdminService.deletePunish(Integer.valueOf(id.trim()));
        ajaxReturn(a,response); //结果返回封装
    }

    //教练处罚记录改变状态
    @RequestMapping("/employPunish")
    @Log(operationType = "启用操作", operationName = "从处罚记录改为启用状态")
    public void employPunish( HttpServletRequest request,HttpServletResponse response) throws IOException {
        String id = request.getParameter("id");
        String cid = request.getParameter("cid");
        Integer a = schoolAdminService.updatePunish(Integer.valueOf(id),Integer.valueOf(cid));
        ajaxReturn(a,response); //结果返回封装
    }

    //结果返回封装
    public void ajaxReturn(Integer a,HttpServletResponse response) throws IOException {
        if (0<a){
            response.getWriter().print("success");
        }else{
            response.getWriter().print("error");
        }
    }


    //查询驾校名称
    @RequestMapping("/getSchoolName")
    @ResponseBody//ajax返回值json格式转换
    public List getSchoolName(HttpServletResponse response) throws IOException
    {
        System.out.println("getSchoolName");
        List<School> schoolName = schoolAdminService.getSchoolName();
        System.out.println("list:"+schoolName.toString());
        if (null!=schoolName){
        	return schoolName;
        }
		return null;
    }

    //查询驾校学员人数
    @RequestMapping("/getSchoolStudents")
    @ResponseBody//ajax返回值json格式转换
    public List getSchoolStudents(HttpServletResponse response) throws IOException
    {
        System.out.println("getSchoolStudents");
        List schoolStudents = schoolAdminService.getSchoolStudents();
        System.out.println("list:"+schoolStudents.toString());
        if (null!=schoolStudents){
            return schoolStudents;
        }
        return null;
    }


    //文件上传
    @RequestMapping("/upload1")
    @ResponseBody//ajax返回值json格式转换
    @Log(operationType = "文件上传", operationName = "文件上传")
    public String upload1(MultipartFile file,String account1,String account,String pwd1,String pwd,String rpwd,String name, String admin, String address,String phone,String phone2, String intro, HttpServletRequest request) throws IOException {

        if ("√".equals(account)&&"√".equals(pwd)&&"√".equals(rpwd)&&"√".equals(phone2)){
            String dateStr="";
            System.out.println("account=="+1);
            if (!StringUtils.isEmpty(file) && file.getSize()>0
                    &&null!=name&&!"".equals(name)&&null!=admin&&!"".equals(admin)&&null!=admin&&!"".equals(admin)
                    &&null!=address&&!"".equals(address)&&null!=phone&&!"".equals(phone)&&null!=intro&&!"".equals(intro)){
                        String fileName= file.getOriginalFilename();//是得到上传时的文件名。
                        String suffix = file.getOriginalFilename().split("\\.")[1];
                        if ("xlsx".equals(suffix)||"doc".equals(suffix)){//集合是否包含要上传的文档类型
                            Date date = new Date();
                            //使用UUID+后缀名保存文件名，防止中文乱码问题
                            SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
                            dateStr = simpleDateFormat.format(date);
                            String savePath = request.getSession().getServletContext().getRealPath("/files/");
                            String projectPath = savePath  + dateStr+File.separator + fileName;;
                            System.out.println("projectPath=="+projectPath);
                            File files=new File(projectPath);
                            //打印查看上传路径
                            if(!files.getParentFile().exists()){//判断目录是否存在
                                System.out.println("files11111="+files.getPath());
                                files.getParentFile().mkdirs();
                            }
                            file.transferTo(files); // 将接收的文件保存到指定文件中
                            School school = schoolAdminService.SchoolApply(account1,name, admin, address,phone,intro,"/files/"+ dateStr+"/"+fileName);//插入到数据库
                            if (school!=null){
                                String md5 = MD5Utils.md5(pwd1);
                                SchoolAdmin admin1 = new SchoolAdmin(account1,md5,name,phone,school.getId(),new Date(),4);
                                schoolAdminService.addSchoolAdmin(admin1);
                                return "{\"code\":0, \"msg\":\"\", \"data\":{}}";
                            }
                        }
                return "{\"code\":1, \"msg\":\"\", \"data\":{}}";
                }
            return "{\"code\":3, \"msg\":\"\", \"data\":{}}";
        }
        return "{\"code\":4, \"msg\":\"\", \"data\":{}}";
    }


    /**
     * 验证是否是手机号
     * @param mobiles
     * @return
     */
    public static boolean isMobileNO(String mobiles) {
        if(mobiles==null||mobiles.isEmpty()){
            return false;
        }
        Pattern p = Pattern.compile("^(\\+86)*0*((13[0-9])|(14[0-9])||(15[0-9])|(18[0-9]))\\d{8}$");
        Matcher m = p.matcher(mobiles);
        return m.matches();
    }


    //首页显示的南丁格尔图
    @RequestMapping("/school")
    @ResponseBody//ajax返回值json格式转换
    public Object school(HttpServletResponse response) throws IOException
    {
        List<School> map = (List<School>) schoolAdminService.School();
        return map;
    }


    //获取日志表格显示
    @RequestMapping("/WelcomeTable")
    @ResponseBody//ajax返回值json格式转换
    public DateTable WelcomeTable(TableUtils utils, HttpServletRequest request, HttpServletResponse response) throws IOException {
        Integer page= Integer.parseInt(request.getParameter("page"));
        Integer limit= Integer.parseInt(request.getParameter("limit"));
        utils.setMinLimit((page-1)*limit);
        utils.setMaxLimit(limit);
        Map map = (Map) schoolAdminService.School1(utils);
        if (null!=map.get("list")){
            dateTable.setData((List<?>) map.get("list"));
            dateTable.setCode(0);
            dateTable.setCount((Integer) map.get("count"));//总条数
            return dateTable;
        }
        return null;
    }

        //首页通知公告信息显
        @RequestMapping("/getNotice")
        @ResponseBody//ajax返回值json格式转换
        public Object getNotice() throws IOException {
            List<Notice> list =  schoolAdminService.getNotice();
            return list;
        }



    //首页通知公告信息显
    @RequestMapping("/jumpNwePage")
    public String jumpNwePage(HttpServletRequest request) throws IOException {
        Integer id =Integer.valueOf(request.getParameter("id")) ;
        Notice notice =  schoolAdminService.jumpNwePage(id);
        request.setAttribute("jumpNwePage",notice);
//        ModelAndView mav = new ModelAndView("/frontjsp/jsp/Welcome1");//实例化ModelAndView对象，给mav对象指定名称为/frontjsp/jsp/+ 路径path
//        if (null!=list){
//            mav.addObject("jumpNwePage",list);
//        }
//            return mav;

        return "frontjsp/jsp/Welcome1";
    }


    //模板下载
    @RequestMapping("/downTemplate")
    @ResponseBody//ajax返回值json格式转换
    @Log(operationType = "下载操作", operationName = "下载文件")
    public ResponseEntity<byte[]> downTemplate(String name , HttpServletRequest request) throws IOException {
        String projectPath ="";
        String suffix =name+".xlsx";
        String savePath = request.getSession().getServletContext().getRealPath("files/");
        if (name.equals("教练模板")){
            projectPath = savePath  + "coach.xlsx";
        }
        if (name.equals("学员模板")){
            projectPath = savePath  + "student.xlsx";
        }
        if (name.equals("教练车模板")){
            projectPath = savePath  + "car.xlsx";
        }

        File file=new File(projectPath);
        //设置HttpHeaders,使得浏览器响应下载
        HttpHeaders headers = new HttpHeaders();
        //为了解决中文名称乱码问题
        String fileName=new String(suffix.getBytes("UTF-8"),"iso-8859-1");
        //设置响应文件 attachment附件的意思
        headers.setContentDispositionFormData("attachment", fileName);
        //设置响应方式  APPLICATION_OCTET_STREAM 二进制流数据（如常见的文件下载）
        headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
        //把文件以二进制形式写回
        return new ResponseEntity<byte[]>(FileUtils.readFileToByteArray(file),
                headers, HttpStatus.CREATED);
    }



}
