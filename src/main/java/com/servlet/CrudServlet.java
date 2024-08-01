package com.servlet;

import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.sql.*;
import java.util.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.database.DBConnection;

/**
 * Servlet implementation class CrudServlet
 */
@WebServlet("/CrudServlet")
public class CrudServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String operation=request.getParameter("opration");
		
		if(operation.equals("add")) {
			
			String title=request.getParameter("title");
			String description=request.getParameter("description");
			String price=request.getParameter("price");
			String imageUrl=request.getParameter("image");
			String category=request.getParameter("category");
			
			
			byte[] imageUrlBytes = imageUrl.getBytes(StandardCharsets.UTF_8);
			
			try {
				Connection con=DBConnection.takeConnection();
				String query="insert into menu (title,category,price,image,description)values (?,?,?,?,?)";
				PreparedStatement ps=con.prepareStatement(query);
				ps.setString(1, title);
				ps.setString(2, category);
				ps.setString(3, price);
				ps.setBytes(4, imageUrlBytes);
				ps.setString(5, description);
				ps.executeUpdate();
				
			}catch(Exception e) {
				e.printStackTrace();
			}
			response.sendRedirect("add.jsp");
		}
		
		if(operation.equals("remove")) {
			String q=request.getParameter("query");
			
			try {
				Connection con=DBConnection.takeConnection();
				String query=q;
				
				PreparedStatement ps=con.prepareStatement(query);
				
				ps.executeUpdate();
				
			}catch(Exception e) {
				e.printStackTrace();
			}
			response.sendRedirect("remove.jsp");
		}
		
	}

}
