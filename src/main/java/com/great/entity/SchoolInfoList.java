package com.great.entity;

import java.util.List;

public class SchoolInfoList
{
	private Integer count;
	private List<SchoolInfoPage> list;

	public SchoolInfoList()
	{
	}

	public SchoolInfoList(Integer count, List<SchoolInfoPage> list)
	{
		this.count = count;
		this.list = list;
	}

	public Integer getCount()
	{
		return count;
	}

	public void setCount(Integer count)
	{
		this.count = count;
	}

	public List<SchoolInfoPage> getList()
	{
		return list;
	}

	public void setList(List<SchoolInfoPage> list)
	{
		this.list = list;
	}
}
