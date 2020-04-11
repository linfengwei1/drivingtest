package com.great.dao;


import com.great.entity.Link;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface LinkMapper {
    public void addLinkUrl(Link link);
    public List<Link> findAllLink();

}
