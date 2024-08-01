<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Items</title>

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
    <h1 style="font-size:30px;font-family:'Times New Roman', Times, serif; padding:20px;'">Add Items</h1>
    	<div class="container">
    		<div class="row">
    			<div class="col-md-4"></div>
    			<div class="col-md-4">
    				<fieldset>
							<form method="post" action="CrudServlet"> 
								<div class="form-group">
								    <label for="title">Food Title :</label>
								    <input type="text" name="title" class="form-control" placeholder="Enter Food Title" required>
								 </div>
								 <div class="form-group">
								    <label for="description">Food Description :</label>
								   <input type="text" name="description" class="form-control" placeholder="Enter Food Description of request" required>
								 </div>
								 <div class="form-group">
								    <label for="price">Food Price :</label>
								   <input type="text" name="price" class="form-control" placeholder="Enter Food Price" required>
								 </div>
								 <div class="form-group">
								    <label for="image">Food Image :</label>
								   <input type="text" name="image" class="form-control" placeholder="Enter Food Image" required>
								 </div>
								 <div class="form-group">
								    <label for="category">Select Category :</label>
								    <select name="category" class="form-control">
										<option value="Legal">Appetizer</option>
										<option value="Main">Main</option>
										<option value="Beverages">Beverages</option>
										<option value="Dessert">Dessert</option>
								</select><br>
								 </div>
								<input type="hidden" name="operation" value="add">
								<input type="submit" class="btn btn-primary btn-block" value="Add Items">
							</form>
				</fieldset>
    			</div>
    			<div class="col-md-4"></div>
    		</div>
    	</div>
    	
    </section>
</body>
</html>