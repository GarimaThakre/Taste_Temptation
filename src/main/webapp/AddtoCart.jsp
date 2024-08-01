<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add To Cart</title>
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
                    <li><a href="AddtoCart.jsp"><span class=" signin-signup-btn">Add to Cart</span></a></li>
                    <li><a href="logout.jsp"><span><i class="fas fa-sign-out-alt"></i></span></a></li>
                </ul>
            </div>
        </nav>
    </header>
  
    <div class="container">
    <div class="row">
      <div class="col"></div> <!-- Empty column to center -->
      <div class="col-6">
        <div class="centered-div">
          <section id="addtocart" class="text-center">
        		 <div class="container">
            		<h2>Add to <span>Cart</span></h2>
        		</div>
        		<div>
        		<form method="post" action="bill.jsp">
        		<table class="table table-hover">
        		
        			<tr>
						<th>SNO</th>
						<th>FOOID</th>
						<th>TITLE</th>
						<th>PRICE</th>
						<th>QUANTITY</th>
						<th>SPICE LEVEL</th>
						<th>REMOVE</th>
					</tr>
        		
        
				
        		<%
        		String username=(String) session.getAttribute("name");
        		String password=(String) session.getAttribute("password");
        		session.setAttribute("username",username);
        		session.setAttribute("password",password);
        			try{
        				Connection con = DBConnection.takeConnection();	
        				String query1 = "select * from addtocart";
        				PreparedStatement ps = con.prepareStatement(query1);
        				ResultSet rs = ps.executeQuery();
 
        				while(rs.next())
        				{
        					String sno=rs.getString(1);
        					String foodId=rs.getString(2);
        					String title=rs.getString(3);
        					String price=rs.getString(4);
        					String spicelevel=rs.getString(5);
        					
        			%>
        			<tr>
        				<td><%=sno %></td>	
        				<td><%=foodId %></td>	
        				<td><%=title %></td>	
        				<td><%=price %></td>
        				
        				<td>
        					<input type="number" name="quantity_<%= foodId %>" value="1" min="1">
		                    <input type="hidden" name="foodId_<%= foodId %>" value="<%= foodId %>">
		                    <input type="hidden" name="title_<%=foodId %>" value="<%= title %>">
		                    <input type="hidden" name="price_<%= foodId %>" value="<%= price %>">
		               
        				</td>
        				<td><%=spicelevel %></td>	
        				<td>
        					<div>
        					<form method="post" action="RemoveServlet">
		        					<input type="hidden" name="foodId" value="<%=foodId %>">
		        					<input type="submit" class="btn-danger" value="Remove">
        					</form>
        					</div>
        				</td>		
        				</tr>	
        			<% 
        				}
        				con.close();
        				
        			}catch(Exception e){
        				e.printStackTrace();
        			}
        		
        		%>
        			</table>
        			<br>
        			<br>
        			
        			<input type="submit" value="Order" id="order">
        			</form>
        		</div>
        	</section>
        </div>
      </div>
      <div class="col"></div> <!-- Empty column to center -->
    </div>
  </div>
    
  
</body>
</html>