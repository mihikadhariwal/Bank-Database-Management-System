

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Random;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class regadminservlet
 */
@WebServlet("/regadminservlet")
public class regadminservlet extends HttpServlet {
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
		String designation = request.getParameter("designation");
		String aadhar = request.getParameter("aadhar");
		RequestDispatcher dispatcher =null;
		Connection con=null;
		
//		Random random = new Random();
//        int pincode = 100000 + random.nextInt(900000);
//        
//        request.setAttribute("pincode", String.valueOf(pincode));
//        
        try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3307/banking?useSSL=false", "root", "mihika123");
			PreparedStatement pst = con.prepareStatement("insert into admin values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
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
			pst.setString(15, designation);
			
			int rowCount = pst.executeUpdate();
			dispatcher =request.getRequestDispatcher("regadmin.jsp");
			
			if(rowCount >0) {
				request.setAttribute("status", "success");
			}
			else {
				request.setAttribute("status", "failed");
			}
			
			dispatcher.forward(request, response);
			
			
//			PreparedStatement accountPst = con.prepareStatement("INSERT INTO admin_account (pincode, aemail) VALUES (?, ?)");
//		    
//		    accountPst.setInt(1, pincode); 
//		    accountPst.setString(2, email); 
//		    
//		    accountPst.executeUpdate();
			
			
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
