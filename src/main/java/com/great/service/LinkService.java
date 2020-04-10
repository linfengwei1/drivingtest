package com.great.service;


import com.great.dao.LinkMapper;
import com.great.entity.Link;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import java.util.List;

public interface LinkService {

    public void addLinkUrl(Link link);
    public List<Link> findAllLink();
}
