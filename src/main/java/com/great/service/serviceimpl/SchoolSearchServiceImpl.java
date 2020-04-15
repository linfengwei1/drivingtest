package com.great.service.serviceimpl;

import com.great.dao.LinkMapper;
import com.great.dao.SchoolSearchMapper;
import com.great.entity.Link;
import com.great.entity.School;
import com.great.service.SchoolSearchService;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

public class SchoolSearchServiceImpl implements SchoolSearchService {

    @Autowired//自动装配、自动注入：注入sqlSessionTemplate
    private SqlSessionTemplate sqlSessionTemplate;

    private SchoolSearchMapper schoolSearchMapper;

    @Override
    public List<School> findAllSchool() {

        schoolSearchMapper = sqlSessionTemplate.getMapper(SchoolSearchMapper.class);//获得代理对象
        return schoolSearchMapper.findAllSchool();
    }
}
