package com.great.dao;


import com.great.entity.Question;
import com.great.entity.Student;
import com.great.entity.TestReply;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.sql.Timestamp;
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

	public void addSignUpRecord(@Param("studentId")int studentId, @Param("subject")int subject, @Param("time")Timestamp time);
	public int checkReapSignUp(@Param("studentId")int studentId, @Param("subject")int subject);

	public int getTest_1Score(@Param("list")List<TestReply> list);
	public int getTest_4Score(@Param("list")List<TestReply> list);

	public int changeStudentState(@Param("studentId")int studentId, @Param("stateId")int stateId);

	public int getStudentState(@Param("studentId")int studentId);
}
