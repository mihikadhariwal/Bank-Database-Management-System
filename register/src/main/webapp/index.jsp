<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

    <!DOCTYPE html>
<html>
    <head>
        <title>Home</title>
        <link rel="stylesheet" href="home.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Comfortaa">
        <script src="https://kit.fontawesome.com/b59c55b5a0.js" crossorigin="anonymous"></script>

        <script>
            function redirectToPage() {
                // Redirect to another HTML page
                window.location.href = "register.jsp";
            }

            function redirectToPageLogin(){
                window.location.href = "login.jsp";
            }
        </script>
    </head>
    <body>
        <!--Navigation-->
        
            <div class="container-main">
            <div class=" container-nav">
                <div class="website-title">
                    <p><span class="head">PayCom.</span></p>
                </div>
                <nav>
                    <ul>
                        <li><a href="index.jsp" class="current">Home</a></li>
                        <li><a href="#">About</a></li>
                        <li><a href="#">Features</a></li>
                        <li><a href="#">Contact Us</a></li>
                        
                    </ul>
                </nav>
            </div>

            <div class="content">
                <div class="text">
                    <h1 class="top-h1">Fast, Secure</h1>
                    <h1>Reliable Payments</h1>
                    <p>Empowering your financial journey with our user-friendly banking app, tailored to simplify transactions and elevate
                        your banking experience.</p>
                        
                    <button class="registerrr" onclick="redirectToPage()">Register</button>
                    <button class="loginnn" onclick="redirectToPageLogin()">Login</button>
                    
                </div>
                <div class="image">
                    <img src="images\pic1.png" alt="image" width="700" height="auto">
                </div>
                

            </div>
        </div>
    </body>
</html>