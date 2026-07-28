<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
    <%
    
    String name = (String)session.getAttribute("name");
    Integer id = (Integer)session.getAttribute("id");
    
    
    
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
box-shadow: 4px 0 15px rgba(255,165,0,0.15);

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

transition:all 0.3s ease;

}
.user-photo{
height:190px;
width:300px;
box-shadow:0px 8px 10px rgba(0,0,0,0.15);
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

.pass-head{
height:80px;

margin-top:20px;
box-shadow:0 12px 10px -8px rgba(0,0,0,0.25);
}

.pass-box{
height:500px;
width:700px;

margin-left:130px;
margin-top:50px;
box-shadow:0 8px 25px rgba(0,0,0,0.12);
background-color:white;
}
.form-box{
height:480px;
width:500px;

margin-left:100px;
}
.form-box label{
margin-top:20px;
font-weight:bold;
font-family:'Poppins',sans-serif;

}

.form-box input{
 padding:12px;
 border:1px solid #ddd;
 border-radius:8px;
 outline:none;
 width:500px;

}
.form-box input::placeholder{
font-weight:bold;}


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


<img src="hm.jpg">


</div>

<div class="details-div">
<div class="pass-head">
<h3 style="font-weight:bold;">🔒Change Password</h3>
<p style="margin-left:20px; font-weight:bold; color:grey;"><span class="highlight">Dashboard</span> > Change Password</p>

</div>

<div class="pass-box">
<form action="UserUpdatePassword" method="post" class="form-box">

<h3 class="highlight" style="font-size:27px;margin-left:10px;">
<i class="fa-solid fa-lock" style="color: rgb(243, 104, 35); margin-right:10px;">
</i>Change Password</h3>
<hr style="color:orange; height:3px;">
<label>Current Password</label><br>
<input type="password" placeholder="Enter Current Password" name="currentpassword"><br>
<label>New Password</label><br>
<input type="password" placeholder="Enter New Password" name="newpassword"><br>
<label>Confirm Password</label><br>
<input type="password" placeholder="Confirm New Password" name="confirmpassword"><br>
<button type="submit" style=" color:white;background-color:orange; border:none; width:340px; height:40px; margin-left:100px; margin-top:20px;"><i class="fa-solid fa-lock" style="color: rgb(243, 104, 35); margin-right:10px;">
</i>Update Password</button>
<p style="margin-left:100px; color:grey; font-weight:bold; margin-top:10px;">Password should be at least 8 characters long </p>

</form>


</div>

</div>
</div>


</body>
</html>