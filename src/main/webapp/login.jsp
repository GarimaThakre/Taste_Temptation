<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login Page</title>
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
    <br>
    <br>
	<div class="container">
		<div class="row">
			<div class="col-md-4"></div>
			<div class="col-md-4">
				<fieldset>
					<legend>SignIn</legend>
					<form method="post" action="role.jsp">
						<input type="text" name="name" class="form-control" placeholder="Enter Name" required><br>
						<input type="password" name="password" class="form-control" placeholder="Enter Password" required>
						<h4>Please select your role</h4>
						<select name="role" class="form-control">
							<option value="User">User</option>
							<option value="Admin">Admin</option>
						</select><br>
						<input type="submit" class="btn btn-primary btn-block" value="Login">
					</form>
					<br>
					<div>
						<p> New User? <a href="register.jsp">SignUp</a></p>
					</div>
				</fieldset>
			</div>
			<div class="col-md-4"></div>
			
		</div>
	</div>
</body>
</html>