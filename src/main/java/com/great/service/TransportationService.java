package com.great.service;

import com.alibaba.druid.util.StringUtils;
import com.great.entity.Transportation;

/**
 * ClassName: TransportationService <br/>
 * Description: <br/>
 * date: 2020/4/8 10:35<br/>
 *
 * @author lenovo<br />
 * @since JDK 1.8
 */
public interface TransportationService {

    /**
     * 验证运管登陆
     * @param account
     * @param pwd
     * @return
     */
    public Transportation login(String account, String pwd);

}
