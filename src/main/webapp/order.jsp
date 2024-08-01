<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Order Details</title>
<%@ include file="cdn.jsp" %>
 <link href="style.css" rel="stylesheet" >
 <%@ page import="java.sql.*,com.database.DBConnection" %>
</head>
<body>
	<header id="header" class="fixed-top">
        <nav class="navbar navbar-inverse">
            <div class="container-fluid">
                <div class="navbar-header">
                    <a class="navbar-brand" href="admin.jsp">Admin Pannel</a>
                </div>
                <ul class="nav navbar-nav">
	                <li><a class="menu-btn" href="order.jsp">Order</a></li>
	                <li><a class="menu-btn" href="menu.jsp">Menu</a></li>
	            	<li><a class="menu-btn" href="salesReport.jsp">Report</a></li>
                </ul>
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="login.jsp"><span class=" signin-signup-btn"> SignUp/SignIn</span></a></li>
                    <li><a href="logout.jsp"><span><i class="fas fa-sign-out-alt"></i></span></a></li>
                </ul>
            </div>
        </nav>
    </header>
 
 	<h1 style="font-size:30px;font-family:'Times New Roman', Times, serif; padding:20px;'">Order Details :</h1>
    <table class="table  table-striped " style="margin:30px;">
    	<thead>
    		<tr>
    			<th scope="col">Id</th>
    			<th scope="col">Customer Name</th>
    			<th scope="col">Customer Email</th>
    			<th scope="col">Total</th>
    			<th scope="col">Order Date</th>
    			<th scope="col">Status</th>
    		</tr>
    	
    	</thead>
    	<tbody>
    		<%
	    		Connection con = null;
	            PreparedStatement ps = null;
	            ResultSet rs = null;
    			try{
    				 con = DBConnection.takeConnection();	
        			String query = "select * from orders";
        			ps = con.prepareStatement(query);
        			 rs = ps.executeQuery();
                    while(rs.next()){
    		
    		%>
    		<tr>
    			<td><%=rs.getInt(1) %></td>
    			<td><%=rs.getString(2) %></td>
    			<td><%=rs.getString(3) %></td>
    			<td><%=rs.getDouble(4) %></td>
    			<td><%=rs.getString(5) %></td>
    			<%
    			String status=rs.getString(6);
    			if(!status.equals("pending")){
					out.println("<td>"+status+"</td>");
				}else{
					out.println("<td>");
					out.println("<form action='OrderServlet' method='post'>");
					out.println("<input type='hidden' name='sno' value='"+rs.getString(1)+"'>");
					out.println("<input type='submit' class='btn btn-success' name='approve_deny' value='Approve'>");
					out.println("</form>");
					out.println("</td>");
					out.println("<td>");
					out.println("<form action='OrderServlet' method='post'>");
					out.println("<input type='hidden' name='sno' value='"+rs.getString(1)+"'>");
					out.println("<input type='submit' class='btn btn-danger' name='approve_deny' value='Deny'>");
					out.println("</form>");
					out.println("</td>");
				}
    			
    			%>
    			
    		</tr>
    		<%
                    }
    			}catch(Exception e){
    				e.printStackTrace();
    			}finally {
                    try {
                        if (rs != null) rs.close();
                        if (ps != null) ps.close();
                        if (con != null) con.close();
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                }
    		%>
    	</tbody>
    
    </table>
</body>
</html>