package com.great.dao;

import com.great.entity.Transportation;
import org.apache.ibatis.annotations.Mapper;

import java.util.Map;

/**
 * ClassName: TransportationDao <br/>
 * Description: <br/>
 * date: 2020/4/8 10:14<br/>
 *
 * @author lenovo<br />
 * @since JDK 1.8
 */
@Mapper
public interface TransportationDao {

    Transportation login(Map<String,String> map);

}
