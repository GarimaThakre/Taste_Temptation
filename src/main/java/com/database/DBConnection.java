package com.database;

import java.sql.*;

public class DBConnection {
	public static Connection takeConnection() {
		Connection conn=null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/batch1","root","abc@123#G");
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return conn;
	}
}
