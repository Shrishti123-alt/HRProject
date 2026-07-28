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
import java.sql.ResultSet;

/**
 * Servlet implementation class UserRegistrationServlet
 */
@WebServlet("/UserRegister")
public class UserRegistrationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserRegistrationServlet() {
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
		String mo= request.getParameter("mobile");
		String dob = request.getParameter("dob");
		String g = request.getParameter("gender");
		String qua= request.getParameter("qualification");
		String pass = request.getParameter("pass");
		String ex = request.getParameter("exp");
		String add = request.getParameter("address");
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/HR_Database","root","shadow@123");
			
			PreparedStatement ps = con.prepareStatement("INSERT INTO user_register (full_name,email,mobile_no,dob,gender,qualification,password,experience,address) VALUES(?,?,?,?,?,?,?,?,?) ");
			ps.setString(1, n);
			ps.setString(2, em);
			ps.setString(3, mo);
			ps.setString(4, dob);
			ps.setString(5, g);
			ps.setString(6, qua);
			ps.setString(7, pass);
			ps.setString(8, ex);
			ps.setString(9, add);
			
			int rs =ps.executeUpdate();
			
			if(rs>0) {
			
			response.sendRedirect("UserLogin.jsp");
			
			}
			else {
				System.out.println("Registration are failed");
			}
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		
	}

}
