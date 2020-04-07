package com.great.dao;


import com.great.entity.SchoolAdmin;
import com.great.entity.Student;
import org.apache.ibatis.annotations.Mapper;

import java.util.HashMap;

@Mapper
public interface SchoolAdminDao
{
	public SchoolAdmin login(HashMap<String, String> map);
}
