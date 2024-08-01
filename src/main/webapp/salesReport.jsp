<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Sales Report</title>
<%@ include file="cdn.jsp" %>
 <link href="style.css" rel="stylesheet" >
 <%@ page import="java.sql.*,com.database.DBConnection" %>
</head>
<body>
		 <header id="header" class="fixed-top">
        <nav class="navbar navbar-inverse">
            <div class="container-fluid">
                <div class="navbar-header">
                    <a class="navbar-brand" href="admin.jsp">Admin Panel</a>
                </div>
                <ul class="nav navbar-nav">
                    <li><a class="menu-btn" href="order.jsp">Order</a></li>
                    <li><a class="menu-btn" href="menu.jsp">Menu</a></li>
                    <li><a class="menu-btn" href="salesReport.jsp">Report</a></li>
                </ul>
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="login.jsp"><span class="signin-signup-btn">SignUp/SignIn</span></a></li>
                    <li><a href="logout.jsp"><span><i class="fas fa-sign-out-alt"></i></span></a></li>
                </ul>
            </div>
        </nav>
    </header>  
        
    <h1 style="font-size:30px;font-family:'Times New Roman', Times, serif; padding:20px;">Sales Report</h1>
    <div class="container">
        <div class="row">
            <div class="col-md-4"></div>
            <div class="col-md-4">
                <fieldset>
                    <form action="SalesReportServlet" method="post">
                        <label for="startDate">Start Date:</label><br>
                        <input type="date" id="startDate" name="startDate" required><br>
                        <label for="endDate">End Date:</label><br>
                        <input type="date" id="endDate" name="endDate" required><br><br>
                        <button type="submit" class="btn btn-success">Generate Report</button><br><br>
                    </form>
                </fieldset>
            </div>
            <div class="col-md-4"></div>
        </div>
        <div class="row">
            <%
                Double totalSales = (Double) request.getAttribute("totalSales");
                Integer orderCount = (Integer) request.getAttribute("orderCount");
                String startDate = (String) request.getAttribute("startDate");
                String endDate = (String) request.getAttribute("endDate");
                if (totalSales != null && orderCount != null) {
                    %>
                    <p style="font-size:20px;font-family:'Times New Roman', Times, serif;">Total Sales: <%= totalSales %></p>
                    <p style="font-size:20px;font-family:'Times New Roman', Times, serif;">Number of Orders: <%= orderCount %></p><br><br>
                    <table>
                        <thead>
                            <tr>
                                <th>Order ID</th>
                                <th>Date</th>
                                <th>Total Amount</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                Connection con = null;
                                PreparedStatement ps = null;
                                ResultSet rs = null;
                                try {
                                    con = DBConnection.takeConnection();
                                    String query = "select * from orders where orderdate between ? and ?";
                                    ps = con.prepareStatement(query);
                                    ps.setString(1, startDate);
                                    ps.setString(2, endDate);
                                    rs = ps.executeQuery();

                           			while (rs.next()) {
                            %>
                                <tr>
                                    <td><%= rs.getInt(1) %></td>
                                    <td><%= rs.getTimestamp(5).toLocalDateTime().toLocalDate() %></td>
                                    <td><%= rs.getDouble(4) %></td>
                                </tr>
                            <%
                                }
                            } catch (SQLException e) {
                                e.printStackTrace();
                            } finally {
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
                <%
                }
                %>
            </div>
        </div>

</body>
</html>