package com.great.dao;


import com.great.entity.Link;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface LinkMapper {
    public void addLink(Link link);//增加链接
    public List<Link> findAllLink();//查询链接
    public void updateLink(Link link);//更新链接
    public void deleteLink(Link link);//删除连接
}
