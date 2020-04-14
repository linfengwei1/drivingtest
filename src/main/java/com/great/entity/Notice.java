package com.great.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

public class Notice
{
	private Integer id;//公告id
	private String title;//公告标题
	private String content;//公告内容

	@JsonFormat(timezone = "GMT+8", pattern = "yyyy-MM-dd HH:mm")
	@DateTimeFormat(pattern ="yyyy-MM-dd")
	private Date time;//发布时间

	private String type;//公告类型

	public Notice() {
	}

	public Notice(Integer id, String title, String content, Date time, String type)
	{
		this.id = id;
		this.title = title;
		this.content = content;
		this.time = time;
		this.type = type;
	}

	public Integer getId()
	{
		return id;
	}
	public void setId(Integer id)
	{
		this.id = id;
	}

	public String getTitle()
	{
		return title;
	}
	public void setTitle(String title)
	{
		this.title = title;
	}

	public String getContent()
	{
		return content;
	}
	public void setContent(String content)
	{
		this.content = content;
	}

	public Date getTime()
	{
		return time;
	}
	public void setTime(Date time)
	{
		this.time = time;
	}

	public String getType()
	{
		return type;
	}
	public void setType(String type)
	{
		this.type = type;
	}

	@Override
	public String toString()
	{
		return "Notice{" +
				"id=" + id +
				", title='" + title + '\'' +
				", content='" + content + '\'' +
				", time=" + time +
				", type='" + type + '\'' + '}';
	}
}
