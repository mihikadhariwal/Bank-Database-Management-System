

import java.io.IOException;
import java.io.PrintWriter;
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
 * Servlet implementation class depositServlet
 */
@WebServlet("/depositServlet")
public class depositServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String amt = request.getParameter("deposit");
		double amount =Double.parseDouble(amt);
		
//		 String userEmail = "m@gmail.com";
//		String userEmail = (String) request.getAttribute("email");
		String userEmail = request.getParameter("email");
		 
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3307/banking?useSSL=false", "root", "mihika123");
			 PreparedStatement pst = con.prepareStatement("UPDATE account SET balance = balance + ? WHERE cemail = ?");
			 pst.setDouble(1, amount);
			 pst.setString(2, userEmail);
			 int rowsUpdated = pst.executeUpdate(); //stores number of rows affected when the query is executed
			
			
			 if(rowsUpdated>0) {
				 PreparedStatement selectStmt = con.prepareStatement("SELECT balance FROM account WHERE email = ?");
			        selectStmt.setString(1, userEmail);
			        ResultSet rs = selectStmt.executeQuery();
			        
			        if (rs.next()) {
			            double updatedBalance = rs.getDouble("balance");
			            request.setAttribute("updatedBalance", updatedBalance);
			            RequestDispatcher dispatcher = request.getRequestDispatcher("welcome.jsp");
			            dispatcher.forward(request, response);
			            
			            String successMessage = "Deposit successful!"; // Modify this message as needed
			            String script = "<script>parent.showSuccessMessage('" + successMessage + "');</script>";
			            response.setContentType("text/html");
			            response.getWriter().write(script);
			        }
			        
			       
			 }
			 
			
			 con.close();
//			 RequestDispatcher dispatcherw =request.getRequestDispatcher("welcome.jsp");
//			 dispatcherw.forward(request, response);

			 
		} catch(Exception e) {
			e.printStackTrace();
		}
	}

}
