package com.great.service;


import com.great.entity.*;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;

public interface StudentManageService
{

	Student login(String account, String pwd,HttpServletRequest request);

	String checkStudyAuthority(String studentId, String vedioId, String subject);

	String addStudy1Time(String studentId, String subject);

	QuestionList getQuestionsBySubject(String subject);

	String importFace(String studentId, String face);

	String faceCheck(String studentid, String face, String subject);

	int getTestScore(TestReplies testReplieslist);

	String getStudentState(String studentId, String subject);

	List<StudyCondition> getStudyCondition(String studentId, String status, HttpServletRequest request);

	List<Score> getMyScore(String studentId);

	List<ExamOrder> getOrderTime(String studentId);

	List<EvaluationToSchool> getAllEvaForSchool(String schoolId);

	String addEvaForSchool(String schoolId, String content);

	List<EvaluationToCoach> getAllEvaForCoach(String coachId);

	String addEvaForCoach(String coachId, String content);

	int updatePwd(Integer id,String account, String pwd);

	List<Question> wrongQuestion(String subject,Integer studentId);

	String delWrongQuestion(String studentId, String subject, String qid);

	String addWrongQuestion(WrongQuestions wrongQuestions);
	//	public User findUser(String uname, String pwd);
//	public List<User> findAll(HashMap<String, Object> map) throws SQLException;
//
//	public String getMenu(String roleid, HttpServletResponse response) throws SQLException;
//
//	public UserList getUserList(String page, String limit, String uname, String pwd, HttpServletResponse response) throws SQLException;
//
//	public HashMap<String,Object>  getHasMenu(String roleid) throws SQLException;
//
//	public String changeMenu(String[] menuid, String roleid) throws Exception;
//
//	public void uploadFile(User user, String filename);
//
//	public FileList getFileList(String page, String limit, String uname, String pwd, HttpServletResponse response);
}
