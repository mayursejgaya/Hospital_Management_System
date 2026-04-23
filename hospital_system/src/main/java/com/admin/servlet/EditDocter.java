package com.admin.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.DocterDao;
import com.db.DBconnect;
import com.entity.Docter;

@WebServlet("/editdocter")
public class EditDocter extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		Docter d = new Docter();
		d.setId(Integer.parseInt(req.getParameter("id")));
		d.setFullname(req.getParameter("fullname"));
		d.setDob(req.getParameter("dob"));
		d.setQualification(req.getParameter("quali"));
		d.setSpecialist(req.getParameter("spec"));
		d.setEmail(req.getParameter("email"));
		d.setMobile(req.getParameter("mobno"));
		d.setPassword(req.getParameter("password"));
		
		DocterDao dao = new DocterDao(DBconnect.getconn());
		boolean res=dao.updateDocterById(d);
		HttpSession session = req.getSession();
		if(res) {
			session.setAttribute("succmsg", "docter update successfully");
			resp.sendRedirect("admin/view_docter.jsp");
		}else {
			session.setAttribute("errormsg", "something went wrong");
			resp.sendRedirect("admin/view_docter.jsp");
		}
		
		
	}
}
