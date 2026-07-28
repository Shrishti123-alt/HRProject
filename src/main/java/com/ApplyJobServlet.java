package com;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 * Servlet implementation class ApplyJobServlet
 */
@MultipartConfig
@WebServlet("/ApplyJob")
public class ApplyJobServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ApplyJobServlet() {
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
		
		 int jobid = Integer.parseInt(request.getParameter("job_id"));
		 
		 HttpSession session = request.getSession();
		 
		 int userId = (Integer)session.getAttribute("id");	 
		 String na = request.getParameter("name");
		 String em= request.getParameter("email");
		 String pn = request.getParameter("phoneno");
		 String experience = request.getParameter("exp");
		 String skls = request.getParameter("skills");
		 String quali = request.getParameter("qualification");
		 String clg= request.getParameter("college");
		 String da = request.getParameter("date");
		 
		 Part resume = request.getPart("resume");
		 String fileName = resume.getSubmittedFileName();
		 
		 //upload path
		 String uploadPath = getServletContext().getRealPath("uploads/resume");
		 
		 java.io.File uploadDir = new java.io.File(uploadPath);
		 
		 if(!uploadDir.exists()) {
			 uploadDir.mkdirs();
		 }
		 System.out.println("File Name = " + fileName);
		 System.out.println("Upload Path = " + uploadPath);
		 //file save 
		 resume.write(uploadPath + java.io.File.separator + fileName);
		 
		 java.io.File f = new java.io.File(uploadPath + java.io.File.separator + fileName);
		 System.out.println("File Exists = " + f.exists());
		 
		 
		 String cl = request.getParameter("cover");
		 String curr = request.getParameter("location");
		
		 try {
			 
			 Class.forName("com.mysql.cj.jdbc.Driver");
			 
			 Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/HR_Database","root","shadow@123");
			 PreparedStatement ps = con.prepareStatement("INSERT INTO applications (user_id,job_id,full_name,email,mobile_no,qualification,experience,skills,resume,cover_letter,apply_date,current_location,college_name) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?)");
		     ps.setInt(1, userId);
		     ps.setInt(2, jobid);
		     ps.setString(3, na);
		     ps.setString(4, em);
		     ps.setString(5, pn);
		     ps.setString(6, quali);
		     ps.setString(7, experience);
		     ps.setString(8, skls);
		     ps.setString(9, "uploads/resume/"+fileName);
		     ps.setString(10, cl);
		     ps.setString(11, da);
		     ps.setString(12, curr);
		     ps.setString(13, clg);
		     
		     int i = ps.executeUpdate();
		     
		     if(i>0) {
		    	 out.println("<script>");
		    	 out.println("alert('Application submitted successfully');");
		    	 out.println("window.location='ApplyJob.jsp?job_id="+ jobid +"';");
		    	 out.println("</script>");
		     }
		     else {
		    	 out.println("<script>");
		    	 out.println("alert('Application failed');");
		    	 out.println("window.location='ApplyJob.jsp?job_id="+ jobid +"';");
		    	 out.println("</script>");
		     }
		 }catch(Exception e){
			 
			 e.printStackTrace();
		 }
		
	}

}
