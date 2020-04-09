package com.great.entity;

/**
 * 教练表
 */
public class Coach {
    private Integer id;
    private String account;
    private String pwd;
    private String name;
    private String sex;
    private String age;
    private String idnumber;
    private String phone;
    private int coach_state_id;
    private int school_id;
    private String verification;//验证码

    public Coach() {
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

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getAge() {
        return age;
    }

    public void setAge(String age) {
        this.age = age;
    }

    public String getIdnumber() {
        return idnumber;
    }

    public void setIdnumber(String idnumber) {
        this.idnumber = idnumber;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public int getCoach_state_id() {
        return coach_state_id;
    }

    public void setCoach_state_id(int coach_state_id) {
        this.coach_state_id = coach_state_id;
    }

    public int getSchool_id() {
        return school_id;
    }

    public void setSchool_id(int school_id) {
        this.school_id = school_id;
    }

    public String getVerification() {
        return verification;
    }

    public void setVerification(String verification) {
        this.verification = verification;
    }

    @Override
    public String toString() {
        return "Coach{" +
                "id=" + id +
                ", account='" + account + '\'' +
                ", pwd='" + pwd + '\'' +
                ", name='" + name + '\'' +
                ", sex='" + sex + '\'' +
                ", age='" + age + '\'' +
                ", idnumber='" + idnumber + '\'' +
                ", phone='" + phone + '\'' +
                ", coach_state_id=" + coach_state_id +
                ", school_id=" + school_id +
                '}';
    }
}
