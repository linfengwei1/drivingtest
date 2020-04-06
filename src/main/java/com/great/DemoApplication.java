package com.great;


import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;

@SpringBootApplication
public class DemoApplication extends SpringBootServletInitializer
{
	@Override
	protected SpringApplicationBuilder configure(SpringApplicationBuilder builder) {
		return builder.sources(DemoApplication.class);
	}
	public static void main(String[] args) {
		System.out.println("我来打个酱油");
		System.out.println("注意不要提交.idea文件夹和target文件夹");
		SpringApplication.run(DemoApplication.class, args);
		System.out.println("一giao我里giao giao ");
		System.out.println("林丰为 ");
	}
}
