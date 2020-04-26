package com.great.entity;

import java.io.Serializable;
import java.util.Date;

public class ExamOrder implements Serializable
{
	private Date orderTime;
	private String subject;
	private int status;
	private int examid;

	public ExamOrder()
	{
	}

	public ExamOrder(Date orderTime, String subject, int status, int examid)
	{
		this.orderTime = orderTime;
		this.subject = subject;
		this.status = status;
		this.examid = examid;
	}

	public Date getOrderTime()
	{
		return orderTime;
	}

	public void setOrderTime(Date orderTime)
	{
		this.orderTime = orderTime;
	}

	public String getSubject()
	{
		return subject;
	}

	public void setSubject(String subject)
	{
		this.subject = subject;
	}

	public int getStatus()
	{
		return status;
	}

	public void setStatus(int status)
	{
		this.status = status;
	}

	public int getExamid()
	{
		return examid;
	}

	public void setExamid(int examid)
	{
		this.examid = examid;
	}

	@Override
	public String toString()
	{
		return "ExamOrder{" + "orderTime=" + orderTime + ", subject='" + subject + '\'' + ", status=" + status + ", examid=" + examid + '}';
	}
}
