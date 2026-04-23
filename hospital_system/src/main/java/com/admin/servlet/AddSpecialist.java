package com.admin.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.SpecialistDao;
import com.db.DBconnect;
import com.entity.User;


@WebServlet("/AddSpecialist")
public class AddSpecialist extends HttpServlet {
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String specName=req.getParameter("specName");
		
		SpecialistDao dao = new SpecialistDao(DBconnect.getconn());
		HttpSession session = req.getSession();
		
		boolean res=dao.insertSpecialist(specName);
		User u= null;
		if(res) {
			 u=(User)session.getAttribute("adminobj");
			
			session.setAttribute("succmsg", "Specialist added successfully");
			resp.sendRedirect("admin/index.jsp");
		}else {
			u=(User)session.getAttribute("adminobj");
			session.setAttribute("errormsg", "something went wrong");
			resp.sendRedirect("admin/index.jsp");
		}
	}
}
