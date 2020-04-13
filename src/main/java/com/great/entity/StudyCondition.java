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

    public StudyCondition() {
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
