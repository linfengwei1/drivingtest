package com.great.entity;

public class TableUtils {
    private String page;
    private Integer minLimit;
    private Integer maxLimit;
    private String time1;
    private String time2;
    private String state;
    private String name;
    private String phone;
    private Integer schoolStateId;


    public TableUtils() {
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
