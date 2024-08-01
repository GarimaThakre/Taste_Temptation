<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Main</title>
<%@ page import="java.sql.*,com.database.DBConnection" %>
<%@ page import="java.util.*" %> 
<%@ include file="cdn.jsp" %>
<link href="style.css" rel="stylesheet" >
</head>
<body>
	<header id="header" class="fixed-top">
        <nav class="navbar navbar-inverse">
            <div class="container-fluid">
                <div class="navbar-header">
                    <a class="navbar-brand" href="menu.jsp">Menu</a>
                </div>
                <ul class="nav navbar-nav">
	                <li><a class="menu-btn" href="welcome.jsp">Home</a></li>
	            	<li><a class="menu-btn" href="appetizer.jsp">Appetizer</a></li>
	            	<li><a class="menu-btn" href="main.jsp">Main-Course</a></li>
	            	<li><a class="menu-btn" href="beverages.jsp">Beverages</a></li>
	            	<li><a class="menu-btn" href="dessert.jsp">Dessert</a></li>
                </ul>
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="login.jsp"><span class=" signin-signup-btn"> SignUp/SignIn</span></a></li>
                    <li><a href="AddtoCart.jsp"><span class=" signin-signup-btn"> AddtoCart</span></a></li>
                    <li><a href="logout.jsp"><span><i class="fas fa-sign-out-alt"></i></span></a></li>
                </ul>
            </div>
        </nav>
    </header>
    <section id="menu" class="text-center">
        <div class="container">
            <h2>Checkout Our tasty <span>Main-Course</span></h2>           
        </div>
    </section>
	
<div class=food-container>
	<table border="1" class="food-table">
       <thead>
	        <tr>
	        	<th>Images</th>
	            <th>Name</th>
	            <th>Add to Cart</th>
	        </tr>
       </thead>  
       <tbody>
        <%
 
            try {
                
            	Connection con = DBConnection.takeConnection();	
    			String query = "select * from menu where category='Main'";
    			PreparedStatement ps = con.prepareStatement(query);
    			ResultSet rs = ps.executeQuery();
                
    			while(rs.next())
    			{
    				out.println("<tr>");
    				String foodId=rs.getString(1);
    				String title=rs.getString(2);
    				String category=rs.getString(2);
    				String price=rs.getString(4);
    				String itemImage=rs.getString(5);
    				String description=rs.getString(6);
    				%>
    				<form method="post" action="AddtoCartServlet">
    				<td><img  id="img-food" src="<%=itemImage%>"></td>
    				<td style="padding:20px;"><h1 id="food-title"><%=title %></h1><p id="food-para"><%=description %></p><br>
    				<p id="food-price">Price : <%=price %></p>
    					<select name="spice-level" class="spice-level" name="spice-level">
    						<option>Mild</option>
    						<option>Medium</option>
    						<option>Hot</option>
    						<option>Very Hot</option>
    						<option>Extremely Hot</option>
    					</select>
    				</td>
 					<td style="padding:10px;">
 					
 						<input type="hidden" name="foodId" value="<%=foodId%>"> 
 						<input type="hidden" name="title" value="<%=title%>">
 						<input  type="hidden" name="spice-level"> 
 						<input type="hidden" name="price" value="<%=price%>">
 						<input type="submit"  value="Add To Cart" id="submit-btn">
 					</form>
 					</td>
    				<% 
    				out.println("</tr>");
    			}
    			con.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        %>
       </tbody>
    </table>
</div>	

</body>
</html>