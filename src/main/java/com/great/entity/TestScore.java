package com.great.entity;

public class TestScore
{
	private Integer TestId;
	private Integer studentId;
	private Integer subjectId;
	private Integer score;

	public TestScore()
	{

	}

	public TestScore(Integer testId, Integer studentId, Integer subjectId, Integer score)
	{
		TestId = testId;
		this.studentId = studentId;
		this.subjectId = subjectId;
		this.score = score;
	}


	public Integer getTestId()
	{
		return TestId;
	}

	public void setTestId(Integer testId)
	{
		TestId = testId;
	}

	public Integer getStudentId()
	{
		return studentId;
	}

	public void setStudentId(Integer studentId)
	{
		this.studentId = studentId;
	}

	public Integer getSubjectId()
	{
		return subjectId;
	}

	public void setSubjectId(Integer subjectId)
	{
		this.subjectId = subjectId;
	}

	public Integer getScore()
	{
		return score;
	}

	public void setScore(Integer score)
	{
		this.score = score;
	}

	@Override
	public String toString()
	{
		return "TestScore{" + "TestId=" + TestId + ", studentId=" + studentId + ", subjectId=" + subjectId + ", score=" + score + '}';
	}
}
