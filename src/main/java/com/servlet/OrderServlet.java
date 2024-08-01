package com.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.database.DBConnection;

/**
 * Servlet implementation class OrderServlet
 */
@WebServlet("/OrderServlet")
public class OrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String status=request.getParameter("approve_deny");
		String sno=request.getParameter("sno");
try {
			
			Connection con = DBConnection.takeConnection();	
			String query1 = "update orders set status=? where id=? ";
			
			PreparedStatement ps1 = con.prepareStatement(query1);
			ps1.setString(1, status);
			ps1.setString(2, sno);
			
			ps1.executeUpdate();
			
		}catch(Exception e) {
			
			e.printStackTrace();
			
		}
		response.sendRedirect("order.jsp");
	}

}
