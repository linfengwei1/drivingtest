package com.great.entity;

import java.sql.Timestamp;

public class TableUtils {
    private String page;
    private Integer minLimit;
    private Integer maxLimit;
    private String time1;
    private String time2;
    private String idnumber;
    private String idNumber;
    private String sex;
    private String state;
    private String name;
    private String phone;
    private String carNumber;
    private Integer school_id;
    private Integer schoolStateId;
    private Timestamp time3;
    private Timestamp time4;
//    private String type;
//    private String content;
//    private String datetime;
    private Integer coach_id;

    public TableUtils() {
    }

    public Timestamp getTime3() {
        return time3;
    }

    public void setTime3(Timestamp time3) {
        this.time3 = time3;
    }

    public Timestamp getTime4() {
        return time4;
    }

    public void setTime4(Timestamp time4) {
        this.time4 = time4;
    }

    public Integer getSchool_id() {
        return school_id;
    }

    public void setSchool_id(Integer school_id) {
        this.school_id = school_id;
    }

    public String getIdNumber() {
        return idNumber;
    }

    public void setIdNumber(String idNumber) {
        this.idNumber = idNumber;
    }

    public String getPage() {
        return page;
    }

    public void setPage(String page) {
        this.page = page;
    }

    public Integer getSchoolStateId() {
        return schoolStateId;
    }

    public void setSchoolStateId(Integer schoolStateId) {
        this.schoolStateId = schoolStateId;
    }

    public String getTime1() {
        return time1;
    }

    public void setTime1(String time1) {
        this.time1 = time1;
    }

    public String getTime2() {
        return time2;
    }

    public void setTime2(String time2) {
        this.time2 = time2;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
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

    public Integer getMinLimit() {
        return minLimit;
    }

    public void setMinLimit(Integer minLimit) {
        this.minLimit = minLimit;
    }

    public Integer getMaxLimit() {
        return maxLimit;
    }

    public void setMaxLimit(Integer maxLimit) {
        this.maxLimit = maxLimit;
    }


    public String getIdnumber() {
        return idnumber;
    }

    public void setIdnumber(String idnumber) {
        this.idnumber = idnumber;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getCarNumber() {
        return carNumber;
    }

    public void setCarNumber(String carNumber) {
        this.carNumber = carNumber;
    }

    public Integer getCoach_id() {
        return coach_id;
    }

    public void setCoach_id(Integer coach_id) {
        this.coach_id = coach_id;
    }

    @Override
    public String toString() {
        return "Utils{" +
                "page='" + page + '\'' +
                ", minLimit=" + minLimit +
                ", maxLimit=" + maxLimit +
                ", time1='" + time1 + '\'' +
                ", time2='" + time2 + '\'' +
                ", state='" + state + '\'' +
                ", name='" + name + '\'' +
                ", phone='" + phone + '\'' +
                '}';
    }
}
