package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.entity.Docter;

public class DocterDao {
	private Connection conn;

	public DocterDao(Connection conn) {
		this.conn = conn;
	}

	public boolean insertDocter(Docter d) {

		String sql = "insert into docter(fullname,dob,qualification,specialist,email,mobile,password) values(?,?,?,?,?,?,?)";

		try {
			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setString(1, d.getFullname());
			stmt.setString(2, d.getDob());
			stmt.setNString(3, d.getQualification());
			stmt.setString(4, d.getSpecialist());
			stmt.setString(5, d.getEmail());
			stmt.setString(6, d.getMobile());
			stmt.setString(7, d.getPassword());

			int n = stmt.executeUpdate();

			if (n == 1)
				return true;

			return false;

		} catch (Exception e) {
			e.printStackTrace();
		}

		return false;
	}

	public List<Docter> getAllDocter() {
		List<Docter> list = new ArrayList<>();
		Docter d;

		String sql = "select * from docter order by id desc";

		try {
			Statement stmt = conn.createStatement();
			ResultSet res = stmt.executeQuery(sql);

			while (res.next()) {
				d = new Docter();
				d.setId(res.getInt(1));
				d.setFullname(res.getString(2));
				d.setDob(res.getString(3));
				d.setQualification(res.getString(4));
				d.setSpecialist(res.getString(5));
				d.setEmail(res.getString(6));
				d.setMobile(res.getString(7));
				d.setPassword(res.getString(8));
				list.add(d);
			}

			return list;

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	public Docter getDocterById(int id) {

		Docter d = null;

		String sql = "Select * from docter where id=?";

		try {

			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setInt(1, id);

			ResultSet res = stmt.executeQuery();

			while (res.next()) {
				d = new Docter();
				d.setId(res.getInt(1));
				d.setFullname(res.getString(2));
				d.setDob(res.getString(3));
				d.setQualification(res.getString(4));
				d.setSpecialist(res.getString(5));
				d.setEmail(res.getString(6));
				d.setMobile(res.getString(7));
				d.setPassword(res.getString(8));
			}
			return d;

		} catch (Exception e) {
			e.printStackTrace();
		}

		return d;
	}
	
	public boolean updateDocterById(Docter d) {
		
		String sql = "update docter set fullname=?, dob=? , qualification=? , specialist=? , email=? , mobile=? , password=? where id=?";
		
		try {
			
			PreparedStatement stmt=conn.prepareStatement(sql);
			
			stmt.setString(1, d.getFullname());
			stmt.setString(2, d.getDob());
			stmt.setNString(3, d.getQualification());
			stmt.setString(4, d.getSpecialist());
			stmt.setString(5, d.getEmail());
			stmt.setString(6, d.getMobile());
			stmt.setString(7, d.getPassword());
			stmt.setInt(8, d.getId());
			
			int n=stmt.executeUpdate();
			if(n==1) {
				return true;
			}
			return false;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return false;
	}
	
	
	
	
	

	public boolean deleteDocterById(int id) {

		String sql = "delete from docter where id=?";

		try {

			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setInt(1, id);

			int res=stmt.executeUpdate();
			if(res==1) return true;
			return false;

		} catch (Exception e) {
			e.printStackTrace();
		}

		return false;
	}
	
	public Docter docterLogin(String demail, String dpassword) {
		Docter d = null;
		String sql = "Select * from docter where email=? and password=?";
		
		try {
			PreparedStatement stmt=conn.prepareStatement(sql);
			stmt.setString(1, demail);
			stmt.setString(2, dpassword);
			
			ResultSet res=stmt.executeQuery();
			
			while(res.next()) {
				d= new Docter();
				d.setId(res.getInt(1));
				d.setFullname(res.getString(2));
				d.setDob(res.getString(3));
				d.setQualification(res.getString(4));
				d.setSpecialist(res.getString(5));
				d.setEmail(res.getString(6));
				d.setMobile(res.getString(7));
				d.setPassword(res.getString(8));
			}
			return d;			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		
		return d;
	}
	
	public int countDocter() {
		int num = 0;
		try {
			String sql = "SELECT * FROM docter";
			Statement stmt=conn.createStatement();
			ResultSet res=stmt.executeQuery(sql);
			
			while(res.next()) {
				num++;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return num;
	}
	
	public int countUser() {
		int num = 0;
		try {
			String sql = "SELECT * FROM user_details";
			Statement stmt=conn.createStatement();
			ResultSet res=stmt.executeQuery(sql);
			
			while(res.next()) {
				num++;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return num;
	}
	
	public int countAppointment() {
		int num = 0;
		try {
			String sql = "SELECT * FROM appointment";
			Statement stmt=conn.createStatement();
			ResultSet res=stmt.executeQuery(sql);
			
			while(res.next()) {
				num++;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return num;
	}
	
	public int countSpecialist() {
		int num = 0;
		try {
			String sql = "SELECT * FROM specialist";
			Statement stmt=conn.createStatement();
			ResultSet res=stmt.executeQuery(sql);
			
			while(res.next()) {
				num++;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return num;
	}
	
	public int countAppointmentBydocterId(int docid) {
		int num = 0;
		try {
			String sql = "SELECT * FROM appointment where docterId=?";
			PreparedStatement stmt=conn.prepareStatement(sql);
			stmt.setInt(1, docid);
			ResultSet res=stmt.executeQuery();
			while(res.next()) {
				num++;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return num;
	}

}
