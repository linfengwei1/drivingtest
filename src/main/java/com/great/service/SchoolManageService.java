package com.great.service;

import com.great.dao.*;
import com.great.entity.*;
import com.great.utils.ExportExcelSeedBack;
import com.great.utils.SchoolFaceRecognitionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.OutputStream;
import java.util.*;

@Service
public class SchoolManageService {

    @Resource
    private SchoolAdminDao schoolAdminDao;
    @Resource
    private SchoolCoachDao schoolCoachDao;
    @Resource
    private SchoolStudentDao schoolStudentDao;
    @Resource
    private SchoolCarDao schoolCarDao;
    @Resource
    private SchoolLogDao schoolLogDao;


    @Autowired
    private School school;
    private Object image;

    //驾校管理员登录
    public SchoolAdmin login(String account, String pwd){
        Map<String,String> loginMap = new LinkedHashMap<>();
        loginMap.put("account",account);
        loginMap.put("pwd",pwd);
        return schoolAdminDao.login(loginMap);
    }

    //人脸登录
    @ResponseBody
    public String faceLogin(String imageString, HttpServletRequest request){
      String msg = SchoolFaceRecognitionUtils.identify(imageString);
      if (null!=msg&&!"".equals(msg)&&!"again".equals(msg)&&!"error".equals(msg)){
          System.out.println("service返回的id=="+msg);
          Integer id = Integer.valueOf(msg);//根据识别到的人脸返回对应的id
          //根据id进行你登录
        SchoolAdmin admin = schoolAdminDao.faceLogin(id);
          System.out.println("根据id返回的对象=="+admin.toString());
        if (null!=admin){
            request.getSession().setAttribute("SchoolAdmin",admin);
            if (1!=admin.getSchool_state_id()||3!=admin.getSchool_state_id()){
                return "no";
            }
            return "success";
        }
            return "error";

      }
        return msg;
    }

    //查询驾校管理员记录并分页
    public Object getSchoolAdminTable(TableUtils utils){

        Map<String,Object>InfMap = new LinkedHashMap<>();
        List<SchoolAdmin> list=schoolAdminDao.findSchoolAdminByPage(utils);
        Integer a =schoolAdminDao.findSchoolAdminCount(utils);
        InfMap.put("list",list);
        InfMap.put("count",a);

        return InfMap;
    }

    //删除驾校管理员信息
    public Integer deleteSchoolAdmin(Integer id){
        return schoolAdminDao.deleteSchoolAdmin(id);
    }

    //更新驾校管理员信息
    public Integer updateSchoolAdmin(SchoolAdmin schoolAdmin){
        return schoolAdminDao.updateSchoolAdmin(schoolAdmin);
    }

    //查看账号是否被注册
    public Integer CheckAccount(String account){
        return schoolAdminDao.CheckAccount(account);
    }

    //添加驾校管理员
    public Integer addSchoolAdmin(SchoolAdmin schoolAdmin){
        return schoolAdminDao.addSchoolAdmin(schoolAdmin);
    }


    //查询驾校管理员记录并分页
    public Object getSchoolCoachTable(TableUtils utils){
        Map<String,Object>InfMap = new LinkedHashMap<>();
        List<Coach> list=schoolCoachDao.findCoachByPage(utils);
        Integer a =schoolCoachDao.findCoachCount(utils);
        InfMap.put("list",list);
        InfMap.put("count",a);
        return InfMap;
    }

    //更新教练信息
    public Integer updateCoach(Coach coach){
        return schoolCoachDao.updateCoach(coach);
    }

    //删除教练
    public Integer deleteCount(Integer id){
        return schoolCoachDao.deleteCount(id);
    }

    //查看账号是否被注册
    public Integer CheckCoachAccount(String account){
        return schoolCoachDao.CheckCoachAccount(account);
    }

    //添加教练
    public Integer addCoach(Coach coach){
        return schoolCoachDao.addCoach(coach);
    }


    //excel插入数据库
    public List insertCoachByExcel(List<Coach>list){
        List list1 = new ArrayList();//用来存放重复的账号
        //判断插入的学员账号是否被使用
        for (int i =0;i<list.size();i++){
            Integer a= schoolCoachDao.CheckCoachAccount(list.get(i).getAccount());
            if (0<a){
                //存重复的账号
                list1.add(list.get(i));
            }
        }
        if (list1.get(0)==null){//当没有重复的时候才插入
            schoolCoachDao.insertCoachByExcel(list);
            return null;
        }
        return list1;
    }


    //单独插入图片
    public Integer AddCoachImage(Integer id,String image){
        Map<String,Object> map = new HashMap<>();
        map.put("id",id);
        map.put("image",image);
        return schoolCoachDao.AddCoachImage(map);
    }

    //插入图片改变状态
    public Integer ChangeCoachState(Integer id){
        Map<String,Object> map = new HashMap<>();
        map.put("coach_state_id",4);
        map.put("id",id);
        return schoolCoachDao.ChangeCoachState(map);
    }


    //查询所有教练并导出excel
    public void findAllCoach(Integer schoolid, HttpServletResponse response){
        List<Coach> list=schoolCoachDao.findAllCoach(schoolid);
        //导出文件的标题
        String title = "教练名单.xls";
        //设置表格标题行
        String[] headers = new String[] {"序号","教练账号","教练密码","姓名","年龄","身份证","联系方式"};
        List<Object[]> dataList = new ArrayList<Object[]>();
        Object[] objs = null;
        for (int i = 0; i < list.size(); i++) {
            objs = new Object[headers.length];
            objs[0] = list.get(i).getId();//设置序号,在工具类中会出现
            objs[1] = list.get(i).getAccount();
            objs[2] = list.get(i).getPwd();
            objs[3] = list.get(i).getName();
            objs[4] = list.get(i).getAge();
            objs[5] = list.get(i).getIdnumber();
            objs[6] = list.get(i).getPhone();
            dataList.add(objs);//数据添加到excel表格
        }
        //使用流将数据导出
        OutputStream out = null;
        try {
            //防止中文乱码
            String headStr = "attachment; filename=\"" + new String( title.getBytes("gb2312"), "ISO8859-1" ) + "\"";
            response.setContentType("octets/stream");
            response.setContentType("APPLICATION/OCTET-STREAM");
            response.setHeader("Content-Disposition", headStr);
            out = response.getOutputStream();
            ExportExcelSeedBack ex = new ExportExcelSeedBack(title, headers, dataList);//没有标题
            ex.export(out);
            out.flush();
            out.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

    }


    //查询学员记录并分页
    public Object getSchoolStudentTable(TableUtils utils){
        Map<String,Object>InfMap = new LinkedHashMap<>();
        List<Student> list=schoolStudentDao.findStudentByPage(utils);
        Integer a =schoolStudentDao.findCount(utils);
        InfMap.put("list",list);
        InfMap.put("count",a);
        return InfMap;
    }

    //更新学员信息
    public Integer updateStudent(Student coach){
        return schoolStudentDao.updateStudent(coach);
    }

    //删除学员
    public Integer deleteStudent(Integer id){
        return schoolStudentDao.deleteStudent(id);
    }

    //查看学员账号是否被注册
    public Integer CheckStudentAccount(String account){
        return schoolStudentDao.CheckStudentAccount(account);
    }

    //添加学员 因为已经在sql。xml中设置了插入获取id,直接返回对象,对象内已经封装好了id
    public Student addStudent(Student student){
        schoolStudentDao.addStudent(student);
        return student;
    }

    //学员信息excel插入数据库
    public List<Student> insertStudentByExcel(List<Student>list){
        List<Student> list1 = new ArrayList();//用来存放重复的账号
        //判断插入的学员账号是否被使用
        for (int i =0;i<list.size();i++){
         Integer a= schoolStudentDao.CheckStudentAccount(list.get(i).getAccount());
          if (0<a){
              //存重复的账号
              list1.add(list.get(i));
          }
        }
       if (list1.get(0)==null){//当没有重复的时候才插入
           schoolStudentDao.insertStudentByExcel(list);
           return list;
       }
        return list1;
    }


    //查询学员预约记录并分页
    public Object getAppointTbl(TableUtils utils){
        Map<String,Object>InfMap = new LinkedHashMap<>();
        List<AppointTest> list=schoolStudentDao.getAppointTbl(utils);
        Integer a =schoolStudentDao.getAppointCount(utils);
        InfMap.put("list",list);
        InfMap.put("count",a);
        return InfMap;
    }



    public void auditAppoint(Integer id, String doing,String name,Integer studentId) {
        Map<String,Object> map=new HashMap<>();
        if (doing.equals("批准")){
            map.put("id",id);
            map.put("state",4);
            schoolStudentDao.auditAppoint(map);
        }else {
            map.put("id",id);
            map.put("state",2);
            schoolStudentDao.auditAppoint(map);
            schoolStudentDao.AppointNoByOne(studentId);

        }

    }

    //批量审核通过学员预约
    public Integer changeAppointState(List list){
        return schoolStudentDao.changeAppointState(list);
    }




    //批量驳回过学员预约
    public Integer batchRejected(List list){
        Integer a =schoolStudentDao.batchRejected(list);
              schoolStudentDao.AppointNo(list);
        return a;
    }

    //获取车辆信息表
    public Object getCarTable(TableUtils u){
        Map<String,Object>InfMap = new LinkedHashMap<>();
        List<CoachCar> list=schoolCarDao.getCar(u);
        Integer a =schoolCarDao.findCount(u);
        InfMap.put("list",list);
        InfMap.put("count",a);
        return InfMap;
    }

    //单独插入车辆图片
    public Integer AddCarImage(Integer id,String image){
        Map<String,Object> map = new HashMap<>();
        map.put("id",id);
        map.put("picture",image);
        return schoolCarDao.AddCarImage(map);
    }

    //插入图片改变状态
    public Integer ChangeCarState(Integer id){
        Map<String,Object> map = new HashMap<>();
        map.put("state","待审核");
        map.put("id",id);
        return schoolCarDao.ChangeCarState(map);
    }

    //查询驾校的所有教练
    public List<Coach> findCoach(Integer cid){
        return schoolCarDao.findCoach(cid);
    }
    //车辆人员变更
    public Integer updateCar(CoachCar coachCar){
        return schoolCarDao.updateCar(coachCar);
    }

    //删除教练车
    public Integer deleteCar(Integer id){
        return schoolCarDao.deleteCar(id);
    }
    //添加车辆
    public Integer addCar(CoachCar coachCar){
        return schoolCarDao.addCar(coachCar);
    }



    //查看车牌号是否被注册
    public Integer CheckCarNumber(String account){
        return schoolCarDao.CheckCarNumber(account);
    }


    //excel插入数据库
    public List insertCarByExcel(List<CoachCar>list){
        List list1 = new ArrayList();//用来存放重复的账号
        //判断插入的学员账号是否被使用
        for (int i =0;i<list.size();i++){
            Integer a= schoolCarDao.CheckCarNumber(list.get(i).getCarNumber());
            if (0<a){
                //存重复的账号
                list1.add(list.get(i));
            }
        }
        if (list1.get(0)==null){//当没有重复的时候才插入
            schoolCarDao.insertCarByExcel(list);
            return null;
        }
        return list1;
    }


    //单独学员插入图片
    public Integer AddStudentImage(Integer id,String image){
        Map<String,Object> loginMap = new HashMap<>();
        loginMap.put("id",id);
        return schoolStudentDao.AddStudentImage(loginMap);
    }

    //改变学员状态
    public Integer ChangeStudentState(Integer id){
        Map<String,Object> map = new HashMap<>();
        map.put("student_state_id",5);
        map.put("id",id);
        return schoolStudentDao.ChangeStudentState(map);
    }

    //查找学员学习时间
    public List<StudyCondition> findStudyTime(Integer a){
        return  schoolStudentDao.findStudyTime(a);
    }

    //查询驾校信息
    public List<School> getSchoolInf(Integer id){
        return schoolAdminDao.getSchoolInf(id);
    }

    //统计人数
    public List Count(Integer a){
        Integer one= schoolStudentDao.CountSubject1(a);
        Integer two=   schoolStudentDao.CountSubject2(a);
        Integer three=   schoolStudentDao.CountSubject3(a);
        Integer four=   schoolStudentDao.CountSubject4(a);
        Integer over=   schoolStudentDao.CountOver(a);
        List list = new ArrayList();
        list.add(one);  list.add(two);  list.add(three);  list.add(four);  list.add(over);
        return  list;
    }

    //更改驾校信息
    public Integer updateSchoolInf(School school){
        return schoolAdminDao.updateSchoolInf(school);
    }

    //查询评价
    public Object getEvaluation(TableUtils u){
        Map<String,Object>InfMap = new LinkedHashMap<>();
        List<Evaluation> list=schoolAdminDao.getEvaluation(u);
        Integer a =schoolAdminDao.EvaluationCount(u);
        InfMap.put("list",list);
        InfMap.put("count",a);
        return InfMap;
    }

    //添加学员学时表
    public Integer addStudyCondition(List<StudyCondition>list){
        return schoolStudentDao.addStudyCondition(list);
    }



    //查询日志记录并分页
    public Object getSchoolLogTable(TableUtils utils){

        Map<String,Object>InfMap = new LinkedHashMap<>();
        List<TbLog> list=schoolLogDao.findSchoolLogByPage(utils);
        Integer a =schoolLogDao.findSchoolLogCount(utils);
        InfMap.put("list",list);
        InfMap.put("count",a);

        return InfMap;
    }


    public Integer addLog(TbLog systemLog){
        return schoolLogDao.addLog(systemLog);
    }


    //查询违约记录并分页
    public Object getSchoolPunishTable(TableUtils utils){

        Map<String,Object>InfMap = new LinkedHashMap<>();
        List<Punish> list=schoolCoachDao.getPunish(utils);
        Integer a =schoolCoachDao.findPunishCount(utils);
        InfMap.put("list",list);
        InfMap.put("count",a);

        return InfMap;
    }


    //添加处罚记录
    public Integer AddPunish(Punish punish){
        return schoolCoachDao.AddPunish(punish);
    }

    //删除处罚记录
    public Integer deletePunish(Integer punish){
        return schoolCoachDao.deletePunish(punish);
    }

    //处罚记录改变状态
    public Integer updatePunish(Integer id){
        return schoolCoachDao.updatePunish(id);
    }

    //处罚记录改变状态
    public Integer coachStateByStop( Integer id){
        return schoolCoachDao.coachStateByStop(id);
    }

    //处罚记录改变状态
    public Integer coachStateByNo( Integer id){
        return schoolCoachDao.coachStateByNo(id);
    }

    //查看手机号是否被注册
    public Integer CheckAdminPhone(String phone){
        return schoolAdminDao.CheckAdminPhone(phone);
    }

    //通过手机号码改密码
    public Integer changePwdByPhone(SchoolAdmin schoolAdmin){
        return schoolAdminDao.changePwdByPhone(schoolAdmin);
    }


    //添加人脸 user_id是在百度账号人脸识别库中的id,唯一的,可以在添加的时候把用户的id填进去
    public String faceAdd(String imageString,String user_id ){
        String msg=null;
        
        msg= SchoolFaceRecognitionUtils.faceRegister(imageString, user_id);
       if ("success".equals(msg.trim())){
           System.out.println("人脸添加到数据库");
       }

        return msg;
    }


    //查询驾校名称
    public List<School> getSchoolName(){
        return schoolAdminDao.getSchoolName();
    }

    //查询驾校学员人数
    public List getSchoolStudents(){
        return schoolAdminDao.getSchoolStudents();
    }

    //驾校申请
    public School SchoolApply(String account,String name, String admin, String address,String phone, String intro,String path){
        school.setAccount(account);
        school.setName(name);
        school.setAdmin(admin);
        school.setAddress(address);
        school.setPhone(phone);
        school.setIntro(intro);
        school.setInformation(path);
        schoolAdminDao.SchoolApply(school);

        return school;
    }


    //首页显示的南丁格尔图
    public Object School(){
        List<School> list = schoolAdminDao.School();
        Integer a;
        for (int i =0;i<list.size();i++){
            a =schoolAdminDao.SchoolCountById(list.get(i).getId());
            list.get(i).setCount(a);
        }
        return list;
    }


    //首页显示的南丁格尔图
    public Object School1(TableUtils tableUtils){
        List<School> list = schoolAdminDao.SchoolInf(tableUtils);

        List<TableUtils> list1 = new ArrayList<>();
        Integer a,b,c,d;
        d = schoolAdminDao.SchoolCount();
        for (int i =0;i<list.size();i++){
            a =schoolAdminDao.SchoolCountById(list.get(i).getId());
            b =schoolAdminDao.SchoolCountCarById(list.get(i).getId());
            c =schoolAdminDao.SchoolCountCoachById(list.get(i).getId());
            TableUtils tb = new TableUtils();
            tb.setName(list.get(i).getName());
            tb.setCountStudent(a);
            tb.setCountCar(b);
            tb.setCountCoach(c);
            list1.add(tb);
        }

        Map<String,Object>InfMap = new LinkedHashMap<>();
        InfMap.put("list",list1);
        InfMap.put("count",d);
        return InfMap;
    }


    //首页通知公告信息显示
    public List<Notice> getNotice(){
        return schoolAdminDao.getNotice();
    }


    //首页通知公告信息跳转到详情页
    public Notice jumpNwePage(Integer id){
        return schoolAdminDao.jumpNwePage(id);
    }
}
