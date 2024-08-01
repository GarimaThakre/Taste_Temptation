<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Bill</title>
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
            		<h2> Bill</h2>
        		</div>
        		<div>
        		<form method="post" action="ProcessOrderServlet">
        			 
        			
        					<table class="table table-hover">
        		
        			<tr>
						<th colspan="5">Customer Information : </th>
					</tr>
        		
        
				
        		<% 
        		String name=(String) session.getAttribute("username");
        		String password=(String) session.getAttribute("password");
        		
        		if(name==null){
        			response.sendRedirect("login.jsp");
        		}
        		session.setAttribute("username",name);
        		
        			try{
        				Connection con = DBConnection.takeConnection();	
        				String query1 = "select * from user where username=?";
        				PreparedStatement ps = con.prepareStatement(query1);
        				ps.setString(1,name);
        				ResultSet rs = ps.executeQuery();
        				while(rs.next())
        				{
        					String customerId=rs.getString(1);
        					String customerName=rs.getString(2);
        					String customerEmail=rs.getString(3);
        					session.setAttribute("customerEmail",customerEmail);
        					String phone=rs.getString(5);
        				
        				
        			%>
        			<tr>
        				<td>Customer Id : </td>	
        				<td colspan="4"><%=customerId%></td>
        			</tr>
        			<tr>
        				<td>Customer Name : </td>	
        				<td colspan="4"><%=customerName%></td>
        			</tr>
        			<tr>
        				<td>Email : </td>	
        				<td colspan="4"><%=customerEmail %></td>
        			</tr>
        			<tr>
        				<td>Mobile NO. : </td>	
        				<td colspan="4"><%=phone %></td>
        			</tr>	
      					
      					<tr><td><p id="bill">Items :</p></td></tr>
        	 <%
					}
        				
        				con.close();
        				
	        			}catch(Exception e){
	        				e.printStackTrace();
        			}
        				
        				%>	
        				
        				 <tr>
        				 <th>SNo.</th>
					            <th>Food ID</th>
					            <th>Title</th>
					            <th>Price</th>
					            <th>Quantity</th>
					            <th>Total</th>
					        </tr>		
        		
						        <%
						            double grandTotal = 0.0;
						
						            Enumeration<String> parameterNames = request.getParameterNames();
						            int sno=1;
						            while (parameterNames.hasMoreElements()) {
						                String paramName = parameterNames.nextElement();
						
						                if (paramName.startsWith("quantity_")) {
						                	
						                    String foodIdStr = paramName.substring("quantity_".length());
						                    int foodId = Integer.parseInt(foodIdStr);
						                    int quantity = Integer.parseInt(request.getParameter(paramName));
						                    String title = request.getParameter("title_" + foodId);
						                    double price = Double.parseDouble(request.getParameter("price_" + foodId));
						                    double total = price * quantity;
						                    grandTotal += total;
						        %>
						         <input type="hidden" name="foodId_<%= sno %>" value="<%= foodId %>">
                                    <input type="hidden" name="quantity_<%= sno %>" value="<%= quantity %>">
                                    <input type="hidden" name="price_<%= sno %>" value="<%= price %>">
      
						        <tr>
						      		<td><%= sno %></td>
						            <td><%= foodId %></td>
						            <td><%= title %></td>
						            <td><%= price %></td>
						            <td><%= quantity %></td>
						            <td><%= total %></td>
						        </tr>
						        <%
									        sno++;
									                }
									            }
						        %>
						        <tr>
						            <td colspan="4"><span>Grand Total</span></td>
						            <td><%= grandTotal %></td>
						        </tr>
						        
						        
						       
						    </table>
        			
      
        			<input type="hidden" name="grandTotal" value="<%= grandTotal %>">
        			<input type="submit" class="btn btn-success" value="pay" id="pay">
        			<button onclick="window.location.href='CancelServlet'" class="btn btn-danger">Cancel</button>
        			<button onclick="window.location.href='AddtoCart.jsp'" class="btn btn-info">Back</button>
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