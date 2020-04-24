package com.great.entity;

import java.io.Serializable;
import java.util.List;

public class Orders implements Serializable
{
	private String subject;
	private String time;
	private List<Integer> studentIds;

	public Orders()
	{
	}

	public Orders(String subject, String time, List<Integer> studentIds)
	{
		this.subject = subject;
		this.time = time;
		this.studentIds = studentIds;
	}

	public String getSubject()
	{
		return subject;
	}

	public void setSubject(String subject)
	{
		this.subject = subject;
	}

	public String getTime()
	{
		return time;
	}

	public void setTime(String time)
	{
		this.time = time;
	}

	public List<Integer> getStudentIds()
	{
		return studentIds;
	}

	public void setStudentIds(List<Integer> studentIds)
	{
		this.studentIds = studentIds;
	}
}
