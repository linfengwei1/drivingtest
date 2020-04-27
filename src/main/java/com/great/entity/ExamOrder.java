package com.great.entity;

import java.io.Serializable;
import java.util.Date;

public class ExamOrder implements Serializable
{
	private Date orderTime;
	private String subject;
	private int status;
	private int examid;
	private int studentid;

	public ExamOrder()
	{
	}

	public ExamOrder(Date orderTime, String subject, int status, int examid, int studentid)
	{
		this.orderTime = orderTime;
		this.subject = subject;
		this.status = status;
		this.examid = examid;
		this.studentid = studentid;
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

	public int getStudentid()
	{
		return studentid;
	}

	public void setStudentid(int studentid)
	{
		this.studentid = studentid;
	}

	@Override
	public String toString()
	{
		return "ExamOrder{" + "orderTime=" + orderTime + ", subject='" + subject + '\'' + ", status=" + status + ", examid=" + examid + ", studentid=" + studentid + '}';
	}
}
