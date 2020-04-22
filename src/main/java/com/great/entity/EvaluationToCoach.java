package com.great.entity;

import java.io.Serializable;
import java.util.Date;

public class EvaluationToCoach implements Serializable
{
	private int id;
	private String content;
	private int coachId;
	private Date time;

	public EvaluationToCoach()
	{
	}

	public EvaluationToCoach(int id, String content, int coachId, Date time)
	{
		this.id = id;
		this.content = content;
		this.coachId = coachId;
		this.time = time;
	}

	public int getId()
	{
		return id;
	}

	public void setId(int id)
	{
		this.id = id;
	}

	public String getContent()
	{
		return content;
	}

	public void setContent(String content)
	{
		this.content = content;
	}

	public int getCoachId()
	{
		return coachId;
	}

	public void setCoachId(int coachId)
	{
		this.coachId = coachId;
	}

	public Date getTime()
	{
		return time;
	}

	public void setTime(Date time)
	{
		this.time = time;
	}
}
