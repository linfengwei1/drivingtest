package com.great.service;


import com.great.entity.Link;
import com.great.entity.LinkUtils;


import java.util.List;

public interface LinkService {

    public void addLinkUrl(Link link);
    public List<Link> findAllLink();
}
