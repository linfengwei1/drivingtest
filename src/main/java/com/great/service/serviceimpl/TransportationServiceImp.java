package com.great.service.serviceimpl;

import com.great.dao.TransportationDao;
import com.great.entity.Transportation;
import com.great.service.TransportationService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.HashMap;
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
}
