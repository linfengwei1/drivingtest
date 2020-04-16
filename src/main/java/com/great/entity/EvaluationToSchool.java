package com.great.entity;

import java.io.Serializable;
import java.util.Date;

public class EvaluationToSchool implements Serializable
{
	private int id;
	private String content;
	private int school_id;
	private Date time;

	public EvaluationToSchool()
	{
	}

	public EvaluationToSchool(int id, String content, int school_id, Date time)
	{
		this.id = id;
		this.content = content;
		this.school_id = school_id;
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

	public int getSchool_id()
	{
		return school_id;
	}

	public void setSchool_id(int school_id)
	{
		this.school_id = school_id;
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
