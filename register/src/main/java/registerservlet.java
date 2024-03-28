

import java.io.IOException;
import java.sql.*;
import java.util.Random;
import java.io.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class registerservlet
 */
@WebServlet("/registerservlet")
public class registerservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String fname = request.getParameter("fname");
		String mname = request.getParameter("mname");
		String lname = request.getParameter("lname");
		String dob = request.getParameter("dob");
		String gender = request.getParameter("gender");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String mobile = request.getParameter("mobile");
		String address = request.getParameter("address");
		String city = request.getParameter("city");
		String state = request.getParameter("state");
		String pin = request.getParameter("pin");
		String income = request.getParameter("income");
		String occupation = request.getParameter("occupation");
		String aadhar = request.getParameter("aadhar");
		RequestDispatcher dispatcher =null;
		Connection con=null;

		Random random = new Random();
        int accountNumber = 100000 + random.nextInt(900000);
        
        request.setAttribute("accountNumber", String.valueOf(accountNumber));

		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3307/banking?useSSL=false", "root", "mihika123");
			PreparedStatement pst = con.prepareStatement("insert into customer values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
			pst.setString(1, aadhar);
			pst.setString(2, fname);
			pst.setString(3, mname);
			pst.setString(4, lname);
			pst.setString(5, dob);
			pst.setString(6, gender);
			pst.setString(7, email);
			pst.setString(8, password);
			pst.setString(9, mobile);
			pst.setString(10, address);
			pst.setString(11, city);
			pst.setString(12, state);
			pst.setString(13, pin);
			pst.setString(14, income);
			pst.setString(15, occupation);
			
			int rowCount = pst.executeUpdate();
			dispatcher =request.getRequestDispatcher("register.jsp");
			
			if(rowCount >0) {
				request.setAttribute("status", "success");
			}
			else {
				request.setAttribute("status", "failed");
			}
			
			dispatcher.forward(request, response);
			
			
			PreparedStatement accountPst = con.prepareStatement("INSERT INTO account (accno, cemail, acctype, balance) VALUES (?, ?, ?, ?)");
		    
		    accountPst.setInt(1, accountNumber); 
		    accountPst.setString(2, email); 
		    accountPst.setString(3, "Savings Account"); 
		    accountPst.setDouble(4, 0.0); 
		    
		    accountPst.executeUpdate();
			
			
		} catch (ClassNotFoundException e) {
		    e.printStackTrace();
		    
		} catch (SQLException e) {
		    e.printStackTrace(); 
		}finally {
			try {
		        if (con != null) {
		            con.close();
		        }
		    } catch (SQLException e) {
		        e.printStackTrace();
		    }
		}

		

		
	}

}
