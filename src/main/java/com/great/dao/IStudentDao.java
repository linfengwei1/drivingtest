package com.great.dao;


import com.great.aoplog.SystemLog;
import com.great.entity.*;
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

	public int addStudy1Time(@Param("studentId") int studentId, @Param("subject") int subject);

	public List<Question> getChoicesBySubject_1();
	public List<Question> getjudgesBySubject_1();

	public List<Question> getChoicesBySubject_4();
	public List<Question> getjudgesBySubject_4();

	public List<Question> getWrongQuestion_1byStudentId(@Param("studentId") int studentId);
	public List<Question> getWrongQuestion_4byStudentId(@Param("studentId") int studentId);

	public void setStudentIsIdentified(@Param("studentId") int studentId);

	public void addStudyTime(@Param("studentId") int studentId, @Param("subject") int subject);

	public void addSignUpRecord(@Param("studentId") int studentId, @Param("subject") int subject, @Param("time") Timestamp time);
	public int checkReapSignUp(@Param("studentId") int studentId, @Param("subject") int subject);

	public int getTest_1Score(@Param("list") List<TestReply> list);
	public int getTest_4Score(@Param("list") List<TestReply> list);

	public int changeStudentState(@Param("studentId") int studentId, @Param("stateId") int stateId);
	// 查询学员处于什么阶段
	public int getStudentState(@Param("studentId") int studentId);
	public int getTimeDiff(@Param("studentId") int studentId, @Param("subject") int subject);

	int getPractiseScoreById(HashMap<String, Integer> map);
	int getScoreById(HashMap<String, Integer> map);

	List<StudyCondition> getStudyConditionById(@Param("studentId") int studentId);

	List<Score> getMyScore(@Param("studentId") int studentId);

	List<ExamOrder> getOrderTime(int parseInt);

	void updatePractiseScore(@Param("studentId") int studentId, @Param("score") int score, @Param("subject")int subject);

	void setStage(@Param("studentId") int studentId, @Param("stage") int stage);

	List<EvaluationToSchool> getAllEvaForSchool(@Param("school_id") int school_id);

	int addEvaForSchool(@Param("school_id") int school_id, @Param("content") String content);

	List<EvaluationToCoach> getAllEvaForCoach(@Param("coachId") int coachId);

	int addEvaForCoach(@Param("coachId") int coachId, @Param("content") String content);

	int updatePwd(@Param("id") int id, @Param("account") String account, @Param("pwd") String pwd);

	int delWrongQuestion1(@Param("studentId") int studentId, @Param("subject") int subject, @Param("qid") int qid);
	int delWrongQuestion4(@Param("studentId") int studentId, @Param("subject") int subject, @Param("qid") int qid);

	int addWrongQuestion1(@Param("list") List<Integer> wrongList, @Param("studentId") int studentId);
	int addWrongQuestion4(@Param("list") List<Integer> wrongList, @Param("studentId") int studentId);

	void insertLog(SystemLog systemLog);

	void updateOrderStatus(@Param("studentId") int studentId);
}
