package com.great.dao;


import com.great.entity.Link;
import com.great.entity.School;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface LinkMapper {
    public void addLink(Link link);//增加链接
    public List<Link> findAllLink();//查询链接
    public void updateLink(Link link);//更新链接
    public void deleteLink(Link link);//删除连接
    public List<School> findAllSchool();//查询驾校
}
