<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
    
    <%
    
    Class.forName("com.mysql.cj.jdbc.Driver");
    
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hr_database","root","shadow@123");
    
    PreparedStatement ps = con.prepareStatement("SELECT * FROM addjob");
    ResultSet rs = ps.executeQuery();
    
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"> 
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css">
    
<style>

.job-header{
height:60px;
width:106%;
display:flex;
box-shadow:0px 8px 10px rgba(0,0,0,0.15);
font-family:'poppins',sans-serif;
background-color:white;

}
.highlight {
color:orange;
font-weight:bold;
text-decoration:none;

}

.btn{
height:40px;
width:180px;
border:none;
background-color:orange;
color:black;
margin-left:780px;
margin-top:10px;


}

.btn:hover{
background-color:#FFAE6E;
}

.recent-jobs-table{
width:100%;
border-collapse:collapse;
margin-top:20px;
background-color:white;
border-radius:15px;
overflow:hidden;
box-shadow:0 4px 15px rgba(0,0,0,0.08);



}

.recent-jobs-table th{
background-color:#fff4e6;
color:orange;
font-weight:bold;
padding:18px;
text-align:center;
font-size:17px;

}
.recent-jobs-table td{
padding:18px;
font-size:15px;
color:grey;
text-align:center;
font-weight:bold;
border-bottom:1px solid #f2f2f2;

}

.recent-jobs-table tr:last-child td{

border-bottom:none;
}

.recent-jobs-table tr:hover{
background-color:#fff9f2;
}
.recent-jobs-table div{
margin:8px 0;
}
.recent-jobs-table i{
color:orange;
width:18px;
}

.skill{
background:#FFF2DB;
color:#d97706;
padding: 6px 12px;
border-radius:20px;
display:inline-block;
font-size:13px;
}

.desc{
overflow:hidden;
dispaly:-webkit-box;
-webkit-line-clamp:3;
-webkit-box-orient:vertical;
line-height:22px;
}
.date{
background:#FFE8C8;
color:#d97706;
padding:8px 12px;
border-radius:8px;
font-weight:bold;

}

</style>
</head>

<body>
<div class="job-header">
<h2 style=" margin-left:30px;"><i class="fa-solid fa-business-time"></i>Job<span class="highlight">Portal</span></h2>
<button class="btn" onclick="window.location.href='UserDashboard.jsp';"> <i style="margin-right:10px;" class="fa-solid fa-arrow-right fa-rotate-180"></i>Back to home</button>

</div>
<h3 style="font-weight:bold; margin-left:50px;margin-top:40px;">All Available <span class="highlight">Jobs</span></h3>
<p style="margin-left:50px; font-weight:bold; color:grey;">Find the right opportunity and apply for your dream job</p>

<table class="recent-jobs-table">

<tr>
<th>Job Details</th>
<th>Comapny</th>
<th>Location/Type/Salary</th>
<th>Skills</th>
<th>Experience</th>
<th>Qualification</th>
<th>Job Description</th>
<th>Last date</th>




</tr>
<% while(rs.next()){
	
	%>


<tr>
<td><h6 style="font-weight:bold;color:#222;"><%= rs.getString("job_title") %></h6></td>
<td><i class="fa-solid fa-building" style="color:orange;"></i><%= rs.getString("company_name") %></td>
<td><div><i class="fa-solid fa-location-dot"></i><%= rs.getString("location") %></div><br>
   <div><i class="fa-solid fa-briefcase"></i><%= rs.getString("job_type") %></div> <br>
    <div><i class="fa-solid fa-indian-rupee-sign"></i><%= rs.getString("salary") %></div>
    
</td>
<td><span class="skill"><%= rs.getString("skills") %></span></td>
<td><%= rs.getString("experience") %></td>


<td><%= rs.getString("qualification") %></td>
<td style="max-width:250px;"><div class="desc"><%= rs.getString("description") %></div></td>
<td><div class="date"><%= rs.getString("last_date") %></div></td>

</tr>
<%
}

%>








</table>

</body>
</html>