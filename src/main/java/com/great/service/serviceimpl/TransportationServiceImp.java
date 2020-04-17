package com.great.service.serviceimpl;

import com.great.dao.TransportationDao;
import com.great.entity.*;

import com.great.service.TransportationService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * ClassName: TransportationServiceImp <br/>
 * Description: <br/>
 * date: 2020/4/8 10:35<br/>
 *
 * @author lenovo<br />
 * @since JDK 1.8
 */
@Service
public class TransportationServiceImp implements TransportationService {

    @Resource
    private TransportationDao td;

    @Override
    public Transportation login(String account, String pwd) {
        Map<String,String> map=new HashMap<>();
        map.put("account",account);
        map.put("pwd",pwd);
        return td.login(map);
    }

    @Override
    public ObjectResult getOneSubject(Integer page,Integer limit,String question,String type) {

        int maxlimit=limit;
        int minlimit=(page-1)*limit;

        Map<String,Object> map=new HashMap<>();
        map.put("maxlimit",maxlimit);
        map.put("minlimit",minlimit);
        if (question!=null&&!question.equals("")){
            map.put("question",question);
        }
        if (type!=null&&!type.equals("")){
            map.put("type",type);
        }

        ObjectResult objectResult=new ObjectResult();

        objectResult.setCode(0);
        //获取记录条数
        objectResult.setCount(td.getOneSubjectCount(map));
        //获取记录
        objectResult.setData(td.getOneSubject(map));

        return objectResult;
    }

    @Override
    public ObjectResult getFourthSubject(Integer page, Integer limit,String question,String type) {
        int maxlimit=limit;
        int minlimit=(page-1)*limit;

        Map<String,Object> map=new HashMap<>();
        map.put("maxlimit",maxlimit);
        map.put("minlimit",minlimit);
        if (question!=null&&!question.equals("")){
            map.put("question",question);
        }
        if (type!=null&&!type.equals("")){
            map.put("type",type);
        }

        ObjectResult objectResult=new ObjectResult();

        objectResult.setCode(0);
        //获取记录条数
        objectResult.setCount(td.getFourthSubjectCount(map));
        //获取记录
        objectResult.setData(td.getFourthSubject(map));

        return objectResult;
    }

    @Override
    public Subject getOneSubjectMsg(Subject subject) {
        return td.getOneSubjectMsg(subject.getId());
    }

    @Override
    public Subject getFourthSubjectMsg(Subject subject) {
        return td.getFourthSubjectMsg(subject.getId());
    }

    @Override
    public Integer deleteOneSubjectMsg(Subject subject) {
        return td.deleteOneSubjectMsg(subject.getId());
    }

    @Override
    public Integer deleteFourthSubjectMsg(Subject subject) {
        return td.deleteFourthSubjectMsg(subject.getId());
    }

    @Override
    public Integer updateOneSubjectMsg(Subject subject) {
        return td.updateOneSubjectMsg(subject);
    }

    @Override
    public Integer updateFourthSubjectMsg(Subject subject) {
        return td.updateFourthSubjectMsg(subject);
    }

    @Override
    public ObjectResult getStudentTbl(Integer page, Integer limit, String state, String name,String type) {
        int maxlimit=limit;
        int minlimit=(page-1)*limit;

        Map<String,Object> map=new HashMap<>();
        map.put("maxlimit",maxlimit);
        map.put("minlimit",minlimit);
        if (state!=null&&!state.equals("")){
            map.put("state",state);
        }
        if (name!=null&&!name.equals("")){
            map.put("name",name);
        }
        if (type!=null&&!type.equals("")){
            map.put("type",type);
        }

        ObjectResult objectResult=new ObjectResult();

        objectResult.setCode(0);
        //获取记录条数
        objectResult.setCount(td.getStudentCount(map));
        //获取记录
        objectResult.setData(td.getStudentTbl(map));

        //System.out.println(objectResult);

        return objectResult;
    }

    @Override
    public List<School> getSchoolList() {
        return td.getSchoolList();
    }

    @Override
    public Map<Integer, String> getStudentState() {

        Map<Integer,String> map=new LinkedHashMap<>();

        List<String> list=td.getStudentState();

        for (int i=0;i<list.size();i++) {
            map.put(i+1,list.get(i));
        }

        //System.out.println(map);

        return map;
    }

    @Override
    public ObjectResult getSchoolTbl(Integer page, Integer limit, String state, String name) {
        int maxlimit=limit;
        int minlimit=(page-1)*limit;

        Map<String,Object> map=new HashMap<>();
        map.put("maxlimit",maxlimit);
        map.put("minlimit",minlimit);
        if (state!=null&&!state.equals("")){
            map.put("state",state);
        }
        if (name!=null&&!name.equals("")){
            map.put("name",name);
        }

        //System.out.println(map);

        ObjectResult objectResult=new ObjectResult();

        objectResult.setCode(0);
        //获取记录条数
        objectResult.setCount(td.getSchoolCount(map));
        //获取记录
        objectResult.setData(td.getSchoolTbl(map));

        //System.out.println(objectResult);

        return objectResult;
    }

    @Override
    public Map<Integer, String> getSchoolState() {
        Map<Integer,String> map=new LinkedHashMap<>();

        List<String> list=td.getSchoolState();

        for (int i=0;i<list.size();i++) {
            map.put(i+1,list.get(i));
        }

        //System.out.println(map);

        return map;
    }

    @Override
    public Map<Integer, String> getCoachState() {
        Map<Integer,String> map=new LinkedHashMap<>();

        List<String> list=td.getCoachState();

        for (int i=0;i<list.size();i++) {
            map.put(i+1,list.get(i));
        }

        //System.out.println(map);

        return map;
    }

    @Override
    public ObjectResult getCoachTbl(Integer page, Integer limit, String name, String sex, String type, String school) {
        int maxlimit=limit;
        int minlimit=(page-1)*limit;

        Map<String,Object> map=new HashMap<>();
        map.put("maxlimit",maxlimit);
        map.put("minlimit",minlimit);
        if (sex!=null&&!sex.equals("")){
            map.put("sex",sex);
        }
        if (name!=null&&!name.equals("")){
            map.put("name",name);
        }
        if (type!=null&&!type.equals("")){
            map.put("type",type);
        }
        if (school!=null&&!school.equals("")){
            map.put("school",school);
        }

        //System.out.println(map);

        ObjectResult objectResult=new ObjectResult();

        objectResult.setCode(0);
        //获取记录条数
        objectResult.setCount(td.getCoachCount(map));
        //获取记录
        objectResult.setData(td.getCoachTbl(map));

        //System.out.println(objectResult);

        return objectResult;
    }

    @Override
    public Student getStudentMsg(Integer id) {
        return td.getStudentMsg(id);
    }

    @Override
    public School getSchoolMsg(Integer id) {
        return td.getSchoolMsg(id);
    }

    @Override
    public Coach getCoachMsg(Integer id) {
        return td.getCoachMsg(id);
    }

    @Override
    public Integer getStudentCountBySchoolId(Integer id) {
        return td.getStudentCountBySchoolId(id);
    }

    @Override
    public Integer getCoachCountBySchoolId(Integer id) {
        return td.getCoachCountBySchoolId(id);
    }

    @Override
    public Integer getCoachCarCountBySchoolId(Integer id) {
        return td.getCoachCarCountBySchoolId(id);
    }

    @Override
    public ObjectResult getCoachCarTbl(Integer page, Integer limit, String name, String type, String school) {
        int maxlimit=limit;
        int minlimit=(page-1)*limit;

        Map<String,Object> map=new HashMap<>();
        map.put("maxlimit",maxlimit);
        map.put("minlimit",minlimit);
        if (name!=null&&!name.equals("")){
            map.put("name",name);
        }
        if (type!=null&&!type.equals("")){
            map.put("type",type);
        }
        if (school!=null&&!school.equals("")){
            map.put("school",school);
        }

        //System.out.println(map);

        ObjectResult objectResult=new ObjectResult();

        objectResult.setCode(0);
        //获取记录条数
        objectResult.setCount(td.getCoachCarCount(map));
        //获取记录
        objectResult.setData(td.getCoachCarTbl(map));

        //System.out.println(objectResult);

        return objectResult;
    }

    @Override
    public void examineStudent(Integer id, String text, Integer i) {
        Map<String,Object> map=new HashMap<>();
        map.put("id",id);
        map.put("text",text);
        map.put("i",i);
        td.examineStudent(map);
    }

    @Override
    public void examineSchool(Integer id, String text, Integer i) {
        Map<String,Object> map=new HashMap<>();
        map.put("id",id);
        map.put("text",text);
        map.put("i",i);
        td.examineSchool(map);
    }

    @Override
    public void examineCoach(Integer id, String text, Integer i) {
        Map<String,Object> map=new HashMap<>();
        map.put("id",id);
        map.put("text",text);
        map.put("i",i);
        td.examineCoach(map);
    }

    @Override
    public void examineCoachCar(Integer id, String text, String i) {
        Map<String,Object> map=new HashMap<>();
        map.put("id",id);
        map.put("text",text);
        map.put("i",i);
        td.examineCoachCar(map);
    }


    @Override
    public ObjectResult getNotice(Integer page, Integer limit, String title ,String date, String type)
    {
        int maxlimit=limit;
        int minlimit=(page-1)*limit;

        Map<String,Object> map=new HashMap<>();
        map.put("maxlimit",maxlimit);
        map.put("minlimit",minlimit);
        map.put("title",title);
        //	    SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        //	    String dateString = formatter.format(date);
        map.put("date",date);
        map.put("type",type);

        ObjectResult objectResult=new ObjectResult();

        objectResult.setCode(0);
        //获取记录条数
        objectResult.setCount(td.getNoticeCount(map));
        //获取记录
        objectResult.setData(td.getNotice(map));

        return objectResult;
    }

    @Override
    public List<?> getNoticeType()
    {
        return td.getNoticeType();
    }

    @Override
    public Integer deleteNotice(Notice notice)
    {
        return td.deleteNotice(notice.getId());
    }

    @Override
    public Integer updateNoticeMsg(Notice notice)
    {
        return td.updateNoticeMsg(notice);
    }

    @Override
    public Notice getNoticeMsg(Notice notice)
    {
        return td.getNoticeMsg(notice.getId());
    }

    @Override
    public Integer insertNotice(Notice notice)
    {
        return td.insertNotice(notice);
    }

    @Override
    public List<TestTime> getExamTime() {
        return td.getExamTime();
    }

    @Override
    public Integer insertExamTime(String start, String end, String sid, String scolor)  {

        //验证日期是否包含关系//包含找出最大最小

        List<TestTime> testTimes=td.getExamTimeBySchoolId(sid);

        System.out.println(testTimes);

        boolean flag=false;

        if (testTimes==null){
            flag=true;
        }else {
            for (int i=0;i<testTimes.size();i++){
                Map<String,String> map=timeVerify(start,end,testTimes.get(i).getStart_time().split(" ")[0],testTimes.get(i).getEnd_time().split(" ")[0]);
                if (map.get("flag").equals("true")){

                    Map<String,Object> map1=new HashMap<>();
                    map1.put("id",testTimes.get(i).getId());
                    map1.put("start",start);
                    map1.put("end",end);

                    System.out.println("111");
                    td.updateExamTime(map1);

                    break;
                }
                flag = true;
            }
        }
        //不包含直接插入数据
        if (flag){
            System.out.println("222");
            Map<String,Object> map1=new HashMap<>();
            map1.put("start",start);
            map1.put("end",end);
            map1.put("sid",sid);
            map1.put("scolor",scolor);
            td.insertExamTime(map1);

        }

        return null;
    }

    @Override
    public Map<String,String> timeVerify(String nowTime1,String nowTime2,String startTime,String endTime)  {
        Map<String,String> map=new HashMap<>();
        try {
            String	flag="true";
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            String dateStr1_1 = nowTime1;
            String dateStr1_2 = nowTime2;
            String dateStr2_1 = startTime;
            String dateStr2_2 = endTime;
            Date s1 = sdf.parse(dateStr1_1);
            Date s2 = sdf.parse(dateStr1_2);
            Date e1 = sdf.parse(dateStr2_1);
            Date e2 = sdf.parse(dateStr2_2);

        if((s1.getTime()<=e1.getTime()) && (e1.getTime()<=s2.getTime())){
        }else if((e1.getTime()<=s1.getTime())&&(s1.getTime()<=e2.getTime())&&(e2.getTime()<=s2.getTime())){
        }else if((e1.getTime()<=s1.getTime())&&(e1.getTime()<=s2.getTime())&&(s2.getTime()<=e2.getTime())) {
        }else if((s1.getTime()<=e1.getTime())&&(s2.getTime()>=e2.getTime())) {
        }else{
            flag="false";
        }

        List<Date> dates=new ArrayList<>();
        dates.add(s1);
        dates.add(s2);
        dates.add(e1);
        dates.add(e2);
        Date max=dates.get(0);
        Date min=dates.get(0);
        for(int i=1;i<dates.size();i++) {
            if (dates.get(i).getTime()>max.getTime()) {
                max=dates.get(i);
            }
            if (dates.get(i).getTime()<min.getTime()) {
                min=dates.get(i);
            }
        }
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        String time1=formatter.format(max);
        String time2=formatter.format(min);


        map.put("flag",flag);
        map.put("min",time2);
        map.put("max",time1);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return map;
    }

    @Override
    public Integer deleteExamTime(Integer tid) {
        return td.deleteExamTime(tid);
    }

    @Override
    public List countStatistics() {
        Integer one= td.CountSubject1();
        Integer two=   td.CountSubject2();
        Integer three=   td.CountSubject3();
        Integer four=   td.CountSubject4();
        Integer over=   td.CountOver();
        List list = new ArrayList();
        list.add(one);  list.add(two);  list.add(three);  list.add(four);  list.add(over);
        return  list;

    }

    @Override
    public void stopApply(Integer id, String content, String result, Integer i) {
        Map<String,Object> map=new HashMap<>();
        map.put("id",id);
        map.put("content",content);
        map.put("result",result);
        map.put("state",i);
        map.put("date",new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
        //停驾校
        td.stopApplySchool(map);
        //记录
        td.recordApply(map);
    }

    @Override
    public void stopDoing(Integer id, String content, String result, Integer i) {
        Map<String,Object> map=new HashMap<>();
        map.put("id",id);
        map.put("content",content);
        map.put("result",result);
        map.put("state",i);
        map.put("date",new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
        //停驾校
        td.stopDoingSchool(map);
        //查询驾校教练
        List<Coach> coaches=td.getCoachBySchoolId(id);
        //停教练
        for(int a=0;a<coaches.size();a++){
            td.stopDoingCoach(coaches.get(i).getId());
        }

        //记录
        td.recordDoing(map);
    }

    @Override
    public void relieveApply(Integer id, Integer i) {
        Map<String,Integer> map=new HashMap<>();
        map.put("id",id);
        map.put("state",i);
        //解停
        td.relieveApplySchool(map);
    }

    @Override
    public void relieveDoing(Integer id, Integer i) {
        Map<String,Integer> map=new HashMap<>();
        map.put("id",id);
        map.put("state",i);
        //解封驾校
        td.relieveDoingSchool(map);
        //解封教练
        //查询驾校教练
        List<Coach> coaches=td.getCoachBySchoolId(id);
        //停教练
        for(int a=0;a<coaches.size();a++){
            td.stopDoingCoach(coaches.get(i).getId());
        }
    }

}
