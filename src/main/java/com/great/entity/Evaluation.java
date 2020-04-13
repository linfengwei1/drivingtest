package com.great.entity;

import java.util.Date;

/**
 * 评价表
 */
public class Evaluation {
    private Integer id;
    private Integer coach_id;
    private String content;
    private Date time;
    private Integer school_id;

    public Evaluation() {
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getCoach_id() {
        return coach_id;
    }

    public void setCoach_id(Integer coach_id) {
        this.coach_id = coach_id;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    public Integer getSchool_id() {
        return school_id;
    }

    public void setSchool_id(Integer school_id) {
        this.school_id = school_id;
    }

    @Override
    public String toString() {
        return "Evaluation{" +
                "id=" + id +
                ", coach_id=" + coach_id +
                ", content='" + content + '\'' +
                ", time=" + time +
                ", school_id=" + school_id +
                '}';
    }
}
