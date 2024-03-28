

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

/**
 * Servlet implementation class withdrawServlet
 */
@WebServlet("/withdrawServlet")
public class withdrawServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String amt = request.getParameter("withdraw");
		double amount =Double.parseDouble(amt);
		
//		 String userEmail = "m@gmail.com";
//		String userEmail = (String) request.getAttribute("email");
		String userEmail = request.getParameter("email");
		 
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3307/banking?useSSL=false", "root", "mihika123");
			 
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
	                        request.setAttribute("updatedBalance", updatedBalance);
	                        RequestDispatcher dispatcher = request.getRequestDispatcher("welcome.jsp");
	                        dispatcher.forward(request, response);

	                        String successMessage = "Withdraw successful!"; // Modify this message as needed
	                        String script = "<script>parent.showSuccessMessage('" + successMessage + "');</script>";
	                        response.setContentType("text/html");
	                        response.getWriter().write(script);
	                    }
	                } else {
	                    // Insufficient funds or invalid amount - handle accordingly
	                    String errorMessage = "Insufficient funds";
	                    String script = "<script>parent.showerrorMessage('" + errorMessage + "');</script>";
                        response.setContentType("text/html");
                        response.getWriter().write(script);
	                }
	            }

	            con.close();

	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	    }
	}
