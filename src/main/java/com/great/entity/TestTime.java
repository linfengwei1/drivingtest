package com.great.entity;


import java.sql.Timestamp;

/**
 * ClassName: TestTime <br/>
 * Description: <br/>
 * date: 2020/4/15 11:48<br/>
 *
 * @author lenovo<br />
 * @since JDK 1.8
 */
public class TestTime {

    private Integer id;
    private String start_time;
    private String end_time;
    private Integer school_id;
    private String school_name;
    private String color;

    public TestTime() {
    }

    public TestTime(Integer id, String start_time, String end_time, Integer school_id, String school_name, String color) {
        this.id = id;
        this.start_time = start_time;
        this.end_time = end_time;
        this.school_id = school_id;
        this.school_name = school_name;
        this.color = color;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getStart_time() {
        return start_time;
    }

    public void setStart_time(String start_time) {
        this.start_time = start_time;
    }

    public String getEnd_time() {
        return end_time;
    }

    public void setEnd_time(String end_time) {
        this.end_time = end_time;
    }

    public Integer getSchool_id() {
        return school_id;
    }

    public void setSchool_id(Integer school_id) {
        this.school_id = school_id;
    }

    public String getSchool_name() {
        return school_name;
    }

    public void setSchool_name(String school_name) {
        this.school_name = school_name;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    @Override
    public String toString() {
        return "TestTime{" +
                "id=" + id +
                ", start_time='" + start_time + '\'' +
                ", end_time='" + end_time + '\'' +
                ", school_id=" + school_id +
                ", school_name='" + school_name + '\'' +
                ", color='" + color + '\'' +
                '}';
    }
}
