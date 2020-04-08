package com.great.dao;

import com.great.entity.Transportation;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
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

    /**
     * 登录
     * @param map
     * @return
     */
    Transportation login(Map<String,String> map);

    /**
     * 获取科目一题数
     * @param map
     * @return
     */
    Integer getOneSubjectCount( Map<String,Object> map);

    /**
     * 获取科目一题表
     * @param map
     * @return
     */
    List<?> getOneSubject( Map<String,Object> map);

    /**
     * 获取科目四题数
     * @param map
     * @return
     */
    Integer getFourthSubjectCount(Map<String, Object> map);

    /**
     * 获取科目四题表
     * @param map
     * @return
     */
    List<?> getFourthSubject(Map<String, Object> map);
}
