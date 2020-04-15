package com.great.entity;

import java.io.Serializable;
import java.util.Date;

public class ExamOrder implements Serializable
{
	private Date orderTime;
	private String subject;

	public ExamOrder()
	{
	}

	public ExamOrder(Date orderTime, String subject)
	{
		this.orderTime = orderTime;
		this.subject = subject;
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

	@Override
	public String toString()
	{
		return "ExamOrder{" + "orderTime=" + orderTime + ", subject='" + subject + '\'' + '}';
	}

}
