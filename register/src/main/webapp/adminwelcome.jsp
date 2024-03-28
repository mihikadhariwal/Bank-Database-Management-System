<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
 
<!DOCTYPE html>
<html>

<head>
    <title>Welcome</title>
    <link rel="stylesheet" href="adminwelcome.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Comfortaa">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

    <script>

        function openmodal_c() {
            document.getElementById("modal_c").showModal();
        }

        function closeButtonc() {
            document.getElementById("modal_c").close();
        }

        function openmodal_a() {
            document.getElementById("modal_a").showModal();
        }

        function closeButtona() {
            document.getElementById("modal_a").close();
        }

        function openmodal_l() {
            document.getElementById("modal_l").showModal();
        }

        function closeButtonl() {
            document.getElementById("modal_l").close();
        }
        
        
        
        

    </script>

</head>

<body>

    <div class="container">
        <header>
        <% String firstName = (String) request.getAttribute("firstName");
   		if (firstName != null && !firstName.isEmpty()) {
	%>
    	<h1>Welcome, <%= firstName %>!</h1>
	<% } %>
           <h1>Welcome Admin!</h1>
           <div class="profile-container">
        <img src="images\pic4.jpg" alt="image" class="profile" width="100" height="auto">
        <div class="logout-option" id="logoutOption">
                        <a href="adminlogin.jsp" id="logoutLink">Logout</a>
                    </div>


                </div>
        </header>
        
            <div class="operations">
                <div class="customer" id="executeServletDiv" onclick="openmodal_c()">
                    View Customer Details
                    <i class="fas fa-user"></i>
                    

                </div>
                <div class="account" onclick="openmodal_a()">
                    View Account Details
                    <i class="fas fa-money-bill-wave"></i>

                </div>

                <div class="loanrequests" onclick="openmodal_l()">
                    View Loan Requests
                    <i class="fas fa-hand-holding-usd"></i>

                </div>

            </div>

        
    </div>

    <dialog class="modal_c" id="modal_c">
        
        <div class="heading">
            <h3>Customer Details</h3>
            <button class="close-button" onclick="closeButtonc()"><span class="close-icon">x</span></button>
        </div>
        
        <div class="table-container">
            <table id = "customer" border="1" >
                <thead>
                    <tr>
                        <th>Aadhar</th>
                        <th>First Name</th>
                        <th>Middle Name</th>
                        <th>Last Name</th>
                        <th>Date of Birth</th>
                        <th>Gender</th>
                        <th>Email</th>
                        <th>Password</th>
                        <th>Mobile</th>
                        <th>Address</th>
                        <th>City</th>
                        <th>State</th>
                        <th>PIN</th>
                        <th>Income</th>
                        <th>Occupation</th>
                        <!-- Add more columns as per your table -->
                    </tr>
                </thead>
                
                <tbody>
                
                <% 
                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3307/banking?useSSL=false", "root", "mihika123");
                    Statement statement = con.createStatement();
                    ResultSet rs = statement.executeQuery("SELECT * FROM customer");

                    while (rs.next()) {
            %>
            
            				<tr>
                                <td><%= rs.getString("aadhar") %></td>
                                <td><%= rs.getString("fname") %></td>
                                <td><%= rs.getString("mname") %></td>
                                <td><%= rs.getString("lname") %></td>
                                <td><%= rs.getString("dob") %></td>
                                <td><%= rs.getString("gender") %></td>
                                <td><%= rs.getString("email") %></td>
                                <td><%= rs.getString("password") %></td>
                                <td><%= rs.getString("mobile") %></td>
                                <td><%= rs.getString("address") %></td>
                                <td><%= rs.getString("city") %></td>
                                <td><%= rs.getString("state") %></td>
                                <td><%= rs.getString("pin") %></td>
                                <td><%= rs.getString("income") %></td>
                                <td><%= rs.getString("occupation") %></td>
                                <!-- Add more columns as per your table -->
                            </tr>
                            
                            <% 
                    }
                    rs.close();
                    statement.close();
                    con.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            %>
                
                                        
                </tbody>
          </table>
        </div>
   </dialog>

    <dialog class="modal_a" id="modal_a">

        <div class="heading">
            <h3>Account Details</h3>
            <button class="close-button" onclick="closeButtona()"><span class="close-icon">x</span></button>
        </div>
		
		<div class="table-container">
            <table id = "customer" border="1">
                <thead>
                    <tr>
                        <th>Account No.</th>
                        <th>Email</th>
                        <th>Account Type</th>
                        <th>Balance</th>
                        
                    </tr>
                </thead>
                
                <tbody>
                
                <% 
                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3307/banking?useSSL=false", "root", "mihika123");
                    Statement statement = con.createStatement();
                    ResultSet rs = statement.executeQuery("SELECT * FROM account");

                    while (rs.next()) {
            %>
            
            				<tr>
                                <td><%= rs.getString("accno") %></td>
                                <td><%= rs.getString("cemail") %></td>
                                <td><%= rs.getString("acctype") %></td>
                                <td><%= rs.getString("balance") %></td>
                                
                            </tr>
                            
                            <% 
                    }
                    rs.close();
                    statement.close();
                    con.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            %>
                </tbody>
            </table>
        </div>
    </dialog>

    <dialog class="modal_l" id="modal_l">

        <div class="heading">
            <h3>Loan Requests</h3>
            <button class="close-button" onclick="closeButtonl()"><span class="close-icon">x</span></button>
        </div>
        
        <div class="table-container">
            <table id = "customer" border="1">
                <thead>
                    <tr>
                        <th>Request ID</th>
                        <th>Email</th>
                        <th>Loan Amount</th>
                        <th>Duration</th>
                        <th>Loan Type </th>
                        <th> Status </th> 
                        <th>Action</th>                      
                    </tr>
                </thead>
                
                <tbody>
                
                <% 
                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3307/banking?useSSL=false", "root", "mihika123");
                    Statement statement = con.createStatement();
                    ResultSet rs = statement.executeQuery("SELECT * FROM loan_requests");

                    while (rs.next()) {
            %>
            
            				<tr>
                                <td><%= rs.getString("request_id") %></td>
                                <td><%= rs.getString("user_email") %></td>
                                <td><%= rs.getString("loan_amount") %></td>
                                <td><%= rs.getString("duration") %></td>
                                <td><%= rs.getString("loan_type") %></td>
                                <td><%= rs.getString("status") %></td>
                                
                                <td class="ar">
                       
                        		<form action="lrservlet" method="post" >
                            		<input type="hidden" name="requestId" value="<%= rs.getString("request_id") %>">
                            		<input type="hidden" name="email" value="<%= rs.getString("user_email") %>">
                            		<input type="hidden" name="amount" value="<%= rs.getString("loan_amount") %>">
                            		<input type="hidden" name="status" value="Accepted">
                            		<button type="submit" class="accept">Accept</button>
                        		</form>
                        		
                        		<form action="lrservlet" method="post" >
                            		<input type="hidden" name="requestId" value="<%= rs.getString("request_id") %>">
                            		<input type="hidden" name="email" value="<%= rs.getString("user_email") %>">
                            		<input type="hidden" name="amount" value="<%= rs.getString("loan_amount") %>">
                            		<input type="hidden" name="status" value="Rejected">
                            		<button type="submit" class="reject">Reject</button>
                        		</form>
                        		
                        		</td>
                                
                            </tr>
                            
                            <% 
                    }
                    rs.close();
                    statement.close();
                    con.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            %>
                </tbody>
            </table>
        </div>
    </dialog>
    
</body>

</html>