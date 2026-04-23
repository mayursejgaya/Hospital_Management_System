package com.dao;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.entity.Specialist;

public class SpecialistDao {
	
	Connection conn = null;
	
	public SpecialistDao(Connection conn) {
		this.conn = conn;
	}
	
	public boolean insertSpecialist(String spec) {
		String sql = "insert into specialist(spec_name) values(?)";
		try {
			PreparedStatement stmt=conn.prepareStatement(sql);
			stmt.setString(1, spec);
			
			int n=stmt.executeUpdate();
			
			if(n == 1) return true;
			
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		
		return false;
	}
	
	public List<Specialist> getAllSpecialist(){
		
		String sql = "Select * from specialist";
		List<Specialist> list = new ArrayList<>();
		Specialist st= null;
		try {
			Statement stmt=conn.createStatement();
			ResultSet res = stmt.executeQuery(sql);
			
			while(res.next()) {
				st = new Specialist();
				st.setId(res.getInt(1));
				st.setSpecialistName(res.getString(2));
				list.add(st);
			}
			return list;
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
}
