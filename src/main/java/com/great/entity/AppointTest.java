package com.great.entity;

/**
 * ClassName: AppointTest <br/>
 * Description: <br/>
 * date: 2020/4/17 21:56<br/>
 *
 * @author lenovo<br />
 * @since JDK 1.8
 */
public class AppointTest {
    private Integer id;
    private Integer timeId;
    private Integer studentId;
    private Integer subjectId;
    private Integer appointStateId;
    private String studentName;//姓名
    private String studentSex;//性别
    private String studentAge;//年龄
    private String studentPhone;//联系电话
    private String subjectName;//预约科目
    private String dateTime;//预约考试时间
    private String schoolName;//所属驾校

    public AppointTest() {
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getTimeId() {
        return timeId;
    }

    public void setTimeId(Integer timeId) {
        this.timeId = timeId;
    }

    public Integer getStudentId() {
        return studentId;
    }

    public void setStudentId(Integer studentId) {
        this.studentId = studentId;
    }

    public Integer getSubjectId() {
        return subjectId;
    }

    public void setSubjectId(Integer subjectId) {
        this.subjectId = subjectId;
    }

    public Integer getAppointStateId() {
        return appointStateId;
    }

    public void setAppointStateId(Integer appointStateId) {
        this.appointStateId = appointStateId;
    }

    public String getStudentName() {
        return studentName;
    }

    public void setStudentName(String studentName) {
        this.studentName = studentName;
    }

    public String getStudentSex() {
        return studentSex;
    }

    public void setStudentSex(String studentSex) {
        this.studentSex = studentSex;
    }

    public String getStudentAge() {
        return studentAge;
    }

    public void setStudentAge(String studentAge) {
        this.studentAge = studentAge;
    }

    public String getStudentPhone() {
        return studentPhone;
    }

    public void setStudentPhone(String studentPhone) {
        this.studentPhone = studentPhone;
    }

    public String getSubjectName() {
        return subjectName;
    }

    public void setSubjectName(String subjectName) {
        this.subjectName = subjectName;
    }

    public String getDateTime() {
        return dateTime;
    }

    public void setDateTime(String dateTime) {
        this.dateTime = dateTime;
    }

    public String getSchoolName() {
        return schoolName;
    }

    public void setSchoolName(String schoolName) {
        this.schoolName = schoolName;
    }

    @Override
    public String toString() {
        return "AppointTest{" +
                "id=" + id +
                ", timeId=" + timeId +
                ", studentId=" + studentId +
                ", subjectId=" + subjectId +
                ", appointStateId=" + appointStateId +
                ", studentName='" + studentName + '\'' +
                ", studentSex='" + studentSex + '\'' +
                ", studentAge='" + studentAge + '\'' +
                ", studentPhone='" + studentPhone + '\'' +
                ", subjectName='" + subjectName + '\'' +
                ", dateTime='" + dateTime + '\'' +
                ", schoolName='" + schoolName + '\'' +
                '}';
    }
}
