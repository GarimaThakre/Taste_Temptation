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
 * Servlet implementation class AddtoCartServlet
 */
@WebServlet("/AddtoCartServlet")
public class AddtoCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String foodId=request.getParameter("foodId");
		String title=request.getParameter("title");
		String Price=request.getParameter("price");
		String spiceLevel=request.getParameter("spice-level");
		try {
			Connection con = DBConnection.takeConnection();	
			String query1 = "insert into addtocart(foodId,title,price,spicelevel)values(?,?,?,?)";
			PreparedStatement ps1 = con.prepareStatement(query1);
			ps1.setString(1, foodId);
			ps1.setString(2, title);
			ps1.setString(3, Price);
			ps1.setString(4, spiceLevel);
			ps1.executeUpdate();
			con.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		response.sendRedirect("menu.jsp");
	}

}
