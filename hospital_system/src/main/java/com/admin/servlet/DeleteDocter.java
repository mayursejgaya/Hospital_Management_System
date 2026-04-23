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

@WebServlet("/deleteDocter")
public class DeleteDocter extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int id = Integer.parseInt(req.getParameter("id"));
		
		DocterDao dao = new DocterDao(DBconnect.getconn());
		boolean res = dao.deleteDocterById(id);
		HttpSession session = req.getSession();
		if(res) {
			session.setAttribute("succmsg", "deleted successfully");
			resp.sendRedirect("admin/view_docter.jsp");
		}else {
			session.setAttribute("errormsg", "something went wrong");
			resp.sendRedirect("admin/view_docter.jsp");
		}
	}
}
