<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Pannel</title>

<%@ include file="cdn.jsp" %>
 <link href="style.css" rel="stylesheet" >
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
    <section id="admin">
    <h1 style="font-size:30px;font-family:'Times New Roman', Times, serif; padding:20px;'">Welcome to Admin Pannel</h1>
    	<div class="container">
    		<div class="row">
    			<div class="col-md-4"></div>
    			<div class="col-md-4">
    				<h2 style="font-size:20px;font-family:'Times New Roman', Times, serif;'">Do you want to do CRUD operation ?</h2><br>
    				<button onclick="window.location.href='add.jsp'" class=" btn btn-success">Add Items</button>
    				<button onclick="window.location.href='remove.jsp'" class="btn btn-success">Remove Items</button>
    				<br>
    				<h2 style="font-size:20px;font-family:'Times New Roman', Times, serif;'">Do you want to see order Details  ?</h2><br>
    				<button onclick="window.location.href='order.jsp'" class=" btn btn-success">Order Details</button>
    			
    				<br>
    				<h2 style="font-size:20px;font-family:'Times New Roman', Times, serif;'">Do you want to see Report ?</h2><br>
    				<button onclick="window.location.href='salesReport.jsp'" class=" btn btn-success">Sales Report</button>
    			</div>
    			<div class="col-md-4"></div>
    		</div>
    	</div>
    	
    </section>
</body>
</html>