package com.great;


import com.great.dao.IStudentDao;
import com.great.entity.Student;
import com.great.service.CoachManageService;
import com.great.service.StudentManageService;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;

import javax.annotation.Resource;
import java.util.HashMap;

@SpringBootApplication
public class DemoApplication extends SpringBootServletInitializer
{
	@Override
	protected SpringApplicationBuilder configure(SpringApplicationBuilder builder) {
		return builder.sources(DemoApplication.class);
	}
	public static void main(String[] args) {

		SpringApplication.run(DemoApplication.class, args);


	}

}
