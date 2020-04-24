package com.great.entity;

import java.io.Serializable;
import java.util.List;

public class SchoolInfoPage implements Serializable
{
	private Integer schoolId;
	private String schoolName;
	private String addr;
	private List<Coach> coaches;
	private List<Student> students;
	private List<CoachCar> coachCars;

	public SchoolInfoPage()
	{
	}

	public SchoolInfoPage(Integer schoolId, String schoolName, String addr, List<Coach> coaches, List<Student> students, List<CoachCar> coachCars)
	{
		this.schoolId = schoolId;
		this.schoolName = schoolName;
		this.addr = addr;
		this.coaches = coaches;
		this.students = students;
		this.coachCars = coachCars;
	}


	public Integer getSchoolId()
	{
		return schoolId;
	}

	public void setSchoolId(Integer schoolId)
	{
		this.schoolId = schoolId;
	}

	public String getSchoolName()
	{
		return schoolName;
	}

	public void setSchoolName(String schoolName)
	{
		this.schoolName = schoolName;
	}

	public String getAddr()
	{
		return addr;
	}

	public void setAddr(String addr)
	{
		this.addr = addr;
	}

	public List<Coach> getCoaches()
	{
		return coaches;
	}

	public void setCoaches(List<Coach> coaches)
	{
		this.coaches = coaches;
	}

	public List<Student> getStudents()
	{
		return students;
	}

	public void setStudents(List<Student> students)
	{
		this.students = students;
	}

	public List<CoachCar> getCoachCars()
	{
		return coachCars;
	}

	public void setCoachCars(List<CoachCar> coachCars)
	{
		this.coachCars = coachCars;
	}


	@Override
	public String toString()
	{
		return "SchoolInfoPage{" + "schoolId=" + schoolId + ", schoolName='" + schoolName + '\'' + ", addr='" + addr + '\'' + ", coaches=" + coaches + ", students=" + students + ", coachCars=" + coachCars + '}';
	}
}
