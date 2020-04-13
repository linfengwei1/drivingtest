package com.great.entity;

/**
 * 教练车
 */
public class CoachCar {
    private Integer id;
    private String  picture;//图片路径
    private String  carNumber;
    private String carState;
    private Integer school_id;
    private Integer coach_id;
    private String coachName;
    private String idNumber;
    private Coach coach;

    public CoachCar() {
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getPicture() {
        return picture;
    }

    public void setPicture(String picture) {
        this.picture = picture;
    }

    public String getCarNumber() {
        return carNumber;
    }

    public void setCarNumber(String carNumber) {
        this.carNumber = carNumber;
    }

    public Integer getSchool_id() {
        return school_id;
    }

    public void setSchool_id(Integer school_id) {
        this.school_id = school_id;
    }

    public Integer getCoach_id() {
        return coach_id;
    }

    public void setCoach_id(Integer coach_id) {
        this.coach_id = coach_id;
    }

    public String getCoachName() {
        return coachName;
    }

    public void setCoachName(String coachName) {
        this.coachName = coachName;
    }

    public String getCarState() {
        return carState;
    }

    public void setCarState(String carState) {
        this.carState = carState;
    }

    public String getIdNumber() {
        return idNumber;
    }

    public void setIdNumber(String idNumber) {
        this.idNumber = idNumber;
    }

    public Coach getCoach() {
        return coach;
    }

    public void setCoach(Coach coach) {
        this.coach = coach;
    }

    @Override
    public String toString() {
        return "CoachCar{" +
                "id=" + id +
                ", picture='" + picture + '\'' +
                ", carNumber='" + carNumber + '\'' +
                ", carState='" + carState + '\'' +
                ", school_id=" + school_id +
                ", coach_id=" + coach_id +
                ", coachName='" + coachName + '\'' +
                ", idNumber='" + idNumber + '\'' +
                ", coach=" + coach +
                '}';
    }
}
