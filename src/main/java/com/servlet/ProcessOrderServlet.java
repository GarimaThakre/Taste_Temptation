package com.servlet;

import java.io.IOException;
import java.sql.*;
import java.util.*;
import com.database.DBConnection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class ProcessOrderServlet
 */
@WebServlet("/ProcessOrderServlet")
public class ProcessOrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		 HttpSession session = request.getSession();
		 	String customername = (String) session.getAttribute("username");
	        String customerEmail = (String) session.getAttribute("customerEmail");
	        Connection con = null;
	        try {
	            con = DBConnection.takeConnection();
	            con.setAutoCommit(false);

	            // Insert into orders table
	            String insertOrderQuery = "insert into orders (username, useremail, total) values (?, ?, ?)";
	            PreparedStatement orderStmt = con.prepareStatement(insertOrderQuery, Statement.RETURN_GENERATED_KEYS);
	            double grandTotal = Double.parseDouble(request.getParameter("grandTotal"));
	            orderStmt.setString(1, customername);
	            orderStmt.setString(2, customerEmail);
	            orderStmt.setDouble(3, grandTotal);
	            orderStmt.executeUpdate();
	            ResultSet generatedKeys = orderStmt.getGeneratedKeys();
	            int orderId = 0;
	            if (generatedKeys.next()) {
	                orderId = generatedKeys.getInt(1);
	            } else {
	                throw new SQLException("Creating order failed, no ID obtained.");
	            }

	           
	            Enumeration<String> parameterNames = request.getParameterNames();
	            while (parameterNames.hasMoreElements()) {
	                String paramName = parameterNames.nextElement();
	                if (paramName.startsWith("quantity_")) {
	                    int foodId = Integer.parseInt(paramName.substring("quantity_".length()));
	                    int quantity = Integer.parseInt(request.getParameter(paramName));
	                    double price = Double.parseDouble(request.getParameter("price_" + foodId));

	                    String insertOrderDetailQuery = "insert into orderdetails (order_id, menuid, quantity, price) values (?, ?, ?, ?)";
	                    PreparedStatement orderDetailStmt = con.prepareStatement(insertOrderDetailQuery);
	                    orderDetailStmt.setInt(1, orderId);
	                    orderDetailStmt.setInt(2, foodId);
	                    orderDetailStmt.setInt(3, quantity);
	                    orderDetailStmt.setDouble(4, price);
	                    orderDetailStmt.executeUpdate();
	                }
	            }
	            
	        

	            con.commit();// Commit the transaction
	    } catch (Exception e) {
			        e.printStackTrace();
			        try {
			            if (con != null) {
			                con.rollback(); // Rollback if an exception occurs
			            }
			        } catch (SQLException ex) {
			            ex.printStackTrace();
			        }
	    } finally {
		        try {
		            if (con != null) {
		                con.setAutoCommit(true); // Reset auto-commit mode
		                con.close(); // Close connection
		            }
		        } catch (SQLException ex) {
		            ex.printStackTrace();
		        }
	    }
		RequestDispatcher dispatcher = request.getRequestDispatcher("ClearServlet");
        dispatcher.forward(request, response);
		
	}

}
