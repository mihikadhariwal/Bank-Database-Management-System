

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
 * Servlet implementation class adminloginservlet
 */
@WebServlet("/adminloginservlet")
public class adminloginservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		
		
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3307/banking?useSSL=false", "root", "mihika123");
			PreparedStatement pst = con.prepareStatement("select * from admin where email = ? and password = ?");
			pst.setString(1, email);
			pst.setString(2, password);
			
			
			
			ResultSet rs = pst.executeQuery();
			
			if(rs.next()) {
//				response.sendRedirect("adminwelcome.jsp");
//				String userEmail  = rs.getString("email");
//				request.setAttribute("email", userEmail ); // Set the email as a request attribute
				
//				PreparedStatement pstt = con.prepareStatement("select * from admin where email = ?");
//				pstt.setString(1, email);
//				
//				ResultSet rss = pstt.executeQuery();
//				
				String firstName = rs.getString("fname");
                request.setAttribute("firstName", firstName);
               
                
                RequestDispatcher dispatcher = request.getRequestDispatcher("adminwelcome.jsp");
                dispatcher.forward(request, response);
                								
							}
			else {
				// In your servlet code after verifying invalid credentials
				request.setAttribute("errorMessage", "Invalid credentials. Please try again.");
				// Forward back to the login page
				RequestDispatcher dispatcher = request.getRequestDispatcher("adminlogin.jsp");
				dispatcher.forward(request, response);

			}
			} catch(Exception e) {
				e.printStackTrace();
		}
	}

}
