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

    @Autowired
    private SqlSessionTemplate sqlSessionTemplate;

//    @Autowired
    private LinkMapper linkMapper;

    public void addLinkUrl(Link link){
         linkMapper = sqlSessionTemplate.getMapper(LinkMapper.class);//获得代理对象
         linkMapper.addLinkUrl(link);
    }
    public List<Link> findAllLink() {
        linkMapper = sqlSessionTemplate.getMapper(LinkMapper.class);//获得代理对象
        return linkMapper.findAllLink();
    }

}
