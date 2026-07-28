<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
    <%
    
    String name = (String)session.getAttribute("name");
    Integer id = (Integer)session.getAttribute("id");
    
    
    Class.forName("com.mysql.cj.jdbc.Driver");
    
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/HR_Database","root","shadow@123");
    PreparedStatement ps = con.prepareStatement("SELECT * FROM addjob");
    ResultSet rs = ps.executeQuery();
    
    PreparedStatement ps1 = con.prepareStatement("SELECT a.*,j.job_title,j.company_name,j.location,j.job_type FROM applications a JOIN addjob j ON a.job_id = j.job_id WHERE a.user_id=?");
    ps1.setInt(1,id);
    ResultSet rs1 = ps1.executeQuery();
    
    
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
background-color:orange;
display:flex;
color:white;
align-items:center;
box-shadow:0px 8px 10px rgba(0,0,0,0.15);
}
.head-div h1{
margin-top:15px;
margin-left:30px;
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
margin-top:20px;
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
.user-photo{
height:190px;
width:300px;
box-shadow:0px 8px 10px rgba(0,0,0,0.15);
}

.my-app{
height:830px;
width:870px;
box-shadow:0px 10px 10px rgba(0,0,0,0.15);
margin-left:50px;
margin-top:50px;
}
.app-head{
width:830px;
height:160px;
display:flex;
margin-top:20px;
}

.d1{
height:160px;
width:400px;
}

.d2{
height:160px;
width:400px;

}

.recent-jobs-table{
width:95%;
border-collapse:collapse;
margin-left:20px;
background-color:white;
border-radius:15px;


box-shadow:0px 10px 10px rgba(0,0,0,0.15);



}

.recent-jobs-table th{
background-color:#fff4e6;
color:orange;
font-weight:bold;
padding:18px;
text-align:left;
font-size:15px;
}

.recent-jobs-table thead th{
postion:sticky;
top:0;
background:#fff4e6;
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
<i class="fa-solid fa-business-time"></i>


<h1 style=" font-size:25px; font-weight:bold;">JobPortal</h1><br>
</div>

<div class="user-photo">
<img style="width:100px;height:100px;border-radius:50%; margin-left:80px; " src="dummy.png">
<h5 style="margin-left:70px; font-weight:bold;"><%= name %></h5>
<p style="margin-left:90px;color:grey;font-weight:bold;">Job seeker</p>

</div>


<button onclick="window.location.href='UserDashboard.jsp'"; class="option-btn"> <i  style=" margin-right:20px;"  class="fa-solid fa-house" style="color: rgb(243, 104, 35);"></i>Dashboard</button><br>
<button onclick="window.location.href='UserMyApplication.jsp'"; class="option-btn"> <i  style=" margin-right:40px;"class="fa-solid fa-plus" style="color: rgb(243, 104, 35);"></i>My Applications</button><br>
<button onclick="window.location.href='ManageJobs.jsp'"; class="option-btn"><i style=" margin-right:20px;" class="fa-solid fa-briefcase" style="color: rgb(243, 104, 35);"></i>Browse Jobs</button><br>
<button onclick="window.location.href='UserProfile.jsp'"; class="option-btn"><i  style=" margin-right:50px;"class="fa-regular fa-user" style="color: rgb(243, 104, 35);"></i>Profile</button><br>
<button onclick="window.location.href='UserEditPassword'"; class="option-btn"> <i style=" margin-right:10px; margin-left:10px;"class="fa-solid fa-lock" style="color: rgb(243, 104, 35);"></i>Change Password</button><br>
<button onclick="window.location.href='UserLogoutServlet'"; class="option-btn"> <i  style=" margin-right:50px;"class="fa-solid fa-share-from-square" style="color: rgb(243, 104, 35);"></i>Logout</button><br>




</div>
<div class="details-div">
<div class="my-app">
<div class="app-head">

<div class="d1"><h3 style="margin-left:60px; font-weight:bold;">My Application</h3>
<p style="margin-left:60px; color:grey;font-weight:bold; margin-top:16px;">Track all the jobs you have applied for</p></div>
<div class="d2"><img  style="width:170px; margin-left:300px; margin-top:0;"  alt="" src="hm.jpg"></div>
</div>
<table class="recent-jobs-table">
<tr>
    <th>Job Details</th>
     <th>Company</th>
      <th>Location</th>
       <th>Job Type</th>
        <th>Applied On</th>
         <th>Status</th>
          <th>Action</th>
          

</tr>
<%
while(rs1.next()){
%>
<tr>
    <td><%= rs1.getString("job_title") %></td>
    <td><%= rs1.getString("company_name") %></td>
    <td><%= rs1.getString("location") %></td>
    <td><%= rs1.getString("job_type") %></td>
    <td><%= rs1.getString("apply_date") %></td>
    <td><%= rs1.getString("status") %></td>
    <td><button onclick="window.location.href='AllJob.jsp'" style="border:none;background-color:orange;">View Job</button></td>
    

</tr>
<%
}
%>

</table>


</div>

</div>
</div>
</body>
</html>