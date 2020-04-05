package com.great.entity;


import java.util.List;

public class UserList
{
	private int code;
	private String msg;
	private int count;
	private List<User> data;

	public UserList()
	{
	}

	public UserList(int code, String msg, int count, List<User> data)
	{
		this.code = code;
		this.msg = msg;
		this.count = count;
		this.data = data;
	}

	public int getCode()
	{
		return code;
	}

	public void setCode(int code)
	{
		this.code = code;
	}

	public String getMsg()
	{
		return msg;
	}

	public void setMsg(String msg)
	{
		this.msg = msg;
	}

	public int getCount()
	{
		return count;
	}

	public void setCount(int count)
	{
		this.count = count;
	}

	public List<User> getData()
	{
		return data;
	}

	public void setData(List<User> data)
	{
		this.data = data;
	}
}
