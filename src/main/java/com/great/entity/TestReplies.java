package com.great.entity;

import java.io.Serializable;
import java.util.List;

public class TestReplies implements Serializable
{
	private int studentId;
	private int subject;
	private List<TestReply> testReplieslist;

	public TestReplies()
	{
	}

	public TestReplies(int studentId, int subject, List<TestReply> testReplieslist)
	{
		this.studentId = studentId;
		this.subject = subject;
		this.testReplieslist = testReplieslist;
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

	public List<TestReply> getTestReplieslist()
	{
		return testReplieslist;
	}

	public void setTestReplieslist(List<TestReply> testReplieslist)
	{
		this.testReplieslist = testReplieslist;
	}
}
