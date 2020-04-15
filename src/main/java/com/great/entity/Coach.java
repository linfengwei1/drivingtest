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
    private String image;
    private String verification;//验证码
    private String schoolName;//驾校名
    private String audit_results;//审核结果

    public Coach() {
    }

    public Coach(Integer id, String account, String pwd, String name, String sex, String age, String idnumber, String phone, int coach_state_id, int school_id, String verification, String schoolName, String audit_results) {
        this.id = id;
        this.account = account;
        this.pwd = pwd;
        this.name = name;
        this.sex = sex;
        this.age = age;
        this.idnumber = idnumber;
        this.phone = phone;
        this.coach_state_id = coach_state_id;
        this.school_id = school_id;
        this.verification = verification;
        this.schoolName = schoolName;
        this.audit_results = audit_results;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
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

    public String getSchoolName() {
        return schoolName;
    }

    public void setSchoolName(String schoolName) {
        this.schoolName = schoolName;
    }

    public String getAudit_results() {
        return audit_results;
    }

    public void setAudit_results(String audit_results) {
        this.audit_results = audit_results;
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
                ", verification='" + verification + '\'' +
                ", schoolName='" + schoolName + '\'' +
                ", audit_results='" + audit_results + '\'' +
                '}';
    }
}
