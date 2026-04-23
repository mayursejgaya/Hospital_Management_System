package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.AppointmentDao;
import com.db.DBconnect;
import com.entity.Appointment;


@WebServlet("/adduserappointment")
public class AddAppointment extends HttpServlet {
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		 int userId = Integer.parseInt(req.getParameter("userid"));
		 String fullname = req.getParameter("fullname");
		 String gender = req.getParameter("gender");
		 String age = req.getParameter("age");
		 String appointmentDate= req.getParameter("appoint_date");
		 String email = req.getParameter("email");
		 String phone = req.getParameter("phone");
		 String diseases = req.getParameter("diseases");
		 int docterId = Integer.parseInt(req.getParameter("doct"));
		 String address = req.getParameter("address");
		 String status = req.getParameter("status");
		 
		
		 Appointment appoint = new Appointment(userId, fullname, gender, age, appointmentDate, email, phone, diseases, docterId, address, status);
		
		AppointmentDao dao = new AppointmentDao(DBconnect.getconn());
		boolean res=dao.insertAppointment(appoint);
		HttpSession session = req.getSession();
		if(res) {
			session.setAttribute("succmsg", "Appointment added successfully");
			resp.sendRedirect("user_appointment.jsp");
		}else {
			session.setAttribute("errormsg", "something went wrong");
			resp.sendRedirect("user_appointment.jsp");
		}
		
	}
}
