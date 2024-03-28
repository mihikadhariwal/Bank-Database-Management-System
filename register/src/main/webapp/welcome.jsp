<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   
<!DOCTYPE html>
<html>
    <head>
        <title>Welcome</title>
        <link rel="stylesheet" href="welcome.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Comfortaa">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

        <script>
        
       
     
    
        
        let principal = document.getElementById('principal1');
   	  let rate = document.getElementById('rate1');
   	 let time = document.getElementById('time1');

 			function calculateInterest(event) {
         	
     	    event.preventDefault();
     	    console.log("Calculate Interest function called!");

         }
 			function test(){
 				  //console.log(`Principal: ${principal}, Rate: ${rate}, Time: ${time}`);
 				console.log(document.getElementById('principal1').value);
 				console.log(document.getElementById('rate1').value);
 				console.log(document.getElementById('time1').value);
 				
 			    console.log(document.getElementById('principal1').value * document.getElementById('rate1').value * document.getElementById('time1').value/100);
 			    
 			   let si = document.getElementById('principal1').value * document.getElementById('rate1').value * document.getElementById('time1').value/100;
			    console.log(si);
				
			    let displayText = "Simple Interest: " + si;
 		         document.getElementById('result1').innerText=displayText;
 		          //  resultElement.innerText = `Simple Interest: ${simpleInterest}`;
 		             
 		            
 		           // console.log(`Simple Interest: ${simpleInterest}`);
 		     	   
 			}

                function openmodal_d() {
                        document.getElementById("modal_d").showModal();
                    }

                    function closeButtond() {
                        document.getElementById("modal_d").close();
                    }

                    function openmodal_w() {
                            document.getElementById("modal_w").showModal();
                        }

                        function closeButtonw() {
                            document.getElementById("modal_w").close();
                        }

                         function openmodal_t() {
                                document.getElementById("modal_t").showModal();
                            }

                            function closeButtont() {
                                document.getElementById("modal_t").close();
                            }

                             function openmodal_l() {
                                    document.getElementById("modal_l").showModal();
                                }

                                function closeButtonl() {
                                    document.getElementById("modal_l").close();
                                }
                                
                                function submitDeposit(event) {
                                    //event.preventDefault(); // Prevent form submission
                                    var depositAmount = parseFloat(document.getElementById('deposit').value);
                                    console.log(depositAmount);
                                    // Get deposit amount from input
									if(!isNaN(depositAmount)){
										
									
                                    // Assuming deposit successful
                                    var successMessage = "Deposit successful!"; // Modify this message as needed
                                    
                                    // Display success message inside the dialog
                                    document.getElementById('successMessage').innerText = successMessage;
                                    document.getElementById('successMessage').style.textAlign = 'center';

                                    document.getElementById('depositSuccess').style.display = 'block';
                                    
                                 // Simulated successful deposit amount
                                    
                                    // Update the displayed balance by adding the deposit amount
                                    var currentBalance = parseFloat(document.getElementById('balance').innerText);
                                    var updatedBalance = currentBalance + depositAmount;

                                    // Display updated balance on the page
                                    document.getElementById('balance').innerText = updatedBalance.toFixed(2);
                                    // Show the updated balance with two decimal places
									}
                                }

                                function closeButtond() {
                                    document.getElementById('modal_d').close();
                                }
                                
                                function submitWithdraw(event) {
                                    //event.preventDefault(); // Prevent form submission for testing
                                    console.log("Withdrawal function called!");

                                    // Assuming withdrawal successful
                                    var successMessagew = "Withdrawal successful!"; // Modify this message as needed

                                    var withdrawAmount = parseFloat(document.getElementById('withdraw').value); // Get withdrawal amount from input
                                    var currentBalance = parseFloat(document.getElementById('balance').innerText);
                                    
                                   

                                    if ((withdrawAmount <= currentBalance && withdrawAmount > 0) ) {
                                        var updatedBalance = currentBalance - withdrawAmount;
                                        document.getElementById('successMessagew').innerText = successMessagew;
                                        document.getElementById('successMessagew').style.textAlign = 'center';

                                        document.getElementById('withdrawSuccess').style.display = 'block';

                                        // Update the displayed balance on the page
                                        document.getElementById('balance').innerText = updatedBalance.toFixed(2); // Show the updated balance with two decimal places
                                    } else {
                                        // Handle insufficient funds or invalid amount
                                        var errorMessage = "Insufficient funds";
                                        // Display error message or handle it accordingly
                                         document.getElementById('successMessagew').innerText = errorMessage;
                                        document.getElementById('successMessagew').style.textAlign = 'center';

                                        document.getElementById('withdrawSuccess').style.display = 'block';
                                        console.log(errorMessage);
                                    }
                                }
                                
                                
                                function submitTransfer(event) {
                                	 var transferAmount = parseFloat(document.getElementById('transfer').value); // Get withdrawal amount from input
                                     var currentBalance = parseFloat(document.getElementById('balance').innerText);
                                     var accountNo = parseFloat(document.getElementById('accno').value);
                                      
                                 		
                                 	
                                     var Message = "Transfer Successful!";
                         			if (transferAmount > 0 && transferAmount <= currentBalance){
                                     	 var updatedBalance = currentBalance - transferAmount;
                                          
                                          document.getElementById('successMessaget').innerText = Message;
                                        document.getElementById('successMessaget').style.textAlign = 'center';

                                          document.getElementById('transferSuccess').style.display = 'block';
                         				
                                          document.getElementById('balance').innerText = updatedBalance.toFixed(2);
                                          
                         			} 
                                 	
                         			else if(transferAmount > currentBalance){
                         				document.getElementById('successMessaget').innerText = "Insufficient Funds";
                                        document.getElementById('successMessaget').style.textAlign = 'center';

                                          document.getElementById('transferSuccess').style.display = 'block';
                         				
                         			}
                         			
                                }
                                
                               
                                
                               
                               
                                
                                function submitLoan(event) {
                                	
                                	var loan = parseFloat(document.getElementById('loan').value);
                                	var loand = parseFloat(document.getElementById('loand').value);
                                	
                                	if(!isNaN(loan) && !isNaN(loand)){
                                	
                                    //event.preventDefault(); // Prevent form submission for testing
                                    console.log("Loan function called!");

                                    // Assuming withdrawal successful
                                    var successMessagel = "Loan Requested"; // Modify this message as needed
                                    
                                    
                                       
                                        document.getElementById('successMessagel').innerText = successMessagel;
                                        document.getElementById('successMessagel').style.textAlign = 'center';

                                        document.getElementById('loanSuccess').style.display = 'block';
								
                                	}
                                       
                                }

                               
                                
                              //console.log("e: " + errorCodeValue);
                                
                                 
                            
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

       
       
        		<div class="profile-container">
                <img src="images\pic4.jpg" alt="image" class="profile" width="100" height="auto">
                <div class="logout-option" id="logoutOption">
                        <a href="login.jsp" id="logoutLink">Logout</a>
                    </div>


                </div>
            </header>
            <main>
                <div class="operations">
                    <div class="deposit" onclick="openmodal_d()">
                        Deposit
                        <i class="fas fa-coins"></i>
                        
                    </div>
                    <div class="withdraw" onclick="openmodal_w()">
                        Withdraw
                        <i class="fas fa-money-bill-wave"></i>
                        
                    </div>
                    
                    <div class="transfer" onclick="openmodal_t()">
                        Transfer
                        <i class="fas fa-exchange-alt"></i>
                        
                    </div>
                    <div class="loan" onclick="openmodal_l()">
                        Loan
                        <i class="fas fa-hand-holding-usd"></i>
                        
                    </div>
                </div>
                <div class="account">
                
                	<h1 style="padding: 10px;">Balance:</h1>
                    <h2 style="text-align: center; padding: 10px">Rs <span id="balance"> <%= request.getAttribute("balance") %></span></h2>

                    
                    <div class="sic">
                        <h3>Simple Interest Calculator</h3>

                        <div class="calculator">
                        <form id="interestForm" onsubmit="calculateInterest(event)">
                            <label for="principal1">Principal amount:</label>
                            <input type="number" id="principal1" name="principal" placeholder="Enter principal amount" required>
                        
                            <label for="rate1">Annual interest rate (%):</label>
                            <input type="number" id="rate1" name="rate" placeholder="Enter annual interest rate" required>
                        
                            <label for="time1">Time period (years):</label>
                            <input type="number" id="time1" name="time" placeholder="Enter time in years" required>
                        
                            <button  type="submit" onclick = "test()">Calculate</button>
                        </form>
                            <div class="result">
                                <p id="result1"></p>
                            </div>
                        </div>
                    </div>
                    
                </div>
            </main>
        </div>

        <dialog class="modal_d" id="modal_d">

            
                <div class="heading">
                    <h3>Deposit</h3>
                    <button class="close-button" onclick="closeButtond()"><span class="close-icon">x</span></button>
                </div>
                <div class="main">
                <form id="depositForm" action="depositServlet" method="post" target="hiddenFrame">
                    <label for="deposit">Deposit Amount:</label>
                    <input type="number" id="deposit" name="deposit" placeholder="Enter amount to be deposited" required>
					<input type="hidden" name="email" value="<%= request.getAttribute("email") %>">
                    <button type="submit" onclick="submitDeposit(event)">Deposit</button>
                    <div class="success" id="depositSuccess" style="display: none;" >
                        <p id="successMessage" ></p>
                    </div>
                    </form>
                     <iframe id="hiddenFrame" name="hiddenFrame" style="display: none;"></iframe>
                </div>
            
        </dialog>

        <dialog class="modal_w" id="modal_w">
        
        
            <div class="heading">
                <h3>Withdraw</h3>
                <button class="close-button" onclick="closeButtonw()"><span class="close-icon">x</span></button>
            </div>
            <div class="main">
            <form id="withdrawForm" action="withdrawServlet" method="post" target="hiddenFrame">
                <label for="withdraw">Withdraw Amount:</label>
                <input type="number" id="withdraw" name="withdraw" placeholder="Enter amount to be withdrawn" required>
                <input type="hidden" name="email" value="<%= request.getAttribute("email") %>">
        
                <button type="submit" onclick="submitWithdraw(event)">Withdraw</button>
                <div class="success" id="withdrawSuccess" style="display: none;">
                    <p id="successMessagew"></p>
                </div>
                </form>
                     <iframe id="hiddenFrame" name="hiddenFrame" style="display: none;"></iframe>
            </div>
        
        </dialog>

        <dialog class="modal_t" id="modal_t">
        
        
            <div class="heading">
                <h3>Transfer</h3>
                
                <button class="close-button" onclick="closeButtont()"><span class="close-icon">x</span></button>
            </div>
            <div class="main">
            <form id="transferForm" action="transferServlet" method="post" target="hiddenFrame">
                <label for="transfer">Transfer Amount:</label>
                <input type="number" id="transfer" name="transfer" placeholder="Enter amount to be transferred" required>
				<input type="hidden" name="email"  value="<%= request.getAttribute("email") %>">
        		
                <label for="transfer">Account No:</label>
                <input type="number" id="accno" name="accno" placeholder="Enter account number" required>
				
        		<button type="submit" onclick = "submitTransfer(event); ">Transfer</button>
        		
        		<div class="success" id="transferSuccess" >
                    <p id="successMessaget"></p>
                </div>
        		
                </form>
                 
                

                
                <iframe id="hiddenFrame" name="hiddenFrame" style="display: none;"></iframe>
            </div>
        
        </dialog>
		
        <dialog class="modal_l" id="modal_l">
        
        
            <div class="heading">
                <h3>Loan</h3>
                <button class="close-button" onclick="closeButtonl()"><span class="close-icon">x</span></button>
            </div>
            <div class="main">
            <form id="loanForm" action="loanServlet" method="post" target="hiddenFrame">
                <label for="loan">Loan Amount:</label>
                <input type="number" id="loan" name="loan" placeholder="Enter amount to be loaned" required>
                <input type="hidden" name="email" value="<%= request.getAttribute("email") %>">
        
                <label for="loan">Duration</label>
                <input type="number" id="loand" name="duration" placeholder="Enter duration (in years)" required>

                <label for="loan">Select loan type:</label>
                <select id="loan1" name="loanType"  required>
                    <option value="student" style="color: grey;">Student Loan</option>
                    <option value="personal" style="color: grey;">Personal Loan</option>
                    <option value="home" style="color: grey;">Home</option>
                </select>
                <button type="submit" onclick="submitLoan(event)">Request Loan</button>
                <div class="success" id="loanSuccess" style="display: none;">
                    <p id="successMessagel"></p>
                </div>
                </form>
                <iframe id="hiddenFrame" name="hiddenFrame" style="display: none;"></iframe>
            </div>
        
        </dialog>
        
         <script>
       
         
            
</script>
    </body>

</html>