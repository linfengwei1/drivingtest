package com.great.entity;

import java.util.List;

public class WrongQuestions
{
	private int studentId;
	private int subject;
	private List<Integer> wrongList;

	public WrongQuestions()
	{
	}

	public WrongQuestions(int studentId, int subject, List<Integer> wrongList)
	{
		this.studentId = studentId;
		this.subject = subject;
		this.wrongList = wrongList;
	}

	public int getStudentId()
	{
		return studentId;
	}

	public void setStudentId(int studentId)
	{
		this.studentId = studentId;
	}

	public int getSubject()
	{
		return subject;
	}

	public void setSubject(int subject)
	{
		this.subject = subject;
	}

	public List<Integer> getWrongList()
	{
		return wrongList;
	}

	public void setWrongList(List<Integer> wrongList)
	{
		this.wrongList = wrongList;
	}

	@Override
	public String toString()
	{
		return "WrongQuestions{" + "studentId=" + studentId + ", subject=" + subject + ", wrongList=" + wrongList + '}';
	}
}
