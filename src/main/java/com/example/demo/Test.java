package com.example.demo;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class Test
{
	public static void  test() throws  Exception{
		Class.forName("com.mysql.cj.jdbc.Driver");

		Connection connection = DriverManager.getConnection("jdbc:mysql://localhost/demo?serverTimezone=UTC&useUnicode=true&characterEncoding=UTF-8",
				"root", "123");
		PreparedStatement ps = connection.prepareStatement("select 1 ");

		ResultSet re = ps.executeQuery();
		if(re != null){
			while(re.next()){
				System.out.println(re.getInt(1));
			}
		}
		re.close();
		ps.close();
		connection.close();


	}

	public static void main(String[] args) throws Exception
	{
		Test.test();
	}
}
