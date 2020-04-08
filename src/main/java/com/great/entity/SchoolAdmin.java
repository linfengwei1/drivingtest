package com.great.entity;

import java.sql.Timestamp;


public class SchoolAdmin {
    private Integer id;
    private String account;
    private String pwd;
    private String name;
    private String phone;
    private Integer school_id;
    private Timestamp time;
    private Integer school_state_id;
    private SchoolState schoolState;
    private String verification;//验证码


    public SchoolAdmin() {
    }

    public SchoolAdmin(Integer id, String account, String pwd, String name, String phone, Integer school_id, Integer school_state_id, SchoolState schoolState) {
        this.id = id;
        this.account = account;
        this.pwd = pwd;
        this.name = name;
        this.phone = phone;
        this.school_id = school_id;
        this.school_state_id = school_state_id;
        this.schoolState = schoolState;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getAccount() {
        return account;
    }

    public void setAccount(String account) {
        this.account = account;
    }

    public String getPwd() {
        return pwd;
    }

    public void setPwd(String pwd) {
        this.pwd = pwd;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public Integer getSchool_id() {
        return school_id;
    }

    public void setSchool_id(Integer school_id) {
        this.school_id = school_id;
    }

    public String getVerification() {
        return verification;
    }

    public void setVerification(String verification) {
        this.verification = verification;
    }

    public Integer getSchool_state_id() {
        return school_state_id;
    }

    public void setSchool_state_id(Integer school_state_id) {
        this.school_state_id = school_state_id;
    }

    public SchoolState getSchoolState() {
        return schoolState;
    }

    public void setSchoolState(SchoolState schoolState) {
        this.schoolState = schoolState;
    }

    public Timestamp getTime() {
        return time;
    }

    public void setTime(Timestamp time) {
        this.time = time;
    }

    @Override
    public String toString() {
        return "SchoolAdmin{" +
                "id=" + id +
                ", account='" + account + '\'' +
                ", pwd='" + pwd + '\'' +
                ", name='" + name + '\'' +
                ", phone='" + phone + '\'' +
                ", school_id=" + school_id +
                ", time=" + time +
                ", school_state_id=" + school_state_id +
                ", schoolState=" + schoolState +
                '}';
    }
}
