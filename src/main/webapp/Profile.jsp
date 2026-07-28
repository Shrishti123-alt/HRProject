<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ page import="java.sql.*"  %>
    
    <%
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/HR_DATABASE","root","shadow@123");
    PreparedStatement ps = con.prepareStatement("SELECT * FROM hr_register");
    ResultSet rs=ps.executeQuery();
    
    
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
height:250px;
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
font-size:180px;
color:orange;
opacity:0.15;
}

.highlight a{
color:orange;
font-weight:bold;
text-decoration:none;

}

.imgs{
height:140px;
width:140px;
border-radius:50%;
background-image:url("hrphoto.jpeg");
border:2px solid white;
background-size:cover;

}

.info-card{

border-radius:18px;
box-shadow:0 4px 20px rgba(0,0,0,0.1);
margin:40px auto;
display:grid;
grid-template-columns:1fr 1fr;
gap:25px 40px;
width:90%;
background:#fff;

}

.info-box{
display:flex;
flex-direction:column;
margin-top:30px;
box-shadow:0 12px 10px -8px rgba(0,0,0,0.25);


}

.info-box label{
font-weight:bold;
margin-bottom:8px;
color:orange;
margin-left:20px;

}

.info-box input{
padding: 0 15px;
border:1px solid #ddd;
border-radius:8px;
height:45px;
margin-left:20px;
margin-bottom:10px;
width:80%;
font-size:15px;
background:#f8f8f8;
font-weight:bold;
color:grey;


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
<button  onclick="window.location.href='LogOutServlet'"; class="option-btn"> <i  style=" margin-right:50px;"class="fa-solid fa-share-from-square" style="color: rgb(243, 104, 35);"></i>Logout</button><br>

<img src="hm.jpg">


</div>

<div class="details-div">


<div class="welcome-head">
<div class="imgs"></div>
<div class="welcome-text">

<h1 style="font-size:30px; font-weight:bold;">HR Manager</h1>
<p style="font-weight:bold; color:grey;"><span class="highlight">Dashboard</span></p>
<p style="font-size:15px;">Manage your profile information and </p>
<p style="font-size:15px;">keeps your details updated</p>

</div>

<div class="welcome-icon">
<i class="fa-solid fa-money-bill" style="color: rgb(243, 104, 35);"></i>

</div>


</div>

<h4 style="margin-left:30px; margin-top:30px; font-weight:bold;">👤 Personal Information</h4>

<div class="info-card">
<div class="info-box">
<%if(rs.next()){
%>
<label>Full Name</label>
<input type="text" value=<%= rs.getString("full_name") %>>
</div>

<div class="info-box">
<label>Email</label>
<input type="text" value=<%= rs.getString("email") %>>
</div>

<div class="info-box">
<label>Mobile Number</label>
<input type="text" value=<%= rs.getString("mobile_no") %>>
</div>

<div class="info-box">
<label>Date of Birth</label>
<input type="text" value=<%= rs.getString("dob") %>>
</div>

<div class="info-box">
<label>Account Created</label>
<input type="text" value=<%= rs.getString("created_at") %>>
</div>

<div class="info-box">
<label>Account Id</label>
<input type="text" value=<%= rs.getString("id") %>>
</div>
<%
}
%>


</div>


</div>


</div>


</body>
</html>