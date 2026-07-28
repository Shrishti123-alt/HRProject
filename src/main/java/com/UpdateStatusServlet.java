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
 * Servlet implementation class UpdateStatusServlet
 */
@WebServlet("/update")
public class UpdateStatusServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateStatusServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
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
		
		
		String st=request.getParameter("status");
		int applicationId = Integer.parseInt(request.getParameter("application_id"));
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/HR_Database","root","shadow@123");
			PreparedStatement ps = con.prepareStatement("UPDATE applications SET status=?  WHERE application_id=?");
			ps.setString(1, st);
			ps.setInt(2, applicationId);
			
			int i = ps.executeUpdate();
			
			if(i>0) {
				out.println("<script>");
				out.println("alert('Status Update Successfully');");
				out.println("window.location='ViewApplication.jsp';");
				out.println("</script>");
				
			}
			else {
				out.println("<script>");
				out.println("alert('Status Updation failed');");
				out.println("window.location='ViewApplication.jsp';");
				out.println("</script>");
				
			}
			
			
			
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		
		
		
		
	}

}
