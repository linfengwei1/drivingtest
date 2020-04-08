package com.great.service.serviceimpl;

import com.great.dao.TransportationDao;
import com.great.entity.ObjectResult;
import com.great.entity.Subject;
import com.great.entity.Transportation;
import com.great.service.TransportationService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
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
}
