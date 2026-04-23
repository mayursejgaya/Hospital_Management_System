package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.entity.Appointment;

public class AppointmentDao {
	private Connection conn;

	public AppointmentDao(Connection conn) {
		this.conn = conn;
	}

	public boolean insertAppointment(Appointment appoint) {

		String sql = "Insert into `appointment`(userId,fullname,gender,age,appointmentDate,email,phone,diseases,docterId,address,status) values(?,?,?,?,?,?,?,?,?,?,?)";

		try {

			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setInt(1, appoint.getUserId());
			stmt.setString(2, appoint.getFullname());
			stmt.setString(3, appoint.getGender());
			stmt.setString(4, appoint.getAddress());
			stmt.setString(5, appoint.getAppointmentDate());
			stmt.setString(6, appoint.getEmail());
			stmt.setString(7, appoint.getPhone());
			stmt.setString(8, appoint.getDiseases());
			stmt.setInt(9, appoint.getDocterId());
			stmt.setString(10, appoint.getAddress());
			stmt.setString(11, appoint.getStatus());

			int n = stmt.executeUpdate();

			if (n == 1)
				return true;

		} catch (Exception e) {
			e.printStackTrace();
		}

		return false;
	}

	public List<Appointment> getAllAppointmentByLoginuser(int loginUserId) {
		List<Appointment> list = new ArrayList<Appointment>();
		String sql = "SELECT * FROM `appointment` WHERE userId=? ORDER BY `id` DESC";
		try {

			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setInt(1, loginUserId);
			ResultSet res = stmt.executeQuery();

			while (res.next()) {
				int id = res.getInt(1);
				int userId = res.getInt(2);
				String fullname = res.getString(3);
				String gender = res.getString(4);
				String age = res.getString(5);
				String appointmentdate = res.getString(6);
				String email = res.getString(7);
				String phone = res.getString(8);
				String diseases = res.getString(9);
				int doctId = res.getInt(10);
				String address = res.getString(11);
				String status = res.getString(12);

				Appointment app = new Appointment(id, userId, fullname, gender, age, appointmentdate, email, phone,
						diseases, doctId, address, status);
				list.add(app);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	public List<Appointment> getAllAppointmentByDocterId(int docterid) {
		List<Appointment> list = new ArrayList<Appointment>();
		String sql = "SELECT * FROM `appointment` WHERE docterId=? ORDER BY `id` DESC";
		try {

			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setInt(1, docterid);
			ResultSet res = stmt.executeQuery();

			while (res.next()) {
				int id = res.getInt(1);
				int userId = res.getInt(2);
				String fullname = res.getString(3);
				String gender = res.getString(4);
				String age = res.getString(5);
				String appointmentdate = res.getString(6);
				String email = res.getString(7);
				String phone = res.getString(8);
				String diseases = res.getString(9);
				int doctId = res.getInt(10);
				String address = res.getString(11);
				String status = res.getString(12);

				Appointment app = new Appointment(id, userId, fullname, gender, age, appointmentdate, email, phone,
						diseases, doctId, address, status);
				list.add(app);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	public Appointment getAppointmentbyId(int uid) {

		Appointment ap = null;
		try {
			String sql = "select * from appointment where id=?";
			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setInt(1, uid);
			ResultSet res = stmt.executeQuery();

			while (res.next()) {
				int id = res.getInt(1);
				int userId = res.getInt(2);
				String fullname = res.getString(3);
				String gender = res.getString(4);
				String age = res.getString(5);
				String appointmentdate = res.getString(6);
				String email = res.getString(7);
				String phone = res.getString(8);
				String diseases = res.getString(9);
				int doctId = res.getInt(10);
				String address = res.getString(11);
				String status = res.getString(12);

				ap = new Appointment(id, userId, fullname, gender, age, appointmentdate, email, phone, diseases, doctId,
						address, status);

			}
			

		} catch (Exception e) {
			e.printStackTrace();
		}

		return ap;
	}
	
	public boolean updateCommentStatus(int id, int docId, String comm ) {
		
		String sql = "update appointment set status=? where id=? and docterId=?";
		
		try {
			PreparedStatement stmt=conn.prepareStatement(sql);
			stmt.setString(1, comm);
			stmt.setInt(2, id);
			stmt.setInt(3, docId);
			
			int res=stmt.executeUpdate();
			
			if(res==1) {
				return true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return false;
	}
	
	public List<Appointment> getAllAppointment() {
		List<Appointment> list = new ArrayList<Appointment>();
		String sql = "SELECT * FROM `appointment` ORDER BY `id` DESC";
		try {

			Statement stmt = conn.createStatement();
			ResultSet res = stmt.executeQuery(sql);

			while (res.next()) {
				int id = res.getInt(1);
				int userId = res.getInt(2);
				String fullname = res.getString(3);
				String gender = res.getString(4);
				String age = res.getString(5);
				String appointmentdate = res.getString(6);
				String email = res.getString(7);
				String phone = res.getString(8);
				String diseases = res.getString(9);
				int doctId = res.getInt(10);
				String address = res.getString(11);
				String status = res.getString(12);

				Appointment app = new Appointment(id, userId, fullname, gender, age, appointmentdate, email, phone,
						diseases, doctId, address, status);
				list.add(app);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

}
