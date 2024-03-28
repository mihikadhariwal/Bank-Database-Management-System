

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
/**
 * Servlet implementation class lrservlet
 */
@WebServlet("/lrservlet")
public class lrservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String requestId = request.getParameter("requestId");
        String status = request.getParameter("status");
        String email = request.getParameter("email");
        String amt = request.getParameter("amount");
		double amount =Double.parseDouble(amt);
		
        try {
        	 Class.forName("com.mysql.cj.jdbc.Driver");
             Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3307/banking?useSSL=false", "root", "mihika123");
             
          // Retrieve the existing loan status for the request ID
             PreparedStatement retrieveStatus = con.prepareStatement("SELECT status FROM loan_requests WHERE request_id = ?");
             retrieveStatus.setString(1, requestId);
             ResultSet rs = retrieveStatus.executeQuery();
             
             if(rs.next()) {
            	 String previousStatus = rs.getString("status");
            	 
            	 PreparedStatement pstmt = con.prepareStatement("UPDATE loan_requests SET status = ? WHERE request_id = ?");
                 pstmt.setString(1, status);
                 pstmt.setString(2, requestId);
                 pstmt.executeUpdate();
                 
                 if((previousStatus.equals("Rejected") && status.equals("Accepted")) || (previousStatus.equals("pending") && status.equals("Accepted")) ) {
                	 PreparedStatement pstmt1 = con.prepareStatement("UPDATE account SET balance = balance + ? WHERE cemail = ?");
                	 pstmt1.setDouble(1, amount);
                	 pstmt1.setString(2, email);
        			  pstmt1.executeUpdate();
                 }
                 else if(previousStatus.equals("Accepted") && status.equals("Rejected")) {
                	 PreparedStatement pstmt2 = con.prepareStatement("UPDATE account SET balance = balance - ? WHERE cemail = ?");
                     pstmt2.setDouble(1, amount);
                     pstmt2.setString(2, email);
                     pstmt2.executeUpdate();
                 }

             }
             
             
             
             
             
             
                                                                                                                                               
            
             con.close();
             
        } catch(Exception e) {
        	e.printStackTrace();
        }
        response.sendRedirect("adminwelcome.jsp");
	}

}
