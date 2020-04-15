package com.great.service;


import com.great.entity.*;

import java.util.HashMap;
import java.util.List;

public interface StudentManageService
{

	Student login(String account, String pwd);

	String checkStudyAuthority(String studentId, String vedioId, String subject);

	String addStudy1Time(String studentId, String subject);

	QuestionList getQuestionsBySubject(String subject);

	String importFace(String studentId, String face);

	String faceCheck(String studentid, String face,String subject);

	int getTestScore(TestReplies testReplieslist);

	String getStudentState(String studentId, String subject);

	List<StudyCondition> getStudyCondition(String studentId);

	List<Score> getMyScore(String studentId);

	List<ExamOrder> getOrderTime(String studentId);
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
