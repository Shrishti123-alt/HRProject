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
.outer-div{
width:100%;	
height:900px;
border:2px solid #f5f5f5;
box-shadow:0 4px 20px rgba(0,0,0,0.1);
overflow:hidden;
display:flex;
}

.pannel-div{
height:900px;
width:300px;
box-shadow:4px 0 15px rgba(255,165,0,0.15);
border-right:2px solid #f3f3f3;
background-color:white;

}
.head-div{
width:300px;
height:70px;

display:flex;

align-items:center;
}
.head-div h1{
margin-top:15px;
margin-left:10px;
}

.head-div i{
font-size:45px;
margin-left:30px;
margin-top:10px;
}

.highlight {
color:orange;
font-weight:bold;
text-decoration:none;

}

.option-btn{

height:60px;
width:250px;
margin:8px 20px;

border-radius:18px;
border:none;
font-weight:bold;
font-family:'Poppins',sans-serif;

transition:all 0.3s ease;

}

.option-btn i{
margin-right:20px;
font-size:25px;
color:orange;
}

.option-btn:hover{

background-color:orange;
color:white;
transform:translateX(8px);
box-shadow:0  5px 15px rgba(255,165,0,0.4);
}

.option-btn:hover i{

color:black;

}

.pannel-div img{

width:240px;
height:220px;
margin-left:30px;
margin-top:20px;
border-radius:20px;
object-fit:cover;

}

.details-div{
height:900px;
width:950px;


}
.welcome-head{
height:180px;
width:80%px;
margin-top:20px;
border-radius:10px;
align-items:center;
margin-left:20px;
margin-right:20px;
padding:35px;
display:flex;
justify-content:space-between;
background:linear-gradient(135deg,#ffffff,#fff4e6,#ffe0b2);

}

.welcome-text h1{
 font-size:35px;
 font-weight:bold;
 margin-bottom:10px;
}

.welcome-text p{
 font-size:18px;
 font-weight:500;
 color:grey;
}

.welcome-icon i{
font-size:100px;
color:orange;
opacity:0.15;
}
.form-box{
display:grid;
grid-template-columns:1fr 1fr;
gap:20px;
padding: 30px 50px;
}

.input-box{
display:flex;
flex-direction:column;

}

.input-box label{
margin-bottom:8px;
font-weight:500;
font-family:'Poppins',sans-serif;
}

.input-box input{
 padding:12px;
 border:1px solid #ddd;
 border-radius:8px;
 outline:none;

}

.input-box input:focus{
border:1px solid orange;

}

.check-box{
margin-top:20px;
grid-column:1/3;
display:flex;
align-items:flex-start;
gap:8px;
font-family:'Poppins',sans-serif;
font-size:14px;
}

.check-box input{
width:16px;
height:16px;
}

.check-box label{
width:100%;
}

.highlight a{
color:orange;
font-weight:bold;
text-decoration:none;

}



select{
 padding:12px;
 border:1px solid #ddd;
 border-radius:8px;
 outline:none;
 
}

select option{
 
 font-weight:bold;
 color:orange;

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
text-align:left;
font-size:17px;
}
.recent-jobs-table td{
padding:18px;
font-size:15px;
color:#555;
border-bottom:1px solid #f2f2f2;
}

.recent-jobs-table tr:last-child td{

border-bottom:none;
}

.recent-jobs-table tr:hover{
background-color:#fff9f2;
}




</style>
</head>
<body>
<div class="outer-div">

<div class="pannel-div">

<div class=head-div>

<i class="fa-solid fa-user" style="color: orange;"></i>
<h1 style=" font-size:35px; font-weight:bold;"><span class=highlight>HR</span>PORTAL</h1><br>
</div>

<p style="margin-left:75px; font-weight:bold; color:grey;">Recruitment made easy</p>



<button onclick="window.location.href='HRDashboard.jsp'"; class="option-btn"> <i  style=" margin-right:20px;"  class="fa-solid fa-house" style="color: rgb(243, 104, 35);"></i>Dashboard</button><br>
<button onclick="window.location.href='AddJob.jsp'"; class="option-btn"> <i  style=" margin-right:40px;"class="fa-solid fa-plus" style="color: rgb(243, 104, 35);"></i>Add job</button><br>
<button onclick="window.location.href='ManageJobs.jsp'"; class="option-btn"><i style=" margin-right:20px;" class="fa-solid fa-briefcase" style="color: rgb(243, 104, 35);"></i>Manage Jobs</button><br>
<button onclick="window.location.href='ViewApplication.jsp'";  class="option-btn"> <i style=" margin-right:10px;" class="fa-solid fa-street-view" style="color: rgb(243, 104, 35);"></i>View Applicants</button><br>
<button onclick="window.location.href='Profile.jsp'"; class="option-btn"><i  style=" margin-right:50px;"class="fa-regular fa-user" style="color: rgb(243, 104, 35);"></i>Profile</button><br>
<button onclick="window.location.href='EditPasswordServlet'"; class="option-btn"> <i style=" margin-right:10px; margin-left:10px;"class="fa-solid fa-lock" style="color: rgb(243, 104, 35);"></i>Change Password</button><br>
<button onclick="window.location.href='LogOutServlet'"; class="option-btn"> <i  style=" margin-right:50px;"class="fa-solid fa-share-from-square" style="color: rgb(243, 104, 35);"></i>Logout</button><br>

<img src="hm.jpg">


</div>

<div class="details-div">


<div class="welcome-head">
<div class="welcome-text">
<h1 style="font-size:30px; font-weight:bold;">Manage Jobs</h1>
<p style="font-weight:bold; color:grey;">Manage all posted jobs</p>

</div>

<div class="welcome-icon">
<i class="fa-solid fa-briefcase"></i>

</div>


</div>



<table class="recent-jobs-table">

<tr>
<th>Id</th>
<th>Job Title</th>
<th>Company</th>
<th>Location</th>
<th>Experience</th>
<th>Job Type</th>
<th>Salary</th>
<th>Last Date</th>
<th>Action</th>


</tr>
<%
while(rs.next()){
%>
<tr>
<td><%= rs.getString("job_id") %></td>
<td><%= rs.getString("job_title") %></td>
<td><%= rs.getString("company_name") %></td>
<td><%= rs.getString("location") %></td>
<td><%= rs.getString("experience") %></td>
<td><%= rs.getString("job_type") %></td>
<td><%= rs.getString("salary") %></td>
<td><%= rs.getString("last_date") %></td>
<td>
<a href="EditJobServlet?id=<%= rs.getInt("job_id") %>" class="btn btn-warning btn-sm"><i class="fa-solid fa-pen"></i></a>
<a href="DeleteJobServlet?id=<%= rs.getInt("job_id") %>" class="btn btn-danger btn-sm" style="margin-top:5px;"><i class="fa-solid fa-trash"></i></a>

</td>


</tr>
<%
}
%>
</table>
</div>
</div>

</body>
</html>