package com.docter.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.AppointmentDao;
import com.db.DBconnect;

@WebServlet("/commentupdate")
public class CommentUpdate extends HttpServlet {
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int id = Integer.parseInt( req.getParameter("id"));
		int did = Integer.parseInt(req.getParameter("did"));
		String comm = req.getParameter("comm");
		
		AppointmentDao dao = new AppointmentDao(DBconnect.getconn());
		boolean res=dao.updateCommentStatus(id, did, comm);
		
		if(res) {
			resp.sendRedirect("docter/patient.jsp");
		}else {
			resp.sendRedirect("docter/patient.jsp");
		}
		
	}
}
