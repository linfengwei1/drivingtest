package com.great.dao;

import com.great.entity.Notice;
import com.great.entity.Subject;
import com.great.entity.Transportation;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

/**
 * ClassName: TransportationDao <br/>
 * Description: <br/>
 * date: 2020/4/8 10:14<br/>
 *
 * @author lenovo<br />
 * @since JDK 1.8
 */
@Mapper
public interface TransportationDao {

    /**
     * 登录
     * @param map
     * @return
     */
    public Transportation login(Map<String, String> map);

    /**
     * 获取科目一题数
     * @param map
     * @return
     */
    public Integer getOneSubjectCount(Map<String, Object> map);

    /**
     * 获取科目一题表
     * @param map
     * @return
     */
    public List<?> getOneSubject(Map<String, Object> map);

    /**
     * 获取科目四题数
     * @param map
     * @return
     */
    public Integer getFourthSubjectCount(Map<String, Object> map);

    /**
     * 获取科目四题表
     * @param map
     * @return
     */
    public List<?> getFourthSubject(Map<String, Object> map);

    /**
     * 获取科目一题目信息
     * @param id
     * @return
     */
    public Subject getOneSubjectMsg(Integer id);

    /**
     * 获取科目四题目信息
     * @param id
     * @return
     */
    public Subject getFourthSubjectMsg(Integer id);

    /**
     * 删除科目一题目
     * @param id
     * @return
     */
    public Integer deleteOneSubjectMsg(Integer id);

    /**
     * 删除科目四题目
     * @param id
     * @return
     */
    public Integer deleteFourthSubjectMsg(Integer id);

    /**
     * 更新科目一题目
     * @param subject
     * @return
     */
    public Integer updateOneSubjectMsg(Subject subject);

    /**
     * 更新科目四题目
     * @param subject
     * @return
     */
    public Integer updateFourthSubjectMsg(Subject subject);

    /**
     * 获取学员信息条数
     * @param map
     * @return
     */
    public Integer getStudentCount(Map<String, Object> map);


    /**
     * 获取学员信息
     * @param map
     * @return
     */
    public List<?> getStudentTbl(Map<String, Object> map);


    /**
     * 获取公告数
     * @param map
     * @return
     */
    public Integer getNoticeCount(Map<String, Object> map);


    /**
     * 获取公告表
     * @param map
     * @return
     */
    public List<?> getNotice(Map<String, Object> map);

	/**
	 * 获取公告类型
	 * @return
	 */
	public List<?> getNoticeType();

    /**
     * 删除通告
     * @param id
     * @return
     */
    public Integer deleteNotice(Integer id);

    /**
     * 更新通告
     * @param notice
     * @return
     */
    public Integer updateNoticeMsg(Notice notice);


    /**
     * 获取通告信息
     * @param id
     * @return
     */
    public Notice getNoticeMsg(Integer id);

    /**
     * 新增公告数
     * @param notice
     * @return
     */
    public Integer insertNotice(Notice notice);

}
