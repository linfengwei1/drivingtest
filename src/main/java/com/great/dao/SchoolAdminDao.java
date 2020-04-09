package com.great.dao;


import com.great.entity.SchoolAdmin;
import org.apache.ibatis.annotations.Mapper;
import java.util.Map;

@Mapper
public interface SchoolAdminDao
{
	public SchoolAdmin login(Map<String, String> map);
}
