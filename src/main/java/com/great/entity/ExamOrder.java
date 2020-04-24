package com.great.entity;

import java.io.Serializable;
import java.util.Date;

public class ExamOrder implements Serializable
{
	private Date orderTime;
	private String subject;
	private int status;

	public ExamOrder()
	{
	}

	public ExamOrder(Date orderTime, String subject, int status)
	{
		this.orderTime = orderTime;
		this.subject = subject;
		this.status = status;
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

	@Override
	public String toString()
	{
		return "ExamOrder{" + "orderTime=" + orderTime + ", subject='" + subject + '\'' + ", status=" + status + '}';
	}
}
