package com.great.entity;

import com.sun.tools.corba.se.idl.constExpr.Times;
import org.springframework.stereotype.Component;

import java.io.Serializable;
import java.sql.Timestamp;
/**
 * 学习条件表
 */
@Component
public class StudyCondition implements Serializable
{

	private int id;
	private int subject_id;
	private int time;
	private int score;
	private int student_id;
	private int practise_score;


	public StudyCondition()
	{
	}

	public StudyCondition(int id, int subject_id, int time, int score, int student_id, int practise_score)
	{
		this.id = id;
		this.subject_id = subject_id;
		this.time = time;
		this.score = score;
		this.student_id = student_id;
		this.practise_score = practise_score;
	}

	public int getId()
	{
		return id;
	}

	public void setId(int id)
	{
		this.id = id;
	}

	public int getSubject_id()
	{
		return subject_id;
	}

	public void setSubject_id(int subject_id)
	{
		this.subject_id = subject_id;
	}

	public int getTime()
	{
		return time;
	}

	public void setTime(int time)
	{
		this.time = time;
	}

	public int getScore()
	{
		return score;
	}

	public void setScore(int score)
	{
		this.score = score;
	}

	public int getStudent_id()
	{
		return student_id;
	}

	public void setStudent_id(int student_id)
	{
		this.student_id = student_id;
	}

	public int getPractise_score()
	{
		return practise_score;
	}

	public void setPractise_score(int practise_score)
	{
		this.practise_score = practise_score;
	}


	@Override
	public String toString()
	{
		return "StudyCondition{" + "id=" + id + ", subject_id=" + subject_id + ", time=" + time + ", score=" + score + ", student_id=" + student_id + ", practise_score=" + practise_score + '}';
	}
}
