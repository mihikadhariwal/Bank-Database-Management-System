<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>

<head>
    <title>Login Page</title>
    <link rel="stylesheet" href="adminlogin.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Comfortaa">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    
</head>

<body>
    <div class="container">
        <div class="content">
            <h1>Admin Login</h1>
            <h3>Hello! Let's get started</h3>
            <p class="login">Login to your account</p>
            <form id="loginForm" method="post" action = "adminloginservlet">
            <div class="form-group">
                <i class="fas fa-envelope"></i>
                <input type="email" id="email" name="email" placeholder="Email" required>
            </div>
            <div class="form-group">
                <i class="fas fa-lock"></i>
                <input type="password" id="password" name="password" placeholder="Password" required>
            </div>
            
           
                
            <button type="submit">Login</button>
            </form>
            
            <!-- Display error message here -->
        <% String errorMessage = (String) request.getAttribute("errorMessage");
           if (errorMessage != null && !errorMessage.isEmpty()) { %>
               <p style="color: red;"><%= errorMessage %></p>
        <% } %>
            
            
            
            
            <p class="question">Don't have an account? <span> <a href="regadmin.jsp">SIGN UP</a></span> here</p>
            <p class="cust">Login to <span><a href="login.jsp">CUSTOMER</a></span> account</p>
        </div>
        <div class="image">
            <img src="images\pic5.jpg" alt="image" width="700" height="auto" style="margin-right: 50px;">
        </div>
    </div>
     
</body>
    
</html>