package com.great.dao;

import com.great.entity.School;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface SchoolSearchMapper {
    public List<School> findAllSchool();//查询链接
}
