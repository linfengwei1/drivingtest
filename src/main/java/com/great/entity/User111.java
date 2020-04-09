package com.great.entity;

public class User111
{

    private int uid;
    private String uname;
    private String pwd;
    private String sex;
    private String degree;
    private String occupation;
    private String email;
    private String phonenum;
    private int score;
    private int roleid;

    public User111()
    {
    }

    public User111(int uid, String uname, String pwd, String sex, String degree, String occupation, String email, String phonenum, int score, int roleid)
    {
        this.uid = uid;
        this.uname = uname;
        this.pwd = pwd;
        this.sex = sex;
        this.degree = degree;
        this.occupation = occupation;
        this.email = email;
        this.phonenum = phonenum;
        this.score = score;
        this.roleid = roleid;
    }

    public int getUid()
    {
        return uid;
    }

    public void setUid(int uid)
    {
        this.uid = uid;
    }

    public String getUname()
    {
        return uname;
    }

    public void setUname(String uname)
    {
        this.uname = uname;
    }

    public String getPwd()
    {
        return pwd;
    }

    public void setPwd(String pwd)
    {
        this.pwd = pwd;
    }

    public String getSex()
    {
        return sex;
    }

    public void setSex(String sex)
    {
        this.sex = sex;
    }

    public String getDegree()
    {
        return degree;
    }

    public void setDegree(String degree)
    {
        this.degree = degree;
    }

    public String getOccupation()
    {
        return occupation;
    }

    public void setOccupation(String occupation)
    {
        this.occupation = occupation;
    }

    public String getEmail()
    {
        return email;
    }

    public void setEmail(String email)
    {
        this.email = email;
    }

    public String getPhonenum()
    {
        return phonenum;
    }

    public void setPhonenum(String phonenum)
    {
        this.phonenum = phonenum;
    }

    public int getScore()
    {
        return score;
    }

    public void setScore(int score)
    {
        this.score = score;
    }

    public int getRoleid()
    {
        return roleid;
    }

    public void setRoleid(int roleid)
    {
        this.roleid = roleid;
    }


    @Override
    public String toString()
    {
        return "User{" + "uid=" + uid + ", uname='" + uname + '\'' + ", pwd='" + pwd + '\'' + ", sex='" + sex + '\'' + ", degree='" + degree + '\'' + ", occupation='" + occupation + '\'' + ", email='" + email + '\'' + ", phonenum='" + phonenum + '\'' + ", score=" + score + ", roleid=" + roleid + '}';
    }
}