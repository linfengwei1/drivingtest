package com.great.entity;

import java.io.Serializable;
import java.sql.Timestamp;

public class Score implements Serializable
{

	private int examId;//准考证号
	private int score;
	private Timestamp examTime;
	private String subject;


	public Score()
	{
	}

	public Score(int examId, int score, Timestamp examTime, String subject)
	{
		this.examId = examId;
		this.score = score;
		this.examTime = examTime;
		this.subject = subject;
	}

	public int getScore()
	{
		return score;
	}

	public void setScore(int score)
	{
		this.score = score;
	}

	public Timestamp getExamTime()
	{
		return examTime;
	}

	public void setExamTime(Timestamp examTime)
	{
		this.examTime = examTime;
	}

	public String getSubject()
	{
		return subject;
	}

	public void setSubject(String subject)
	{
		this.subject = subject;
	}

	public int getExamId()
	{
		return examId;
	}

	public void setExamId(int examId)
	{
		this.examId = examId;
	}
}
