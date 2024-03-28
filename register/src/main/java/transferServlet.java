import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/transferServlet")
public class transferServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String amt = request.getParameter("transfer");
        double amount = Double.parseDouble(amt);

        String userEmail = request.getParameter("email");

        String accno = request.getParameter("accno");
        
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3307/banking?useSSL=false", "root", "mihika123");

            PreparedStatement verifyAccountStmt = con.prepareStatement("SELECT * FROM account WHERE accno = ?");
            verifyAccountStmt.setString(1, accno);
            ResultSet accountResult = verifyAccountStmt.executeQuery();

            if (accountResult.next()) {
                // Account number exists in the account table
                PreparedStatement selectStmt = con.prepareStatement("SELECT balance FROM account WHERE cemail = ?");
                selectStmt.setString(1, userEmail);
                ResultSet rs = selectStmt.executeQuery();

                if (rs.next()) {
                    double currentBalance = rs.getDouble("balance");

                    if (amount > 0 && amount <= currentBalance) {
                        PreparedStatement pst = con.prepareStatement("UPDATE account SET balance = balance - ? WHERE cemail = ?");
                        pst.setDouble(1, amount);
                        pst.setString(2, userEmail);
                        int rowsUpdated = pst.executeUpdate();

                        if (rowsUpdated > 0) {
                            double updatedBalance = currentBalance - amount;


                            PreparedStatement pst1 = con.prepareStatement("UPDATE account SET balance = balance + ? WHERE accno = ?");
                            pst1.setDouble(1, amount);
                            pst1.setString(2, accno);
                            int rowsUpdated1 = pst1.executeUpdate();

                            String successMessage = "transfer successful!";
                            
                            int errorCode = 200; // Replace 404 with your specific error code

                        	request.setAttribute("errorCode", errorCode);

                        }
                    } else {
                        // Insufficient funds or invalid amount - handle accordingly
                        String errorMessage = "Insufficient funds";
                        int errorCode = 400; 

                    	request.setAttribute("errorCode", errorCode);

                   
                    }
                }
            } else {
                // Account number does not exist in the account table
            	int errorCode = 404; // Replace 404 with your specific error code

            	request.setAttribute("errorCode", errorCode);

            	
               
            }
            RequestDispatcher dispatcher = request.getRequestDispatcher("welcome.jsp");
        	dispatcher.forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
