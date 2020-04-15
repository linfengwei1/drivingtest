package com.great.entity;

import org.springframework.stereotype.Component;

/**
 * 学习条件表
 */
@Component
public class StudyCondition {
    private Integer id;
    private Integer subject_id;
    private Integer time;
    private Integer score;
    private Integer student_id;
    private int practise_score;//模拟考试成绩(科目一、科目四)

    public StudyCondition() {
    }

    public StudyCondition(Integer id, Integer subject_id, Integer time, Integer score, Integer student_id, int practise_score)
    {
        this.id = id;
        this.subject_id = subject_id;
        this.time = time;
        this.score = score;
        this.student_id = student_id;
        this.practise_score = practise_score;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getSubject_id() {
        return subject_id;
    }

    public void setSubject_id(Integer subject_id) {
        this.subject_id = subject_id;
    }

    public Integer getTime() {
        return time;
    }

    public void setTime(Integer time) {
        this.time = time;
    }

    public Integer getScore() {
        return score;
    }

    public void setScore(Integer score) {
        this.score = score;
    }

    public Integer getStudent_id() {
        return student_id;
    }

    public void setStudent_id(Integer student_id) {
        this.student_id = student_id;
    }

    public int getPractise_score()
    {
        return practise_score;
    }

    public void setPractise_score(int practise_score)
    {
        this.practise_score = practise_score;
    }

    @Override
    public String toString() {
        return "StudyCondition{" +
                "id=" + id +
                ", subject_id=" + subject_id +
                ", time=" + time +
                ", score=" + score +
                ", student_id=" + student_id +
                '}';
    }
}
