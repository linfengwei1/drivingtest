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
    private String name;//教练名字
    private Coach coach;
    private Integer school_id;
    private Integer coach_state_id; //状态
    private String result;//处罚结果
    private String school_name;//驾校名
    private String account;

    public Punish() {
    }

    public String getAccount() {
        return account;
    }

    public void setAccount(String account) {
        this.account = account;
    }

    public Integer getCoach_state_id() {
        return coach_state_id;
    }

    public void setCoach_state_id(Integer coach_state_id) {
        this.coach_state_id = coach_state_id;
    }

    public Coach getCoach() {
        return coach;
    }

    public void setCoach(Coach coach) {
        this.coach = coach;
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

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
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

    public String getResult() {
        return result;
    }

    public void setResult(String result) {
        this.result = result;
    }

    public String getSchool_name() {
        return school_name;
    }

    public void setSchool_name(String school_name) {
        this.school_name = school_name;
    }

    @Override
    public String toString() {
        return "Punish{" +
                "id=" + id +
                ", content='" + content + '\'' +
                ", datetime=" + datetime +
                ", coach_id=" + coach_id +
                ", name='" + name + '\'' +
                ", coach=" + coach +
                ", school_id=" + school_id +
                ", coach_state_id=" + coach_state_id +
                ", result='" + result + '\'' +
                ", school_name='" + school_name + '\'' +
                '}';
    }
}
