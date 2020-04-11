package com.great.entity;

public class Question
{
	private int id;
	private String question;
	private String answer;
	private String item1;
	private String item2;
	private String item3;
	private String item4;
	private String explains;
	private String url;
	private int type;

	public Question()
	{
	}

	public Question(int id, String question, String answer, String item1, String item2, String item3, String item4, String explains, String url, int type)
	{
		this.id = id;
		this.question = question;
		this.answer = answer;
		this.item1 = item1;
		this.item2 = item2;
		this.item3 = item3;
		this.item4 = item4;
		this.explains = explains;
		this.url = url;
		this.type = type;
	}

	public int getId()
	{
		return id;
	}

	public void setId(int id)
	{
		this.id = id;
	}

	public String getQuestion()
	{
		return question;
	}

	public void setQuestion(String question)
	{
		this.question = question;
	}

	public String getAnswer()
	{
		return answer;
	}

	public void setAnswer(String answer)
	{
		this.answer = answer;
	}

	public String getItem1()
	{
		return item1;
	}

	public void setItem1(String item1)
	{
		this.item1 = item1;
	}

	public String getItem2()
	{
		return item2;
	}

	public void setItem2(String item2)
	{
		this.item2 = item2;
	}

	public String getItem3()
	{
		return item3;
	}

	public void setItem3(String item3)
	{
		this.item3 = item3;
	}

	public String getItem4()
	{
		return item4;
	}

	public void setItem4(String item4)
	{
		this.item4 = item4;
	}

	public String getExplains()
	{
		return explains;
	}

	public void setExplains(String explains)
	{
		this.explains = explains;
	}

	public String getUrl()
	{
		return url;
	}

	public void setUrl(String url)
	{
		this.url = url;
	}

	public int getType()
	{
		return type;
	}

	public void setType(int type)
	{
		this.type = type;
	}

	@Override
	public String toString()
	{
		return "Question{" + "id=" + id + ", question='" + question + '\'' + ", answer='" + answer + '\'' + ", item1='" + item1 + '\'' + ", item2='" + item2 + '\'' + ", item3='" + item3 + '\'' + ", item4='" + item4 + '\'' + ", explains='" + explains + '\'' + ", url='" + url + '\'' + ", type=" + type + '}';
	}
}
