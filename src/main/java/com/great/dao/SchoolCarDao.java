package com.great.dao;


import com.great.entity.Coach;
import com.great.entity.CoachCar;
import com.great.entity.TableUtils;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface SchoolCarDao
{

	//查询车辆记录并分页
	public List<CoachCar> getCar(TableUtils u);

	//查找车辆总数
	public Integer findCount(TableUtils u);

	//删除教练车
	public Integer deleteCar(Integer id);

	//车辆人员变更
	public Integer updateCar(CoachCar coachCar);

	//查看车牌号是否被注册
	public Integer CheckCarNumber(String account);

	//添加车辆
	public Integer addCar(CoachCar coachCar);

    //查询驾校的所有教练
    public List<Coach> findCoach(Integer cid);

    //excel插入数据库
    public Integer insertCarByExcel(List<CoachCar> list);

	//单独插入图片
	public Integer AddCarImage(Map map);

	//插入图片改变状态
	public Integer ChangeCarState(Map map);

}
