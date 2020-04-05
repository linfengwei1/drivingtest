package com.great.entity;

import java.util.List;

public class TreeData
{
	private String title;
	private String id;
	private String href;
	private boolean checked;
	private List<TreeData> children;

	public TreeData()
	{
	}

	public TreeData(String title, String id, String href, boolean checked, List<TreeData> children)
	{
		this.title = title;
		this.id = id;
		this.href = href;
		this.checked = checked;
		this.children = children;
	}

	public String getTitle()
	{
		return title;
	}

	public void setTitle(String title)
	{
		this.title = title;
	}

	public String getId()
	{
		return id;
	}

	public void setId(String id)
	{
		this.id = id;
	}

	public String getHref()
	{
		return href;
	}

	public void setHref(String href)
	{
		this.href = href;
	}

	public List<TreeData> getChildren()
	{
		return children;
	}

	public void setChildren(List<TreeData> children)
	{
		this.children = children;
	}

	public boolean isChecked()
	{
		return checked;
	}

	public void setChecked(boolean checked)
	{
		this.checked = checked;
	}

	//	@Override
//	public String toString()
//	{
//		return "TreeData{" + "title='" + title + '\'' + ", id='" + id + '\'' + ", href='" + href + '\'' + ", children=" + children + '}';
//	}
}
