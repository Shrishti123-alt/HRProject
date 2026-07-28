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
 * Servlet implementation class AddJObServlet
 */
@WebServlet("/addjob")
public class AddJobServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddJobServlet() {
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
		
		String jt = request.getParameter("title");
		String cn = request.getParameter("company");
		String lo = request.getParameter("location");
		String er = request.getParameter("experience");
		String qua = request.getParameter("qualification");
		String jty = request.getParameter("jobtype");
		String sa = request.getParameter("salary");
		String ld = request.getParameter("lastdate");
		String ski = request.getParameter("skills");
		String jd = request.getParameter("discription");
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/HR_Database","root","shadow@123");
			
			PreparedStatement ps = con.prepareStatement("INSERT INTO AddJob(job_title,company_name,location,experience,qualification,job_type,salary,last_date,skills,description) VALUES(?,?,?,?,?,?,?,?,?,?)");
			
			ps.setString(1, jt);
			ps.setString(2, cn);
			ps.setString(3, lo);
			ps.setString(4, er);
			ps.setString(5, qua);
			ps.setString(6, jty);
			ps.setString(7, sa);
			ps.setString(8, ld);
			ps.setString(9, ski);
			ps.setString(10, jd);
			
			int result = ps.executeUpdate();
			response.sendRedirect("HRDashboard.jsp");
			
		}
		catch(Exception e) {
			out.println(e.getMessage());
			
		}
		
	}

}
