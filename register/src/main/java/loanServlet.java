

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class loanServlet
 */
@WebServlet("/loanServlet")
public class loanServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userEmail = request.getParameter("email");
		
		double loanAmount = Double.parseDouble(request.getParameter("loan"));
        int duration = Integer.parseInt(request.getParameter("duration"));
        String loanType = request.getParameter("loanType");
        
        try {
        	Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3307/banking?useSSL=false", "root", "mihika123");
			 
			PreparedStatement pst = con.prepareStatement("INSERT INTO loan_requests (user_email, loan_amount, duration, loan_type, status) VALUES (?, ?, ?, ?, ?)");
            pst.setString(1, userEmail);
            pst.setDouble(2, loanAmount);
            pst.setInt(3, duration);
            pst.setString(4, loanType);
            pst.setString(5, "pending");
            pst.executeUpdate();
            con.close();
        } catch (Exception e) {
        	e.printStackTrace();
        }
	}

}
