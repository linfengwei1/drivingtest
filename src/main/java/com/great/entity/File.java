package com.great.entity;

import java.sql.Timestamp;

public class File
{
	private int id;
	private String fileName;
	private String uname;
	private int uid;
	private Timestamp uploadTime;
	private int styleId;
	private int times;
	private int score;
	private String styleName;

	public File()
	{
	}

	public File(int id, String fileName, String uname, int uid, Timestamp uploadTime, int styleId, int times,int score,String styleName)
	{
		this.id = id;
		this.fileName = fileName;
		this.uname = uname;
		this.uid = uid;
		this.uploadTime = uploadTime;
		this.styleId = styleId;
		this.times = times;
		this.score = score;
		this.styleName = styleName;
	}

	public int getId()
	{
		return id;
	}

	public void setId(int id)
	{
		this.id = id;
	}

	public String getFileName()
	{
		return fileName;
	}

	public void setFileName(String fileName)
	{
		this.fileName = fileName;
	}

	public String getUname()
	{
		return uname;
	}

	public void setUname(String uname)
	{
		this.uname = uname;
	}

	public int getUid()
	{
		return uid;
	}

	public void setUid(int uid)
	{
		this.uid = uid;
	}

	public Timestamp getUploadTime()
	{
		return uploadTime;
	}

	public void setUploadTime(Timestamp uploadTime)
	{
		this.uploadTime = uploadTime;
	}

	public int getStyleId()
	{
		return styleId;
	}

	public void setStyleId(int styleId)
	{
		this.styleId = styleId;
	}

	public int getTimes()
	{
		return times;
	}

	public void setTimes(int times)
	{
		this.times = times;
	}

	public int getScore()
	{
		return score;
	}

	public void setScore(int score)
	{
		this.score = score;
	}

	public String getStyleName()
	{
		return styleName;
	}

	public void setStyleName(String styleName)
	{
		this.styleName = styleName;
	}
}
