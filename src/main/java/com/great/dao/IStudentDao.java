package com.great.dao;


import com.great.entity.Student;
import org.apache.ibatis.annotations.Param;

import java.util.HashMap;

public interface IStudentDao
{
	public Student login(HashMap<String, String> map);


	public int checkStudyAuthority(HashMap<String, Integer> map);

	public int addStudy1Time(@Param("studentId")int studentId, @Param("subject")int subject);
}
