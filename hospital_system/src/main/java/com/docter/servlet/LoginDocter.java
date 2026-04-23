package com.docter.servlet;

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

@WebServlet("/loginDocter")
public class LoginDocter extends HttpServlet {
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String email =req.getParameter("email");
		String password = req.getParameter("password");
		
		DocterDao dao = new DocterDao(DBconnect.getconn());
		Docter d=dao.docterLogin(email, password);
		
		HttpSession session = req.getSession();
		
		if(d != null) {
			session.setAttribute("docterobj", d);
			session.setAttribute("successs", "login successfull");
			resp.sendRedirect("docter/index.jsp");
		}else {
			session.setAttribute("errormsg", "Invalid email & password");
			resp.sendRedirect("doctor_login.jsp");;
		}
		
	}
}
