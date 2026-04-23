package com.db;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBconnect {
	private static Connection conn;
	static String url = "jdbc:mysql://localhost:3306/hospital_management";
	static String user = "root";
	static String pass = "root";
	
	public static Connection getconn() {
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn=DriverManager.getConnection(url, user, pass);
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		
		return conn;
	}
}
