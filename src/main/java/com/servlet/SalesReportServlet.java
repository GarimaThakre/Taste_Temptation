package com.servlet;

import java.io.IOException;
import com.database.DBConnection;
import java.util.*;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 * Servlet implementation class SalesReportServlet
 */
@WebServlet("/SalesReportServlet")
public class SalesReportServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		String startDate = request.getParameter("startDate");
        String endDate = request.getParameter("endDate");
        
        double totalSales = 0;
        int orderCount = 0;
        ResultSet rs=null;
        try {
        	Connection con=DBConnection.takeConnection();
			String query="select id,total,orderdate from orders where orderdate between ? and ?";
			PreparedStatement ps = con.prepareStatement(query);
            ps.setTimestamp(1, Timestamp.valueOf(startDate + " 00:00:00"));
            ps.setTimestamp(2, Timestamp.valueOf(endDate + " 23:59:59"));
            
            rs=ps.executeQuery();
            while(rs.next()) {
            	totalSales += rs.getDouble("total");
                orderCount++;
            }
            
        }catch(Exception e){
			e.printStackTrace();
		}
        
        request.setAttribute("totalSales", totalSales);
        request.setAttribute("orderCount", orderCount);
        request.setAttribute("startdate", startDate);
        request.setAttribute("enddate", endDate);
        getServletContext().getRequestDispatcher("/salesReport.jsp").forward(request, response);
    }
	}


