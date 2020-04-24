package com.great.entity;

public class OrderTime
{
	private Integer id;
	private Integer subject;
	private String dateTime;

	public OrderTime()
	{
	}

	public OrderTime(Integer id, Integer subject, String dateTime)
	{
		this.id = id;
		this.subject = subject;
		this.dateTime = dateTime;
	}

	public Integer getId()
	{
		return id;
	}

	public void setId(Integer id)
	{
		this.id = id;
	}

	public Integer getSubject()
	{
		return subject;
	}

	public void setSubject(Integer subject)
	{
		this.subject = subject;
	}

	public String getDateTime()
	{
		return dateTime;
	}

	public void setDateTime(String dateTime)
	{
		this.dateTime = dateTime;
	}
}
