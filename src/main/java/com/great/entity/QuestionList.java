package com.great.entity;

import java.util.List;

public class QuestionList
{
	private List<Question> choice;//选择题
	private List<Question> judge;//判断题

	public QuestionList()
	{
	}

	public QuestionList(List<Question> choice, List<Question> judge)
	{
		this.choice = choice;
		this.judge = judge;
	}

	public List<Question> getChoice()
	{
		return choice;
	}

	public void setChoice(List<Question> choice)
	{
		this.choice = choice;
	}

	public List<Question> getJudge()
	{
		return judge;
	}

	public void setJudge(List<Question> judge)
	{
		this.judge = judge;
	}

	@Override
	public String toString()
	{
		return "QuestionList{" + "choice=" + choice + ", judge=" + judge + '}';
	}
}
