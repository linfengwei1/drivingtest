package com.great.service.serviceimpl;


import com.great.aoplog.Log;
import com.great.dao.IStudentDao;
import com.great.entity.Question;
import com.great.entity.QuestionList;
import com.great.entity.Student;
import com.great.service.StudentManageService;
import com.great.utils.FaceRecognitionUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;

@Service("studentManageServiceImpl")
@Transactional
public class StudentManageServiceImpl implements StudentManageService
{

	@Resource
	private IStudentDao studentDao;


	@Override
	@Log(operationType = "登录操作", operationName = "学员登录")
	public Student login(String account, String pwd)
	{
		Student student = null;
		HashMap<String,String> map = new HashMap<>();
		map.put("account", account);
		map.put("pwd", pwd);
		student = studentDao.login(map);
		return student;
	}

	@Override
	@Log(operationType = "普通操作", operationName = "学员观看视频")
	public String checkStudyAuthority(String studentId, String vedioId, String subject)
	{
		String result = null;
		switch(Integer.parseInt(subject)){
		    case 1://查询科一学时，并且判断是否有权限观看该视频
			    HashMap<String,Integer> map = new HashMap<>();
			    map.put("studentId", Integer.parseInt(studentId));//传学员ID
			    map.put("subject", Integer.parseInt(subject));//传科目ID
			    int finishTime = studentDao.checkStudyAuthority(map);
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
		        break;

		}
		return result;
	}

	@Override
	@Transactional
	@Log(operationType = "普通操作", operationName = "学员科目1增加学时")
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
	@Log(operationType = "普通操作", operationName = "学员获取在线练习页面")
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
	@Log(operationType = "普通操作", operationName = "学员录入人脸信息")
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
	@Log(operationType = "普通操作", operationName = "学员登录打卡")
	public String faceCheck(String studentid, String face,String subject)
	{

		String result = null;
		result = FaceRecognitionUtils.identify(face,Integer.parseInt(studentid));

		if("success".equals(result))
		{
			//认证成功，记录打卡
			System.out.println("插入数据库");
			studentDao.addStudyTime(Integer.parseInt(studentid),Integer.parseInt(subject));
		}

		return result;
	}
}
