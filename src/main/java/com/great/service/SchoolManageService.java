package com.great.service;

import com.great.dao.SchoolAdminDao;
import com.great.dao.SchoolCoachDao;
import com.great.dao.SchoolStudentDao;
import com.great.entity.Coach;

import com.great.entity.SchoolAdmin;
import com.great.entity.Student;
import com.great.entity.TableUtils;
import com.great.utils.ExportExcelSeedBack;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

@Service
public class SchoolManageService {

    @Resource
    private SchoolAdminDao schoolAdminDao;
    @Resource
    private SchoolCoachDao schoolCoachDao;
    @Resource
    private SchoolStudentDao schoolStudentDao;

    //驾校管理员登录
    public SchoolAdmin login(String account, String pwd){
        Map<String,String> loginMap = new LinkedHashMap<>();
        loginMap.put("account",account);
        loginMap.put("pwd",pwd);
        return schoolAdminDao.login(loginMap);
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

    //添加学员
    public Integer addStudent(Student coach){
        return schoolStudentDao.addStudent(coach);
    }

    //excel插入数据库
    public Integer insertStudentByExcel(List<Student>list){
        return schoolStudentDao.insertStudentByExcel(list);
    }
}
