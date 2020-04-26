package com.great.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import org.springframework.format.annotation.DateTimeFormat;

import javax.xml.crypto.Data;
import java.sql.Timestamp;
import java.util.Date;

/**
 * 驾校管理员表
 */
public class SchoolAdmin {
    private Integer id;
    private String account;
    private String pwd;
    private String name;
    private String phone;
    private Integer school_id;
    @JsonFormat(timezone = "GMT+8", pattern = "yyyy-MM-dd HH:mm")
    @DateTimeFormat(pattern ="yyyy-MM-dd")
    private Date time;
    private Integer school_state_id;
//    private SchoolState schoolState;
    private String verification;//验证码
    private String phoneMsg;//短信验证码



    public SchoolAdmin() {
    }

    public SchoolAdmin(String account, String pwd, String name, String phone, Integer school_id, Date time, Integer school_state_id) {
        this.account = account;
        this.pwd = pwd;
        this.name = name;
        this.phone = phone;
        this.school_id = school_id;
        this.time = time;
        this.school_state_id = school_state_id;
    }

    public String getPhoneMsg() {
        return phoneMsg;
    }

    public void setPhoneMsg(String phoneMsg) {
        this.phoneMsg = phoneMsg;
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

//    public SchoolState getSchoolState() {
//        return schoolState;
//    }
//
//    public void setSchoolState(SchoolState schoolState) {
//        this.schoolState = schoolState;
//    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
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
                ", verification='" + verification + '\'' +
                ", phoneMsg='" + phoneMsg + '\'' +
                '}';
    }
}
