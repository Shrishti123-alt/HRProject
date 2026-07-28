package com;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 * Servlet implementation class UserUpdatePassword
 */
@WebServlet("/UserUpdatePassword")
public class UserUpdatePassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserUpdatePassword() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
HttpSession session = request.getSession(false);
		
		int id = (Integer) session.getAttribute("id");
		
		String cs =request.getParameter("currentpassword"); 
		String np =request.getParameter("newpassword"); 
		String cnp =request.getParameter("confirmpassword"); 
		
		try {

			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/HR_Database","root","shadow@123");
			PreparedStatement ps = con.prepareStatement("SELECT * FROM  user_register WHERE id=? AND password=?");
			
			ps.setInt(1, id);
			ps.setString(2, cs);
			
			ResultSet rs = ps.executeQuery();
			
			if(rs.next()) {
				
               if(np.equals(cnp)) {
   				PreparedStatement ps1 = con.prepareStatement("UPDATE user_register SET password=? WHERE id=?");
   				
   				ps1.setString(1, np);
   				ps1.setInt(2, id);

            	   ps1.executeUpdate();
            	   
            	   response.sendRedirect("UserDashboard.jsp");
               } else {
               
               response.getWriter().println("<script>");
               response.getWriter().println("alert('New password and confirm password do not match');");
               response.getWriter().println("window.location='UserChangePassword.jsp';");
               response.getWriter().println("</script>");
			}
		}
			else {
				 response.getWriter().println("<script>");
	               response.getWriter().println("alert('Current password is incorrect');");
	               response.getWriter().println("window.location='UserChangePassword.jsp';");
	               response.getWriter().println("</script>");
				
			}
		}
		catch(Exception e) {
			e.printStackTrace();		}
		
	}

}
