package com.great.dao;


import com.great.entity.Question;
import com.great.entity.Student;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.HashMap;
import java.util.List;

@Mapper
public interface IStudentDao
{
	public Student login(HashMap<String, String> map);

	public int checkStudyAuthority(HashMap<String, Integer> map);

	public int addStudy1Time(@Param("studentId")int studentId, @Param("subject")int subject);

	public List<Question> getChoicesBySubject_1();
	public List<Question> getjudgesBySubject_1();

	public List<Question> getChoicesBySubject_4();
	public List<Question> getjudgesBySubject_4();

	public void setStudentIsIdentified(@Param("studentId")int studentId);

	public void addStudyTime(@Param("studentId")int studentId, @Param("subject")int subject);
}
