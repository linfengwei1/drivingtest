package com.great.entity;

import java.sql.Timestamp;

/**
 * 违规表
 */
public class Punish {
    private Integer id;
    private String content;
    private Timestamp datetime;
    private Integer coach_id;
    private String coachName;
    private Integer school_id;

    public Punish() {
    }


    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getCoachName() {
        return coachName;
    }

    public void setCoachName(String coachName) {
        this.coachName = coachName;
    }

    public Timestamp getDatetime() {
        return datetime;
    }

    public void setDatetime(Timestamp datetime) {
        this.datetime = datetime;
    }

    public Integer getCoach_id() {
        return coach_id;
    }

    public void setCoach_id(Integer coach_id) {
        this.coach_id = coach_id;
    }

    public Integer getSchool_id() {
        return school_id;
    }

    public void setSchool_id(Integer school_id) {
        this.school_id = school_id;
    }

    @Override
    public String toString() {
        return "Punish{" +
                "id=" + id +
                ", content='" + content + '\'' +
                ", datetime=" + datetime +
                ", coach_id=" + coach_id +
                ", coachName='" + coachName + '\'' +
                ", school_id=" + school_id +
                '}';
    }
}
