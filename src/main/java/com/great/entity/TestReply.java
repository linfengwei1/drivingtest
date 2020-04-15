package com.great.entity;

import java.io.Serializable;

public class TestReply implements Serializable
{
	private int id;//题目id
	private int answer;//题目选项答案

	public TestReply()
	{
	}

	public TestReply(int id, int answer)
	{
		this.id = id;
		this.answer = answer;
	}

	public int getId()
	{
		return id;
	}

	public void setId(int id)
	{
		this.id = id;
	}

	public int getAnswer()
	{
		return answer;
	}

	public void setAnswer(int answer)
	{
		this.answer = answer;
	}

	@Override
	public String toString()
	{
		return "TestReply{" + "id=" + id + ", answer=" + answer + '}';
	}
}
