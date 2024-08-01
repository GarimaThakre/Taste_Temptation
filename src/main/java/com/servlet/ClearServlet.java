package com.servlet;

import java.io.IOException;
import java.sql.*;
import com.database.DBConnection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ClearServlet
 */
@WebServlet("/ClearServlet")
public class ClearServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			Connection con = DBConnection.takeConnection();	
			
			
			
			String query1 = "truncate table addtocart";
			PreparedStatement ps = con.prepareStatement(query1);
			ps.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
		response.sendRedirect("logout.jsp");
	}

}
