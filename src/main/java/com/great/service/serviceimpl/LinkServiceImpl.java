package com.great.service.serviceimpl;

import com.great.dao.LinkMapper;
import com.great.entity.*;

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
    public List<School> findAllSchool() {
        linkMapper = sqlSessionTemplate.getMapper(LinkMapper.class);//获得代理对象
        return linkMapper.findAllSchool();
    }

	//查询驾驶技巧通告(Driving skills)
    @Override
    public List<Notice> getNoticeDS()
    {
        linkMapper = sqlSessionTemplate.getMapper(LinkMapper.class);//获得代理对象
        return linkMapper.getNoticeDS();
    }

	//查询学车学堂的通告(Car school)
	@Override
	public List<Notice> getNoticeCS()
	{
		linkMapper = sqlSessionTemplate.getMapper(LinkMapper.class);//获得代理对象
		return linkMapper.getNoticeCS();
	}






















































	@Override
	public SchoolInfoList getSchoolInfoByPage(String curr, String shcoolName, String addr)
	{
		SchoolInfoList schoolInfoList = new SchoolInfoList();
		int beg = (Integer.parseInt(curr)-1)*6;
		int end = 6;
		linkMapper = sqlSessionTemplate.getMapper(LinkMapper.class);//获得代理对象
		List<SchoolInfoPage> list =  linkMapper.getSchoolInfoByPage(Integer.parseInt(curr),shcoolName,addr,beg,end);
		int count  =  linkMapper.getSchoolInfoByPageCount(shcoolName,addr);
		schoolInfoList.setList(list);
		schoolInfoList.setCount(count);
		return schoolInfoList;
	}
}
