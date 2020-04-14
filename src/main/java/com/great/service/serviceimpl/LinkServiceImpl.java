package com.great.service.serviceimpl;

import com.great.dao.LinkMapper;
import com.great.entity.Link;
import com.great.entity.LinkUtils;

import com.great.service.LinkService;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class LinkServiceImpl implements LinkService {

    @Autowired//自动装配、自动注入：注入sqlSessionTemplate
    private SqlSessionTemplate sqlSessionTemplate;

//    @Autowired
    private LinkMapper linkMapper;

    public void addLink(Link link){
         linkMapper = sqlSessionTemplate.getMapper(LinkMapper.class);//获得代理对象
         linkMapper.addLink(link);
    }
    public List<Link> findAllLink() {
        linkMapper = sqlSessionTemplate.getMapper(LinkMapper.class);//获得代理对象
        return linkMapper.findAllLink();
    }

//    @Override
    public void updateLink(Link link) {
        linkMapper = sqlSessionTemplate.getMapper(LinkMapper.class);
        linkMapper.updateLink(link);
    }
//    @Override
    public void deleteLink(Link link){
        linkMapper = sqlSessionTemplate.getMapper(LinkMapper.class);
        linkMapper.deleteLink(link);
    }
}
