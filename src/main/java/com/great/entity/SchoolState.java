package com.great.entity;

/**
 * 驾校状态表
 */
public class SchoolState {

    private Integer id;
    private String statename;

    public SchoolState() {
    }

    public SchoolState(Integer id, String statename) {
        this.id = id;
        this.statename = statename;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getStatename() {
        return statename;
    }

    public void setStatename(String statename) {
        this.statename = statename;
    }

    @Override
    public String toString() {
        return "SchoolState{" +
                "id=" + id +
                ", statename='" + statename + '\'' +
                '}';
    }
}
