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
import com.entity.User;



@WebServlet("/user_register")
public class UserRegistation extends HttpServlet{
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String name=req.getParameter("fullname");
		String email=req.getParameter("email");
		String password=req.getParameter("password");
		
		User u = new User(name,email,password);
		UserDao dao=new UserDao(DBconnect.getconn());
		boolean res=dao.userRegister(u);
		HttpSession session=req.getSession();
		if(res) {
			session.setAttribute("succmsg", "Registration successfull");
			resp.sendRedirect("signup.jsp");
		}else {
			session.setAttribute("errormsg", "Something went wrong at server");
			resp.sendRedirect("signup.jsp");
		}
	}
}
