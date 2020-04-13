package com.great.service;

import com.alibaba.druid.util.StringUtils;
import com.great.entity.Notice;
import com.great.entity.ObjectResult;
import com.great.entity.Transportation;
import com.great.entity.Subject;

import java.util.Date;
import java.util.List;


/**
 * ClassName: TransportationService <br/>
 * Description: <br/>
 * date: 2020/4/8 10:35<br/>
 *
 * @author lenovo<br />
 * @since JDK 1.8
 */
public interface TransportationService {

    /**
     * 验证运管登陆
     * @param account
     * @param pwd
     * @return
     */
    public Transportation login(String account, String pwd);

    /**
     * 获取科目一题表
     * @param page
     * @param limit
     * @return
     */
    public ObjectResult getOneSubject(Integer page, Integer limit, String question, String type);

    /**
     * 获取科目四题表
     * @param page
     * @param limit
     * @return
     */
    public ObjectResult getFourthSubject(Integer page, Integer limit, String question, String type);

    /**
     * 获取科目一题目信息
     * @param subject
     * @return
     */
    public Subject getOneSubjectMsg(Subject subject);

    /**
     * 获取科目四题目信息
     * @param subject
     * @return
     */
    public Subject getFourthSubjectMsg(Subject subject);

    /**
     * 删除科目一题目
     * @param subject
     * @return
     */
    public Integer deleteOneSubjectMsg(Subject subject);

    /**
     * 删除科目四题目
     * @param subject
     * @return
     */
    public Integer deleteFourthSubjectMsg(Subject subject);

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
     * 获取学员列表
     * @return
     */
    public ObjectResult getStudentTbl(Integer page, Integer limit ,String state,String name);


    /**
     * 获取公告表
     * @param page
     * @param limit
     * @return
     */
    public ObjectResult getNotice(Integer page, Integer limit, String title , String date, String type);

	/**
	 * 获取公告类型
	 * @return
	 */
	public List<?> getNoticeType();

    /**
     * 删除通告
     * @param notice
     * @return
     */
    public Integer deleteNotice(Notice notice);

    /**
     * 更新通告
     * @param notice
     * @return
     */
    public Integer updateNoticeMsg(Notice notice);

	/**
	 * 获取通告信息
	 * @param notice
	 * @return
	 */
	public Notice getNoticeMsg(Notice notice);

	/**
	 * 新增公告数
	 * @param notice
	 * @return
	 */
	public Integer insertNotice(Notice notice);

}
