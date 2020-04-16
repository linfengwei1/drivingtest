package com.great.entity;

public class StudentTable
{
    private int id;
    private String account;
    private String pwd;
    private String name;
    private String sex;
    private String age;
    private String idNumber;
    private String phone;
    private int student_state_id;
    private int school_id;
    private String verification;//验证码
    private School school;//学校
    private String schoolName;//学校名
    private String image;//图片路径
    private String audit_results;//审核结果
    private int identity_state;//是否录入人脸信息
    private int coach_id;;//教练id
    private int time;
    private int oneScore;
    private int twoScore;
    private int threeScore;
    private int fourScore;
    public StudentTable()
    {

    }

    public StudentTable(int id, String account, String pwd, String name, String sex, String age, String idNumber, String phone, int student_state_id, int school_id, String verification, School school, String schoolName, String image, String audit_results, int identity_state, int coach_id, int time, int oneScore, int twoScore, int threeScore, int fourScore) {
        this.id = id;
        this.account = account;
        this.pwd = pwd;
        this.name = name;
        this.sex = sex;
        this.age = age;
        this.idNumber = idNumber;
        this.phone = phone;
        this.student_state_id = student_state_id;
        this.school_id = school_id;
        this.verification = verification;
        this.school = school;
        this.schoolName = schoolName;
        this.image = image;
        this.audit_results = audit_results;
        this.identity_state = identity_state;
        this.coach_id = coach_id;
        this.time = time;
        this.oneScore = oneScore;
        this.twoScore = twoScore;
        this.threeScore = threeScore;
        this.fourScore = fourScore;
    }

    public int getCoach_id() {
        return coach_id;
    }

    public void setCoach_id(int coach_id) {
        this.coach_id = coach_id;
    }

    public int getId()
    {
        return id;
    }

    public void setId(int id)
    {
        this.id = id;
    }

    public String getAccount()
    {
        return account;
    }

    public void setAccount(String account)
    {
        this.account = account;
    }

    public String getPwd()
    {
        return pwd;
    }

    public void setPwd(String pwd)
    {
        this.pwd = pwd;
    }

    public String getName()
    {
        return name;
    }

    public void setName(String name)
    {
        this.name = name;
    }

    public String getSex()
    {
        return sex;
    }

    public void setSex(String sex)
    {
        this.sex = sex;
    }

    public String getAge()
    {
        return age;
    }

    public void setAge(String age)
    {
        this.age = age;
    }

    public String getIdNumber()
    {
        return idNumber;
    }

    public void setIdNumber(String idNumber)
    {
        this.idNumber = idNumber;
    }

    public String getPhone()
    {
        return phone;
    }

    public void setPhone(String phone)
    {
        this.phone = phone;
    }

    public int getStudent_state_id()
    {
        return student_state_id;
    }

    public void setStudent_state_id(int student_state_id)
    {
        this.student_state_id = student_state_id;
    }

    public int getSchool_id()
    {
        return school_id;
    }

    public void setSchool_id(int school_id)
    {
        this.school_id = school_id;
    }

    public String getVerification()
    {
        return verification;
    }

    public void setVerification(String verification)
    {
        this.verification = verification;
    }

    public School getSchool()
    {
        return school;
    }

    public void setSchool(School school)
    {
        this.school = school;
    }

    public String getSchoolName() {
        return schoolName;
    }

    public void setSchoolName(String schoolName) {
        this.schoolName = schoolName;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getAudit_results() {
        return audit_results;
    }

    public void setAudit_results(String audit_results) {
        this.audit_results = audit_results;
    }

    public int getIdentity_state()
    {
        return identity_state;
    }

    public void setIdentity_state(int identity_state)
    {
        this.identity_state = identity_state;
    }

    public int getTime() {
        return time;
    }

    public void setTime(int time) {
        this.time = time;
    }

    public int getOneScore() {
        return oneScore;
    }

    public void setOneScore(int oneScore) {
        this.oneScore = oneScore;
    }

    public int getTwoScore() {
        return twoScore;
    }

    public void setTwoScore(int twoScore) {
        this.twoScore = twoScore;
    }

    public int getThreeScore() {
        return threeScore;
    }

    public void setThreeScore(int threeScore) {
        this.threeScore = threeScore;
    }

    public int getFourScore() {
        return fourScore;
    }

    public void setFourScore(int fourScore) {
        this.fourScore = fourScore;
    }

    @Override
    public String toString() {
        return "StudentTable{" +
                "id=" + id +
                ", account='" + account + '\'' +
                ", pwd='" + pwd + '\'' +
                ", name='" + name + '\'' +
                ", sex='" + sex + '\'' +
                ", age='" + age + '\'' +
                ", idNumber='" + idNumber + '\'' +
                ", phone='" + phone + '\'' +
                ", student_state_id=" + student_state_id +
                ", school_id=" + school_id +
                ", verification='" + verification + '\'' +
                ", school=" + school +
                ", schoolName='" + schoolName + '\'' +
                ", image='" + image + '\'' +
                ", audit_results='" + audit_results + '\'' +
                ", identity_state=" + identity_state +
                ", coach_id=" + coach_id +
                ", time='" + time + '\'' +
                ", oneScore=" + oneScore +
                ", twoScore=" + twoScore +
                ", threeScore=" + threeScore +
                ", fourScore=" + fourScore +
                '}';
    }
}

