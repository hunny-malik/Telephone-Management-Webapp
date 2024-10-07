package com.conn;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnect 
{
	private static Connection conn;
	public static Connection getconn() 
	{
		try 
		{
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/telephone","root","password");
			
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		
		return conn;
	}
}
