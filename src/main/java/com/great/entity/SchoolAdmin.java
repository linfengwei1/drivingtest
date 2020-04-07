package com.great.entity;

public class SchoolAdmin {
    private Integer id;
    private String account;
    private String pwd;
    private String name;
    private String phone;
    private Integer school_id;

    public SchoolAdmin() {
    }

    public SchoolAdmin(Integer id, String account, String pwd, String name, String phone, Integer school_id) {
        this.id = id;
        this.account = account;
        this.pwd = pwd;
        this.name = name;
        this.phone = phone;
        this.school_id = school_id;
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


    @Override
    public String toString() {
        return "SchoolAdmin{" +
                "id=" + id +
                ", account='" + account + '\'' +
                ", pwd='" + pwd + '\'' +
                ", name='" + name + '\'' +
                ", phone='" + phone + '\'' +
                ", school_id=" + school_id +
                '}';
    }
}
