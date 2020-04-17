package com.great.entity;

/**
 * ClassName: School <br/>
 * Description: <br/>
 * date: 2020/4/9 15:28<br/>
 *
 * @author lenovo<br />
 * @since JDK 1.8
 */
public class School {
    private Integer id;
    private String name;
    private String phone;
    private String address;
    private String admin;
    private String intro;
    private Integer school_state_id;
    private String information;
    private String audit_results;//审核结果
    private String content;//问题
    private String result;//处理结果
    private String dateTime;//处理时间


    public School() {

    }

    public School(Integer id, String name, String phone, String address, String admin, String intro, Integer school_state_id, String information, String audit_results, String content, String result, String dateTime) {
        this.id = id;
        this.name = name;
        this.phone = phone;
        this.address = address;
        this.admin = admin;
        this.intro = intro;
        this.school_state_id = school_state_id;
        this.information = information;
        this.audit_results = audit_results;
        this.content = content;
        this.result = result;
        this.dateTime = dateTime;
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

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getAdmin() {
        return admin;
    }

    public void setAdmin(String admin) {
        this.admin = admin;
    }

    public String getIntro() {
        return intro;
    }

    public void setIntro(String intro) {
        this.intro = intro;
    }

    public Integer getSchool_state_id() {
        return school_state_id;
    }

    public void setSchool_state_id(Integer school_state_id) {
        this.school_state_id = school_state_id;
    }

    public String getInformation() {
        return information;
    }

    public void setInformation(String information) {
        this.information = information;
    }

    public String getAudit_results() {
        return audit_results;
    }

    public void setAudit_results(String audit_results) {
        this.audit_results = audit_results;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getResult() {
        return result;
    }

    public void setResult(String result) {
        this.result = result;
    }

    public String getDateTime() {
        return dateTime;
    }

    public void setDateTime(String dateTime) {
        this.dateTime = dateTime;
    }

    @Override
    public String toString() {
        return "School{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", phone='" + phone + '\'' +
                ", address='" + address + '\'' +
                ", admin='" + admin + '\'' +
                ", intro='" + intro + '\'' +
                ", school_state_id=" + school_state_id +
                ", information='" + information + '\'' +
                ", audit_results='" + audit_results + '\'' +
                ", content='" + content + '\'' +
                ", result='" + result + '\'' +
                ", dateTime='" + dateTime + '\'' +
                '}';
    }
}
