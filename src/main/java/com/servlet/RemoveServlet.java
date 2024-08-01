package com.servlet;

import java.io.IOException;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.database.DBConnection;

/**
 * Servlet implementation class RemoveServlet
 */
@WebServlet("/RemoveServlet")
public class RemoveServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String foodId=request.getParameter("foodId");
		try {
			Connection con = DBConnection.takeConnection();	
			String query="delete from addtocart where foodId=?";
			PreparedStatement ps=con.prepareStatement(query);
			ps.setString(1, foodId);
			ps.executeUpdate();
			con.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		response.sendRedirect("AddtoCart.jsp");
	}

}
