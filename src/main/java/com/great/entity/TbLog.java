package com.great.entity;

import java.sql.Timestamp;

/**
 * 日志表
 */
public class TbLog {
    private  Integer id;
    private String name;
    private String type;//类型
    private String content;//内容
    private Timestamp datetime;
    private String ip;//内容
    private Integer school_id;//内容

    public TbLog() {
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Timestamp getDatetime() {
        return datetime;
    }

    public void setDatetime(Timestamp datetime) {
        this.datetime = datetime;
    }

    public String getIp() {
        return ip;
    }

    public void setIp(String ip) {
        this.ip = ip;
    }

    public Integer getSchool_id() {
        return school_id;
    }

    public void setSchool_id(Integer school_id) {
        this.school_id = school_id;
    }

    @Override
    public String toString() {
        return "TbLog{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", type='" + type + '\'' +
                ", content='" + content + '\'' +
                ", datetime=" + datetime +
                ", ip='" + ip + '\'' +
                ", school_id=" + school_id +
                '}';
    }
}
