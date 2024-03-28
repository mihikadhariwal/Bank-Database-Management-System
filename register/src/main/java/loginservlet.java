

import java.io.IOException;
import java.sql.DriverManager;
import java.sql.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class loginservlet
 */
@WebServlet("/loginservlet")
public class loginservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("email");
		String pwd = request.getParameter("password");
		
		
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3307/banking?useSSL=false", "root", "mihika123");
			PreparedStatement pst = con.prepareStatement("select * from customer where email = ? and password=?");
			pst.setString(1, email);
			pst.setString(2, pwd);
			
			
			
			ResultSet rs = pst.executeQuery();
			
			if(rs.next()) {

				String userEmail  = rs.getString("email");
				request.setAttribute("email", userEmail ); 
				String firstName = rs.getString("fname");
                request.setAttribute("firstName", firstName);
                
                double accountBalance = getBalancefromDatabase(email);
                
                request.setAttribute("balance", accountBalance);
                
                RequestDispatcher dispatcher = request.getRequestDispatcher("welcome.jsp");
                dispatcher.forward(request, response);
                								
							}
			else {
				
				request.setAttribute("errorMessage", "Invalid credentials. Please try again.");
			
				RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
				dispatcher.forward(request, response);

			}
			} catch(Exception e) {
				e.printStackTrace();
		}
	}
	
	protected double getBalancefromDatabase(String userEmail) {
		double balance = 0.0;
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3307/banking?useSSL=false", "root", "mihika123");
			PreparedStatement pst = con.prepareStatement("select * from account where cemail = ?");
			pst.setString(1, userEmail);
			
			 ResultSet resultSet = pst.executeQuery();
		        if(resultSet.next()) {
		            balance = resultSet.getDouble("balance");
		        }
		        resultSet.close();
		        pst.close();
		        con.close();
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return balance;
	}

}
