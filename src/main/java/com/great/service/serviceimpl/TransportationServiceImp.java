package com.great.service.serviceimpl;

import com.great.dao.TransportationDao;
import com.great.entity.Notice;
import com.great.entity.ObjectResult;

import com.great.entity.Transportation;
import com.great.service.TransportationService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import com.great.entity.Subject;


import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
        map.put("question",question);
        map.put("type",type);

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
        map.put("question",question);
        map.put("type",type);

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
    public ObjectResult getStudentTbl(Integer page, Integer limit, String state, String name) {
        int maxlimit=limit;
        int minlimit=(page-1)*limit;

        Map<String,Object> map=new HashMap<>();
        map.put("maxlimit",maxlimit);
        map.put("minlimit",minlimit);
        map.put("state",state);
        map.put("name",name);

        ObjectResult objectResult=new ObjectResult();

        objectResult.setCode(0);
        //获取记录条数
        objectResult.setCount(td.getStudentCount(map));
        //获取记录
        objectResult.setData(td.getStudentTbl(map));

        return objectResult;
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


}
