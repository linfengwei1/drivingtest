package com.great.entity;

/**
 * ClassName: Transportation  <br/>
 * Description: <br/>
 * date: 2020/4/8 10:31<br/>
 *
 * @author lenovo<br />
 * @since JDK 1.8
 */

public class Transportation {

    private Integer id;
    private String account;
    private String pwd;
    private String name;
    private String phone;


    public Transportation() {
    }

    public Transportation(Integer id, String account, String pwd, String name, String phone) {
        this.id = id;
        this.account = account;
        this.pwd = pwd;
        this.name = name;
        this.phone = phone;
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

    @Override
    public String toString() {
        return "Transportation{" +
                "id=" + id +
                ", account='" + account + '\'' +
                ", pwd='" + pwd + '\'' +
                ", name='" + name + '\'' +
                ", phone='" + phone + '\'' +
                '}';
    }
}
