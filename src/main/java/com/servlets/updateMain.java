package com.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.conn.DBConnect;
import com.dao.DAO;
import com.entity.values;

@SuppressWarnings("serial")
@WebServlet("/update")
public class updateMain extends HttpServlet
{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		String name = req.getParameter("name");
		String address = req.getParameter("address");
		String email = req.getParameter("email");
		String dob = req.getParameter("dob");
		String phone = req.getParameter("phone");
		int id = Integer.parseInt(req.getParameter("id"));

		values values = new values(id,name, address, email, dob, phone);

		DAO dao = new DAO(DBConnect.getconn());

		HttpSession session = req.getSession();
		
		boolean f=dao.update(values);

		if (f) {
			session.setAttribute("suc", "Telephone Update Successfully...");
			resp.sendRedirect("index.jsp");

		} else {
			session.setAttribute("err", "Something Wrong on Server...");
			resp.sendRedirect("index.jsp");

		}
	}
	
}
