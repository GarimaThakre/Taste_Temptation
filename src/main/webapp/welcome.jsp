<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Welcome Page</title>
  <link href="style.css" rel="stylesheet" >
 <%@ include file="cdn.jsp" %>
</head>
<body>
    <header id="header" class="fixed-top">
        <nav class="navbar navbar-inverse">
            <div class="container-fluid">
                <div class="navbar-header">
                    <a class="navbar-brand" href="#">Taste Temptations</a>
                </div>
                <ul class="nav navbar-nav">
                    <li class="active"><a href="#">Home</a></li>
                    <li><a href="menu.jsp">Menu</a></li>
                    <li><a href="#gallery">Gallery</a></li>
                    <li><a href="#contact">Contact</a></li>
                </ul>
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="login.jsp"><span class=" signin-signup-btn"> SignUp/SignIn</span></a></li>
                    <li><a href="AddtoCart.jsp"><span class=" signin-signup-btn"> AddtoCart</span></a></li>
                    <li><a href="logout.jsp"><span><i class="fas fa-sign-out-alt"></i></span></a></li>
                </ul>
            </div>
        </nav>
    </header>

    <section id="welcome" class="text-center">
        <div class="container-welcome">
            <h1>Welcome to Taste Temptations</h1>
            <p><i>Experience a World of Irresistible Flavors and Aromas</i></p>
        </div>
    </section>

    <section id="menu" class="text-center">
        <div class="container">
            <h2>Checkout Our tasty <span>Menu</span></h2>
          

            <!-- Tab Navigation -->
            <ul class="menu-nav">
            	<li><a class="active menu-btn" href="menu.jsp">Show All</a></li>
            	<li><a class="menu-btn" href="appetizer.jsp">Appetizer</a></li>
            	<li><a class="menu-btn" href="main.jsp">Main-Course</a></li>
            	<li><a class="menu-btn" href="beverages.jsp">Beverages</a></li>
            	<li><a class="menu-btn" href="dessert.jsp">Dessert</a></li>
            </ul>
        </div>
    </section>

    <section id="gallery" class="text-center">
        <div class="container">
            <h2>Gallery</h2>
            <p>Take a look at our delicious dishes</p>
            <div class="row">
                <div class="col-md-3"><img src="https://i.pinimg.com/564x/f8/a7/01/f8a70144eb881afe78df0164e657e966.jpg" alt="Dish 1" class="img-responsive img-rounded"></div>
                <div class="col-md-3"><img src="https://i.pinimg.com/564x/86/6c/d2/866cd2867f9f2b7e6e3594fb1b8230dd.jpg" alt="Dish 2" class="img-responsive img-rounded"></div>
                <div class="col-md-3"><img src="https://i.pinimg.com/564x/23/a7/a1/23a7a102c9c116f6c285ff08416ee820.jpg" alt="Dish 3" class="img-responsive img-rounded"></div>
                <div class="col-md-3"><img src="https://i.pinimg.com/564x/14/1e/20/141e20c1455d856e493495d2265bb092.jpg" alt="Dish 4" class="img-responsive img-rounded"></div>
            </div>
        </div>
    </section>

    <section id="contact" class="text-center">
        <div class="container">
            <h2>Contact Us</h2>
            <p>Reach out for reservations or inquiries</p>
            <div class="row">
                <div class="col-md-6">
                    <form>
                        <div class="form-group">
                            <input type="text" class="form-control" placeholder="Name">
                        </div>
                        <div class="form-group">
                            <input type="email" class="form-control" placeholder="Email">
                        </div>
                        <div class="form-group">
                            <textarea class="form-control" rows="5" placeholder="Message"></textarea>
                        </div>
                        <button type="submit" class="btn btn-primary">Send</button>
                    </form>
                </div>
                <div class="col-md-6">
                    <p><strong>Address:</strong> 1234 Restaurant St, City, Country</p>
                    <p><strong>Phone:</strong> (123) 456-7890</p>
                    <p><strong>Email:</strong> contact@restaurant.com</p>
                </div>
            </div>
        </div>
    </section>
    
    
     <footer id="footer">
      <div class="container-footer">
		       		 <h3><span>D</span>elicious</h3>
		        	<p>
		          		You can follow and contact us on
		       		 </p>
		        		<div class="social-links">
				          <a href="#" class="twitter icon"><i class="fab fa-twitter-square"></i></a>
				          <a href="#" class="facebook icon"><i class="fab fa-facebook"></i></a>
				          <a href="#" class="instagram icon"><i class="fab fa-instagram"></i></a>
				          <a href="#" class="google-plus icon"><i class="fab fa-google-plus-g"></i></a>
				          <a href="#" class="linkedin icon"><i class="fab fa-linkedin"></i></a>
				        </div>
		        <div class="copyright">
		  				&copy; Copyright <strong><span>Delicious</span></strong>. All Rights Reserved
		        </div>
		        <div class="credits">
		          		Designed by <a href="#">GarimaThakre</a>
		        </div>
		      </div>
    </footer>
    
    
    <script src="script.js"></script>
</body>
    
</html>