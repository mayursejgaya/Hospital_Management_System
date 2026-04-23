package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.UserDao;
import com.db.DBconnect;


@WebServlet("/changepasswordofuser")
public class ChangePassword extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		int uid = Integer.parseInt(req.getParameter("uid"));
		String oldPassword = req.getParameter("oldpassword");
		String newPassword = req.getParameter("newpassword");
		
		UserDao dao = new UserDao(DBconnect.getconn());
		
		HttpSession session = req.getSession();
		
		if(dao.checkOldPassword(uid, oldPassword)) {
			boolean n=dao.updatePassword(uid, newPassword);
			if(n) {
				session.setAttribute("succmsg", "password change successfully");
				resp.sendRedirect("changepassword.jsp");
			}else {
				session.setAttribute("errormsg", "something went wrong");
				resp.sendRedirect("changepassword.jsp");
			}
			
		}else {
			session.setAttribute("errormsg", "Incorrect oldpassword");
			resp.sendRedirect("changepassword.jsp");
		}
		
	}
}
