package com;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

/**
 * Servlet implementation class RegistrationServlet
 */
@WebServlet("/register")
public class RegistrationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegistrationServlet() {
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
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		
		
		String n = request.getParameter("name");
		String em = request.getParameter("email");
		String m = request.getParameter("mobile");
		String dob = request.getParameter("dob");
		String p = request.getParameter("pass");
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/HR_Database","root","shadow@123");
			PreparedStatement ps = con.prepareStatement( "insert into hr_register(full_name,email,mobile_no,dob,password) values(?,?,?,?,?)");
			
			ps.setString(1, n);
			ps.setString(2, em);
			ps.setString(3, m);
			ps.setString(4, dob);
			ps.setString(5, p);
			
			int result = ps.executeUpdate();
			
			response.sendRedirect("Login.html");
			
			
		}
		catch(Exception e) {
			out.println(e.getMessage());
			
		}
		
		
	}

}
