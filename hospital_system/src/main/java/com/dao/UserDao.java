package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.entity.User;

public class UserDao {
	private Connection conn;
	
	public UserDao(Connection conn) {
		this.conn = conn;
	}
	
	public boolean userRegister(User u) {
		String query = "INSERT INTO user_details(fullname,email,password) VALUES (?,?,?)";
		try {
			PreparedStatement stmt=conn.prepareStatement(query);
			stmt.setString(1, u.getFullName());
			stmt.setString(2, u.getEmail());
			stmt.setString(3, u.getPassword());
			
			int n = stmt.executeUpdate();
			if(n==1)return true;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return false;
	}
	
	public User login(String em, String psw) {
		
		User u = null;
		String sql = "SELECT * FROM `user_details` WHERE `email`=? AND `password`=?";
		try {
			PreparedStatement stmt=conn.prepareStatement(sql);
			stmt.setString(1, em);
			stmt.setString(2, psw);
			
			ResultSet res=stmt.executeQuery();
			
			while(res.next()) {
				 u = new User();
				u.setId(res.getInt("id"));
				u.setFullName(res.getString("fullname"));
				u.setEmail(res.getString("email"));
				u.setPassword("password");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return u;
	}
	
	public boolean checkOldPassword(int id, String oldPassword) {
		
		try {
			String sql = "Select * from user_details where id=? and password=?";
			PreparedStatement stmt=conn.prepareStatement(sql);
			stmt.setInt(1, id);
			stmt.setString(2, oldPassword);
			
			ResultSet res = stmt.executeQuery();
			
			while(res.next()) {
				return true;
			}
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
			
		}
		
		return false;
	}
	
public boolean updatePassword(int id, String password) {
		
		try {
			String sql = "update user_details set password=? where id=?";
			PreparedStatement stmt=conn.prepareStatement(sql);
			stmt.setInt(2, id);
			stmt.setString(1, password);
			
			int n=stmt.executeUpdate();
			
			if(n==1) {
				return true;
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
			
		}
		
		return false;
	}
	
}
