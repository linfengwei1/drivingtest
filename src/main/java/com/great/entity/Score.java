package com.great.entity;

import java.io.Serializable;
import java.sql.Timestamp;

public class Score implements Serializable
{

	private int score;
	private Timestamp examTime;
	private String subject;


	public Score()
	{
	}

	public Score(int score, Timestamp examTime, String subject)
	{
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
}
