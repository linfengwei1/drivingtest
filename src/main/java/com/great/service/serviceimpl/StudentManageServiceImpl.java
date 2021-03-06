package com.great.service.serviceimpl;


import com.great.aoplog.Log;
import com.great.dao.IStudentDao;
import com.great.dao.SchoolCoachDao;
import com.great.entity.*;
import com.great.service.StudentManageService;
import com.great.utils.FaceRecognitionUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;

@Service("studentManageServiceImpl")
@Transactional
public class StudentManageServiceImpl implements StudentManageService
{

	@Resource
	private IStudentDao studentDao;

	@Override
	@Log(operationType = "学员操作", operationName = "学员登录")
	public Student login(String account, String pwd, HttpServletRequest request)
	{
		Student student = null;
		HashMap<String,String> map = new HashMap<>();
		map.put("account", account);
		map.put("pwd", pwd);
		student = studentDao.login(map);
		if(student != null)
		{
			request.getSession().setAttribute("student",student);
		}

		return student;
	}

	@Override
	@Log(operationType = "学员操作", operationName = "学员观看视频")
	public String checkStudyAuthority(String studentId, String vedioId, String subject)
	{
		String result = null;
		switch(Integer.parseInt(subject)){
		    case 1://查询科一学时，并且判断是否有权限观看该视频
			    HashMap<String,Integer> map = new HashMap<>();
			    map.put("studentId", Integer.parseInt(studentId));//传学员ID
			    map.put("subject", Integer.parseInt(subject));//传科目ID
			    int finishTime = studentDao.checkStudyAuthority(map);
			    int stage = studentDao.getStudentState(Integer.parseInt(studentId));

			    if(stage>1)
			    {
			    	result = "free";//学员不属于1阶段  自由观看视频
			    	break;
			    }

			    if(finishTime == 0)//学员没看过视频
			    {
			    	if(Integer.parseInt(vedioId)==1)//学员选择看视频1
				    {
					    result = "first";//表示第一次看
				    }else
				    {
					    result = "error";//表示没有权限看视频
				    }
			    }else if(finishTime == 1)//学员只看过视频1
			    {
				    if(Integer.parseInt(vedioId)==1)//学员选择看视频0
				    {
					    result = "free";//表示可以自由看，不记录学时
				    }else if(Integer.parseInt(vedioId)==2)//学员选择看视频2
				    {
					    result = "first";//表示第一次看
				    }else
			        {
				        result = "error";//表示没有权限看视频
				    }
			    }else if(finishTime == 2)//学员只看过视频2
			    {
				    if(Integer.parseInt(vedioId)==1)//学员选择看视频0
				    {
					    result = "free";//表示可以自由看，不记录学时
				    }else if(Integer.parseInt(vedioId)==2)//学员选择看视频2
				    {
					    result = "free";//表示可以自由看，不记录学时
				    }else
				    {
					    result = "first";//表示第一次看
				    }
			    }else if(finishTime == 3)//学员只看过视频3
			    {
				    result = "free";
			    }
		        break;
		    case 4:
			    HashMap<String,Integer> map1 = new HashMap<>();
			    map1.put("studentId", Integer.parseInt(studentId));//传学员ID
			    map1.put("subject", Integer.parseInt(subject));//传科目ID
			    int finishTime_4 = studentDao.checkStudyAuthority(map1);
			    int stage_1 = studentDao.getStudentState(Integer.parseInt(studentId));

			    if(stage_1>4)
			    {
				    result = "free";//学员大于4阶段  自由观看视频
				    break;
			    }else if(stage_1 < 4)
			    {
				    result = "error";//学员小于4阶段  禁止观看视频
				    break;
			    }

			    if(finishTime_4 == 0)//学员没看过视频
			    {
				    if(Integer.parseInt(vedioId)==1)//学员选择看视频1
				    {
					    result = "first";//表示第一次看
				    }else
				    {
					    result = "error";//表示没有权限看视频
				    }
			    }else if(finishTime_4 == 1)//学员只看过视频1
			    {
				    if(Integer.parseInt(vedioId)==1)//学员选择看视频0
				    {
					    result = "free";//表示可以自由看，不记录学时
				    }else if(Integer.parseInt(vedioId)==2)//学员选择看视频2
				    {
					    result = "first";//表示第一次看
				    }else
				    {
					    result = "error";//表示没有权限看视频
				    }
			    }else if(finishTime_4 == 2)//学员只看过视频2
			    {
				    if(Integer.parseInt(vedioId)==1)//学员选择看视频0
				    {
					    result = "free";//表示可以自由看，不记录学时
				    }else if(Integer.parseInt(vedioId)==2)//学员选择看视频2
				    {
					    result = "free";//表示可以自由看，不记录学时
				    }else
				    {
					    result = "first";//表示第一次看
				    }
			    }else if(finishTime_4 == 3)//学员只看过视频3
			    {
				    result = "free";
			    }
		        break;
		}
		return result;
	}

	@Override
	@Transactional
	@Log(operationType = "学员操作", operationName = "学员科目1增加学时")
	public String addStudy1Time(String studentId, String subject)
	{
		int i = studentDao.addStudy1Time(Integer.parseInt(studentId),Integer.parseInt(subject));
		if(i>0)
		{
			return "success";

		}else {
			return "error";
		}
	}

	@Override
	@Log(operationType = "学员操作", operationName = "学员获取在线练习页面")
	public QuestionList getQuestionsBySubject(String subject)
	{

		List<Question> choices;
		List<Question> judges;

		if(subject.equals("1"))//获取科目一题目
		{
			choices = studentDao.getChoicesBySubject_1();//获得选择题和判断题
			judges = studentDao.getjudgesBySubject_1();
		}else
		{
			choices = studentDao.getChoicesBySubject_4();
			judges = studentDao.getjudgesBySubject_4();
		}
		QuestionList questionList = new QuestionList();
		questionList.setChoice(choices);
		questionList.setJudge(judges);
		System.out.println("判断题大小"+judges.size());
		System.out.println("选择题大小"+choices.size());
		return questionList;
	}

	@Override
	@Transactional
	@Log(operationType = "学员操作", operationName = "学员录入人脸信息")
	public String importFace(String studentId, String face)
	{
		String result = null;
		result = FaceRecognitionUtils.faceRegister(face,studentId);

		if("success".equals(result))
		{
			//导入成功，修改用户脸型信息录入成功
			System.out.println("插入数据库");
			studentDao.setStudentIsIdentified(Integer.parseInt(studentId));
		}

		return result;
	}

	@Override
	@Transactional
	@Log(operationType = "学员操作", operationName = "学员登录打卡")
	public String faceCheck(String studentid, String face,String subject)
	{

		String result = null;
		result = FaceRecognitionUtils.identify(face,Integer.parseInt(studentid));
		if(result.equals("again") || result.equals("error"))
		{
			return result;
		}

		//1.先检查学时有没有打满，打满了不需要打卡
		HashMap<String,Integer> map = new HashMap<>();
		map.put("studentId", Integer.parseInt(studentid));//传学员ID
		map.put("subject", Integer.parseInt(subject));//传科目ID
		int finishTime = studentDao.checkStudyAuthority(map);
		Timestamp time  = new Timestamp(System.currentTimeMillis());//获取当前时间

		//是否一天内重复打卡
		int repeatSign = studentDao.checkReapSignUp(Integer.parseInt(studentid),Integer.parseInt(subject));

		System.out.println("今天打卡数量:"+repeatSign);
		//检查是否打满学时
		if(finishTime == 3)
		{
			result =  "full";
		}else
		{
			if(repeatSign == 2)
			{
				result =  "repeat";//一天内重复打卡
			}else if(repeatSign == 1)//签退打卡
			{
				//得到和今天第一次打卡时间差
				int diff = studentDao.getTimeDiff(Integer.parseInt(studentid),Integer.parseInt(subject));
				System.out.println("时间差"+diff);
				if(diff>=6)//大于6小时签退，学时记录有效
				{

					//认证成功，记录打卡
					studentDao.addStudyTime(Integer.parseInt(studentid),Integer.parseInt(subject));
					studentDao.addSignUpRecord(Integer.parseInt(studentid),Integer.parseInt(subject),time);

				}else
				{
					result = "notEffect";//记录学时失败
					studentDao.addSignUpRecord(Integer.parseInt(studentid),Integer.parseInt(subject),time);

				}
			}else if(repeatSign == 0)//今天第一次打卡
			{
				//认证成功，记录打卡
				studentDao.addSignUpRecord(Integer.parseInt(studentid),Integer.parseInt(subject),time);
			}
		}




		return result;
	}

	@Override
	@Transactional
	@Log(operationType = "学员操作", operationName = "学员提交试卷得到考试分数")
	public int getTestScore(TestReplies testReplieslist)
	{
		int score = 0;
		if(testReplieslist.getSubject() == 1)//得到科目一考试分数
		{   //计算出成绩
			score = studentDao.getTest_1Score(testReplieslist.getTestReplieslist());
				//写入成绩
			studentDao.updatePractiseScore(testReplieslist.getStudentId(),score,testReplieslist.getSubject());
		}else if(testReplieslist.getSubject() == 4)//考科目四
		{
			score = studentDao.getTest_4Score(testReplieslist.getTestReplieslist());
			//写入成绩
			studentDao.updatePractiseScore(testReplieslist.getStudentId(),score,testReplieslist.getSubject());
		}

		System.out.println("本次考试得了"+score);

		return score;
	}

	@Override
	@Log(operationType = "学员操作", operationName = "判断是否可以模拟考试")
	public String getStudentState(String studentId, String subject)
	{
		String resulet = null;
		//1.先检查学时有没有打满，打满了才能模拟考试
		HashMap<String,Integer> map = new HashMap<>();
		map.put("studentId", Integer.parseInt(studentId));//传学员ID
		map.put("subject", Integer.parseInt(subject));//传科目ID
		int finishTime = studentDao.checkStudyAuthority(map);
		int score = studentDao.getPractiseScoreById(map);//得到模拟考试分数

		System.out.println("模拟考分数是"+score);
		int state = studentDao.getStudentState(Integer.parseInt(studentId));
		if(subject.equals("1") && state == 1 && finishTime == 3 && score < 90)//学员处于科目一状态同时申请科目一考试//判断学时是否打满//判断考试分数小于90
		{
			resulet = "success";
		}else if(subject.equals("4") && state == 4 && finishTime == 3 && score < 90)
		{
			resulet = "success";
		}else
		{
			resulet = "error";
		}
		return resulet;
	}


	@Override
	@Transactional
	@Log(operationType = "学员操作", operationName = "得到学习状态信息")
	public List<StudyCondition>  getStudyCondition(String studentId, String status, HttpServletRequest request)
	{
		int stage = studentDao.getStudentState(Integer.parseInt(studentId));
		int newStage = 0;
		List<StudyCondition> list =  studentDao.getStudyConditionById(Integer.parseInt(studentId));

		if(stage == 13)//处于考试科目一中  判断成绩有没有及格
		{
			int isPass = studentDao.judgePass(Integer.parseInt(studentId),1);
			if(isPass > 0)//通过考试
			{
				studentDao.setStage(Integer.parseInt(studentId),2);//进入下一阶段
				Student student = (Student) request.getSession().getAttribute("student");
				student.setStudent_state_id(2);
				request.getSession().setAttribute("student",student);
			}else
			{
				studentDao.setStage(Integer.parseInt(studentId),1);//挂科
				Student student = (Student) request.getSession().getAttribute("student");
				student.setStudent_state_id(1);
				request.getSession().setAttribute("student",student);
			}
		}else if(stage == 14)
		{
			int isPass = studentDao.judgePass(Integer.parseInt(studentId),2);
			if(isPass > 0)//通过考试
			{
				studentDao.setStage(Integer.parseInt(studentId),3);//进入下一阶段
				Student student = (Student) request.getSession().getAttribute("student");
				student.setStudent_state_id(3);
				request.getSession().setAttribute("student",student);
			}else
			{
				studentDao.setStage(Integer.parseInt(studentId),2);//挂科
				Student student = (Student) request.getSession().getAttribute("student");
				student.setStudent_state_id(2);
				request.getSession().setAttribute("student",student);
			}

		}else if(stage == 15)
		{
			int isPass = studentDao.judgePass(Integer.parseInt(studentId),3);
			if(isPass > 0)//通过考试
			{
				studentDao.setStage(Integer.parseInt(studentId),4);//进入下一阶段
				Student student = (Student) request.getSession().getAttribute("student");
				student.setStudent_state_id(4);
				request.getSession().setAttribute("student",student);
			}else
			{
				studentDao.setStage(Integer.parseInt(studentId),3);//挂科
				Student student = (Student) request.getSession().getAttribute("student");
				student.setStudent_state_id(3);
				request.getSession().setAttribute("student",student);
			}
		}else if(stage == 16)
		{
			int isPass = studentDao.judgePass(Integer.parseInt(studentId),4);
			if(isPass > 0)//通过考试
			{
				studentDao.setStage(Integer.parseInt(studentId),7);//进入下一阶段
				Student student = (Student) request.getSession().getAttribute("student");
				student.setStudent_state_id(7);
				request.getSession().setAttribute("student",student);
			}else
			{
				studentDao.setStage(Integer.parseInt(studentId),4);//挂科
				Student student = (Student) request.getSession().getAttribute("student");
				student.setStudent_state_id(4);
				request.getSession().setAttribute("student",student);
			}
		}


//		for (StudyCondition s : list)
//		{
//			//遍历学习状态列表，如果处于当前阶段，且分数大于90，说明阶段有变化，则进入下一阶段  status为当前阶段
//			if(stage == 13 && s.getSubject_id() == 1)
//			{
//				if(s.getScore() >=90)
//				{
//					studentDao.setStage(Integer.parseInt(studentId),2);//进入下一阶段
//					Student student = (Student) request.getSession().getAttribute("student");
//					student.setStudent_state_id(2);
//					request.getSession().setAttribute("student",student);
//					return list;
//
//				}else if(0<=s.getScore())
//				{
//					studentDao.setStage(Integer.parseInt(studentId),1);//没过状态返回到1阶段
//					Student student = (Student) request.getSession().getAttribute("student");
//					student.setStudent_state_id(1);
//					request.getSession().setAttribute("student",student);
//					return list;
//				}
////
//			}else if(stage == 14 && s.getSubject_id() == 2)
//			{
//				if(s.getScore() >=90)
//				{
//					studentDao.setStage(Integer.parseInt(studentId),3);//进入下一阶段
//					Student student = (Student) request.getSession().getAttribute("student");
//					student.setStudent_state_id(3);
//					request.getSession().setAttribute("student",student);
//					return list;
//				}else if(0<=s.getScore())
//				{
//					studentDao.setStage(Integer.parseInt(studentId),2);//没过状态返回到1阶段
//					Student student = (Student) request.getSession().getAttribute("student");
//					student.setStudent_state_id(2);
//					request.getSession().setAttribute("student",student);
//					return list;
//				}
//			}else if(stage == 15 && s.getSubject_id() == 3)
//			{
//				if(s.getScore() >=90)
//				{
//					studentDao.setStage(Integer.parseInt(studentId),4);//进入下一阶段
//					Student student = (Student) request.getSession().getAttribute("student");
//					student.setStudent_state_id(4);
//					request.getSession().setAttribute("student",student);
//					return list;
//				}else if(0<=s.getScore())
//				{
//					studentDao.setStage(Integer.parseInt(studentId),3);//没过状态返回到1阶段
//					Student student = (Student) request.getSession().getAttribute("student");
//					student.setStudent_state_id(3);
//					request.getSession().setAttribute("student",student);
//					return list;
//				}
//			}else if(stage == 16 && s.getSubject_id() == 4)
//			{
//				if(s.getScore() >=90)
//				{
//					studentDao.setStage(Integer.parseInt(studentId),7);//进入下一阶段
//					Student student = (Student) request.getSession().getAttribute("student");
//					student.setStudent_state_id(7);
//					request.getSession().setAttribute("student",student);
//					return list;
//				}else if(0<=s.getScore())
//				{
//					studentDao.setStage(Integer.parseInt(studentId),4);//没过状态返回到1阶段
//					Student student = (Student) request.getSession().getAttribute("student");
//					student.setStudent_state_id(4);
//					request.getSession().setAttribute("student",student);
//					return list;
//				}
//			}
//		}
		return list;
	}

	@Override
	@Log(operationType = "学员操作", operationName = "获取考试分数")
	public List<Score> getMyScore(String studentId)
	{
		List<Score> list =  studentDao.getMyScore(Integer.parseInt(studentId));

		return list;
	}

	@Override
	@Log(operationType = "学员操作", operationName = "获取考试预约时间")
	public List<ExamOrder> getOrderTime(String studentId)
	{
		List<ExamOrder> list =  studentDao.getOrderTime(Integer.parseInt(studentId));

		return list;
	}

	@Override
	@Log(operationType = "学员操作", operationName = "获取对学校的评价")
	public List<EvaluationToSchool> getAllEvaForSchool(String schoolId)
	{
		List<EvaluationToSchool> list =  studentDao.getAllEvaForSchool(Integer.parseInt(schoolId));

		return list;
	}

	@Override
	@Transactional
	@Log(operationType = "学员操作", operationName = "添加对学校的评价")
	public String addEvaForSchool(String schoolId, String content)
	{
		String result = null;
		int n = studentDao.addEvaForSchool(Integer.parseInt(schoolId),content);
		if(n>0)
		{
			result = "success";
		}
		return result;
	}

	@Override
	@Log(operationType = "学员操作", operationName = "获取对教练的评价")
	public List<EvaluationToCoach> getAllEvaForCoach(String coachId)
	{
		List<EvaluationToCoach> list =  studentDao.getAllEvaForCoach(Integer.parseInt(coachId));

		return list;
	}

	@Override
	@Transactional
	@Log(operationType = "学员操作", operationName = "增加对教练的评价")
	public String addEvaForCoach(String coachId, String content)
	{
		String result = null;
		int n = studentDao.addEvaForCoach(Integer.parseInt(coachId),content);//增加对教练评论
		if(n>0)
		{
			result = "success";
		}
		return result;
	}

	@Override
	@Transactional
	@Log(operationType = "学员操作", operationName = "更改密码")
	public int updatePwd(Integer id,String account, String pwd)
	{
		int n = studentDao.updatePwd(id,account,pwd);
		return n;
	}

	@Override
	@Log(operationType = "学员操作", operationName = "得到错题集")
	public List<Question> wrongQuestion(String subject, Integer studentId)
	{
		List<Question> list;

		if(subject.equals("1"))//获取科目一题目
		{
			list = studentDao.getWrongQuestion_1byStudentId(studentId);//获得选择题和判断题
		}else
		{
			list = studentDao.getWrongQuestion_4byStudentId(studentId);
		}

		return list;
	}

	@Override
	@Transactional
	@Log(operationType = "学员操作", operationName = "删除错题")
	public String delWrongQuestion(String studentId, String subject, String qid)
	{
		String result = null;
		int i = 0;

		if(subject.equals("1"))
		{
		    i = studentDao.delWrongQuestion1(Integer.parseInt(studentId),Integer.parseInt(subject),Integer.parseInt(qid));
		}else
		{
			i = studentDao.delWrongQuestion4(Integer.parseInt(studentId),Integer.parseInt(subject),Integer.parseInt(qid));

		}

		if(i > 0)
		{
			result = "success";
		}else
		{
			result = "error";
		}
		return result;
	}

	@Override
	@Transactional
	@Log(operationType = "学员操作", operationName = "增加错题")
	public String addWrongQuestion(WrongQuestions wrongQuestions)
	{
		String result = null;
		int i = 0;

		if(wrongQuestions.getSubject() == 1)
		{
			i = studentDao.addWrongQuestion1(wrongQuestions.getWrongList(),wrongQuestions.getStudentId());
		}else
		{
			i = studentDao.addWrongQuestion4(wrongQuestions.getWrongList(),wrongQuestions.getStudentId());
		}

		if(i > 0)
		{
			result = "success";
		}else
		{
			result = "error";
		}
		return result;
	}
}
