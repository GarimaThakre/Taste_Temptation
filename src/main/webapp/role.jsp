<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Role</title>
<%@ page import="java.sql.*,com.database.DBConnection" %>
</head>
<body>

<%
	String username=request.getParameter("name");
	String password=request.getParameter("password");
	session.setAttribute("name",username);
	session.setAttribute("password",password);
	String role=request.getParameter("role");
	
	try
	{
		Connection con = DBConnection.takeConnection();	
		String query = "select username from user where username=? AND role=? AND password=?";
		PreparedStatement ps = con.prepareStatement(query);
		ps.setString(1, username);
	    ps.setString(2, role);
	    ps.setString(3, password);
		ResultSet rs = ps.executeQuery();
		if(rs.next()){
			if(role.equals("User")){
				response.sendRedirect("AddtoCart.jsp");
			}
			else
				response.sendRedirect("admin.jsp");
		}
		else{
			response.sendRedirect("login.jsp");
		}
		con.close();
	}
	catch(Exception e)
	{
		out.println(e);
	}
	
	
%>
</body>
</html>