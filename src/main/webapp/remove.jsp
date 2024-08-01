<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Remove Items</title>

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
    <h1 style="font-size:40px;font-family:'Times New Roman', Times, serif; padding:20px;margin-left:40px;font-weight:bold;">Remove Items</h1>
	<div class="container">
    	<div class="row">
    		<div class="col-md-4"></div>
    		<div class="col-md-4">
    			<fieldset>
    				<form method="post" action="CrudServlet">
    
			    		<lable for="query">Write Remove Query here</lable><br><br>
			    		<input type="text" name="query" required><br><br>
			    		<input type="submit" value="remove" class="btn btn-success"><br> 
			    	</form>
    			
    			</fieldset>
    		
    		</div>
    		<div class="col-md-4"></div>
    	</div>
    </div>
    	
    </section>
</body>
</html>