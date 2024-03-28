<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="ISO-8859-1">
        <title>register</title>
        <link rel="stylesheet" href="reg.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Comfortaa">
        <script src="https://kit.fontawesome.com/b59c55b5a0.js" crossorigin="anonymous"></script>
		<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
		<link rel="stylesheet" href="https://unpkg.com/sweetalert/dist/sweetalert.css">
        <script>
            function validateForm() {

                
                var dob = new Date(document.getElementById("dob").value); 
                var currentDate = new Date(); 

                if (dob >= currentDate) {
                    alert("Date of Birth should be before the current date.");
                    return false;
                }

                var mobile = document.getElementById("mobile").value;
                if (!/^\d{10}$/.test(mobile)) {
                    alert("Please enter a valid 10-digit mobile number.");
                    return false;
                }

               
                var pin = document.getElementById("pin").value;
                if (!/^\d{6}$/.test(pin)) {
                    alert("Please enter a valid 6-digit PIN.");
                    return false;
                }

                var city = document.getElementById("city").value;
                var state = document.getElementById("state").value;
                if (!/^[A-Za-z]+$/.test(city) || !/^[A-Za-z]+$/.test(state)) {
                    alert("Invalid Entry");
                    return false;
                }

               
                var password = document.getElementById("password").value;
                if (password.length < 8 || !/[a-z]/.test(password) || !/[A-Z]/.test(password)) {
                    alert("Password must contain at least 8 characters, including one lowercase and one uppercase letter.");
                    return false;
                }

                
                var pin = document.getElementById("aadhar").value;
                if (!/^\d{12}$/.test(pin)) {
                    alert("Please enter a valid 12-digit Aadhar number.");
                    return false;
                }

             
                return true;
            }
        </script>
		
		
		<script>
		document.addEventListener("DOMContentLoaded", function() {
	        var status = document.getElementById("status").value;
	        var accountNumber = document.getElementById("accountNumber").value;

	        if (status === "success" && accountNumber !== null && accountNumber !== "") {
	            swal("Congrats", "Account created successfully. Your account number is: " + accountNumber, "success");
	        } else if (status === "failed") {
	            swal("Oops", "Registration failed", "error");
	        }
	    });
		
		
		
		
		 
		    </script>

	


    </head>
    <body>
    
    	<input type="hidden" id="status" value="<%= request.getAttribute("status") %>">
    	<input type="hidden" id="accountNumber" value="<%= request.getAttribute("accountNumber") %>">

    	
        <div class="container">
            <h1>Registration</h1>
            <form action="registerservlet" method="post" onsubmit="return validateForm()">
                <!-- Replace 'submit_registration.php' with your form processing script -->
                <div class="form-group namee">
                    <div class="fname">
                        <label for="name">First Name:</label>
                        <input type="text" id="fname" name="fname" required>
                    </div>
                    <div class="mname">
                        <label for="name">Middle Name:</label>
                        <input type="text" id="mname" name="mname">
                    </div>
                    <div class="lname">
                        <label for="name">Last Name:</label>
                        <input type="text" id="lname" name="lname" required>
                    </div>
                </div>
                <div class="form-group">
                    <label for="dob">Date of Birth:</label>
                    <input type="date" id="dob" name="dob" required>
                </div>
                <div class="form-group">
                    <label>Gender:</label>
                    <div class="gender-options">
                        <input type="radio" id="male" name="gender" value="male">Male
                        <input type="radio" id="female" name="gender" value="female">Female
                        
                        
                    </div>
                </div>
                <div class="form-group">
                    <label for="email">Email:</label>
                    <input type="email" id="email" name="email" required>
                </div>
                <div class="form-group">
                    <label for="password">Password:</label>
                    <input type="password" id="password" name="password" required>
                </div>
                <div class="form-group">
                    <label for="mobile">Mobile:</label>
                    <input type="tel" id="mobile" name="mobile" required>
                </div>
                <div class="form-group">
                    <label for="address">Address:</label>
                    <textarea id="address" name="address" required></textarea>
                </div>

                <div class="form-group addr">
                    <div class="city">
                        <label for="city">City</label>
                        <input type="text" id="city" name="city" required>
                    </div>
                    <div class="state">
                        <label for="name">State</label>
                        <input type="text" id="state" name="state" required>
                    </div>
                    <div class="pin">
                        <label for="name">Pin</label>
                        <input type="text" id="pin" name="pin" required>
                    </div>
                </div>






                <div class="form-group">
                    <label for="income">Income:</label>
                    <select id="income" name="income" required style="width: 100%; padding: 8px; border-radius: 5px;
    border: 1px solid #ccc;">
                        <option value="">Select Income</option>
                        <option value="0-50000">0 - 50,000</option>
                        <option value="50001-100000">50,001 - 100,000</option>
                        <option value="100001-150000">100,001 - 150,000</option>
                        <option value="150001-200000">150,001 - 200,000</option>
                        <option value="200001+">200,001 and above</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="occupation">Occupation:</label>
                    <input type="text" id="occupation" name="occupation" required>
                </div>
                <div class="form-group">
                    <label for="aadhar">Aadhar Number:</label>
                    <input type="text" id="aadhar" name="aadhar" required>
                </div>
                <div class="buttons"> 
                    <button class="cust" type="submit">Register</button>
                    <button class="admin"><a href="regadmin.jsp" style="text-decoration: none; color: white;">Register as Admin</a> </button>
                </div>
            </form>
        </div>

    </body>
</html>