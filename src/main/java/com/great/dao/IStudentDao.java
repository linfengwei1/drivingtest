package com.great.dao;


import com.great.entity.Student;

import java.util.HashMap;

public interface IStudentDao
{
	public Student login(HashMap<String, String> map);


	public int checkStudyAuthority(HashMap<String, Integer> map);
}
