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
    
    PreparedStatement ps3 = con.prepareStatement("SELECT a.*,j.job_title,j.company_name FROM applications a JOIN addjob j ON a.job_id = j.job_id WHERE a.user_id=?");
    ps3.setInt(1, id);
    ResultSet rs3 = ps3.executeQuery();
    
    //count increases according to total jobs
    PreparedStatement ps1 = con.prepareStatement("SELECT COUNT(*) FROM addjob");
    ResultSet rs1 = ps1.executeQuery();
    int totalJobs=0;
    
    while(rs1.next()){
    	totalJobs = rs1.getInt(1); 
    }
    
   
    PreparedStatement ps2 = con.prepareStatement("SELECT * FROM user_register WHERE id=?");
    ps2.setInt(1,id);
    ResultSet rs2 = ps2.executeQuery();
    if(rs2.next()){
    	
   
    	
    
    PreparedStatement ps4 = con.prepareStatement("SELECT * FROM applications WHERE user_id=?");
    ps4.setInt(1, id);
    ResultSet rs4= ps4.executeQuery();
    int totalapplied = 0;
    while(rs4.next()){
    	totalapplied = rs4.getInt(1);
    }
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
.welcome-head{
height:180px;
width:90px;
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

.status-div{

height:180px;
width:98%;

margin-left:10px;
margin-top:10px;
display:flex;
justify-content:space-between;

}
.st-outer-div{
height:150px;
width:225px;

margin-top:10px;
border-radius:10px;
display:flex;
border:none;
background-color:white;
box-shadow:0 4px 15px rgba(0,0,0,0.08);
transition:all 0.3s ease;

}

.st-outer-div:hover{
transform:translateY(-5px);
box-shadow:0 8px 20px rgba(255,165,0,0.3);
}
.ic-div{
height:50px;
width:50px;
border-radius:50px;
background-color:orange;
margin-top:30px;
margin-left:10px;
}

.recent-jobs-div{
width:98%;


margin-left:10px;
background-color:white;
border-radius:10px;
margin-top:20px;
box-shadow:0 -5px 10px rgba(0,0,0,0.1);

}

.rj-head{
height:60px;
width:96%;

margin-left:10px;
margin-top:10px;
display:flex;
}
.add-job-btn{
height:40px;
margin-top:10px;
border-radius:5px;
border:none;
font-weight:bold;
background-color:orange;
margin-left:550px;


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

.user-photo{
height:190px;
width:300px;
box-shadow:0px 8px 10px rgba(0,0,0,0.15);
}
.wel-div{
height:100px;
box-shadow:0px 8px 10px rgba(0,0,0,0.15);
display:flex;
}

.search-div{
height:40px;
width:390px;
margin-top:25px;
margin-left:100px;

}

.search-div input{
width:300px;
color:orange;
font-weight:bold;
border:2px solid grey;
border-top-left-radius:10px;
border-bottom-left-radius:10px;


}



.search-div button{
border:none;
background-color:grey;
border-top-right-radius:10px;
border-bottom-right-radius:10px;



}

.status-div{

height:180px;
width:98%;

margin-left:10px;
margin-top:10px;
display:flex;
justify-content:space-between;

}
.st-outer-div{
height:150px;
width:225px;

margin-top:10px;
border-radius:10px;
display:flex;
border:none;
background-color:white;
box-shadow:0 4px 15px rgba(0,0,0,0.08);
transition:all 0.3s ease;

}

.st-outer-div:hover{
transform:translateY(-5px);
box-shadow:0 8px 20px rgba(255,165,0,0.3);
}
.ic-div{
height:50px;
width:50px;
border-radius:50px;
background-color:orange;
margin-top:30px;
margin-left:10px;
}

.down-div{
width:940px;
height:600px;
display:flex;
margin-left:10px;

}

.latest-jobs{
height:600px;
width:520px;
box-shadow:0px 4px 15px rgba(0,0,0,0.15);
border-radius:18px;
overflow-y:auto;
overflow-x:hidden;
}

.job-div{
display:flex;
height:50px;
box-shadow:0px 8px 10px rgba(0,0,0,0.15);

}

.app-btn{
width:160px;
height:40px;
color:orange;
background-color:white;
border:none;
font-weight:bold;
border:1px solid orange;
box-shadow:0 4px 10px rgba(255,165,0,0.35);
transition:0.3s;
margin-left:310px;
}

.app-btn:hover{
background-color:#ff9800;
box-shadow:0 6px 15px rgba(255,165,0,0.5);
color:white;



}

.jobs{
height:200px;
margin-top:10px;
border-bottom:1px solid grey;
width:100%;
box-sizing:border-box;


}

.jobs2{
height:100px;
margin-top:10px;
border-bottom:1px solid grey;
width:100%;
box-sizing:border-box;

}



.table-scroll{
height:180px;
overflow-y:auto;
}

.my-appl{
width:400px;;
height:600px;

margin-left:10px;

}

.app-div1{
height:350px;
width:400px;
box-shadow:0px 4px 15px rgba(0,0,0,0.15);
overflow-y:auto;
overflow-x:hidden;

}

.profile-div{
width:400px;
height:230px;
box-shadow:0px 4px 15px rgba(0,0,0,0.15);
margin-top:10px;
}

.profile-div h6{
margin-top:10px;
font-weight:bold;
margin-left:20px;
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
<div class="wel-div">
<div>
<h4 style="font-weight:bold; margin-left:20px; margin-top:10px;" >Welcome back,<%= name %>👋</h4>
<p style="font-weight:bold; color:grey; margin-left:20px;">Find the best job opportunities and build your career</p>

</div>
<div class="search-div" style="display:flex;">
<input type="text" placeholder="Search jobs....">
<button ><i class="fa-solid fa-magnifying-glass" style="color: rgb(243, 104, 35);"></i></button>

</div>
</div>
<div class="status-div">
<div class=st-outer-div>
<div class=ic-div><i  style="font-size:30px; margin-left:10px; margin-top:10px;" class="fa-solid fa-briefcase"></i></div>
<div style="margin-left:10px;" class=ic-info>
<h1 style="margin-left:20px;" class="highlight"><%= totalJobs %></h1>
<p style="font-weight:bold; font-size:14px;">Jobs Available</p>
<a class="highlight" href="">View all -></a>

</div>

</div>
<div class=st-outer-div>
<div class=ic-div><i  style="font-size:30px; margin-left:10px; margin-top:10px;" class="fa-solid fa-circle-user"></i></div>
<div style="margin-left:10px;" class=ic-info>
<h1 style="margin-left:20px;" class="highlight"><%= totalapplied %></h1>
<p style="font-weight:bold; font-size:14px;">Applied Jobs</p>
<a class="highlight" href="">View all -></a>

</div></div>
<div class=st-outer-div>
<div class=ic-div><i  style="font-size:30px; margin-left:10px; margin-top:10px;" class="fa-solid fa-clock"></i></div>
<div style="margin-left:10px;" class=ic-info>
<h1 style="margin-left:20px;" class="highlight">0</h1>
<p style="font-weight:bold; font-size:14px;">Pending Applicaton</p>
<a class="highlight" href="">View all-></a>

</div></div>
<div class=st-outer-div><div class=ic-div><i  style="font-size:30px; margin-left:15px; margin-top:10px;" class="fa-solid fa-xmark"></i></div>
<div style="margin-left:10px;" class=ic-info>
<h1 style="margin-left:20px;" class="highlight">0</h1>
<p style="font-weight:bold; font-size:14px;">Rejected Application</p>
<a class="highlight" href="">View all -></a>

</div></div>



</div>
<div class="down-div">

<div class="latest-jobs">

<div class="job-div">
<h4 style="margin-left:10px; font-weight:bold; marin-top:20px;">Latest Job Openings</h4>
<button style="margin-left:100px; font-weight:bold; margin-top:7px; color:orange; height:40px;width:150px; border:none; background-color:white;" onclick="window.location.href='AllJob.jsp'"; >View All jobs</button>


 </div>
 
 <%
 while(rs.next()){
 %>

 <div class="jobs">
 <h5 style="font-weight:bold; margin-left:30px;"><%= rs.getString("job_title") %></h5>
 <p style="margin-bottom:0px; font-size:17px; font-weight:bold; color:grey;  margin-left:30px; "><%= rs.getString("company_name") %></p>
 <p style="margin-bottom:0px; font-size:15px; font-weight:bold; color:grey; margin-left:30px;"><i style="margin-right:10px;"  class="fa-solid fa-map-pin" style="color: rgb(243, 104, 35);"></i><%= rs.getString("location") %></p>
 <p style="background-color:#FFC29B; width:75px; color:#EC6530; margin-top:20px;font-weight:bold;  margin-left:30px;"><%= rs.getString("job_type") %></p>
 
<button type="submit" class="app-btn" onclick="window.location.href='ApplyJob.jsp?job_id=<%= rs.getInt("job_id") %>';" >Apply Now</button>
 
 </div>
 
 
 <%
 }
 %>


</div>
<div class="my-appl">

<div class="app-div1">
<div class="job-div">
<h4 style="margin-left:10px; font-weight:bold; marin-top:20px; ">My Applications</h4>
<button style="margin-left:100px; font-weight:bold; margin-top:7px; color:orange; height:40px;width:80px; border:none; background-color:white;" onclick="window.location.href='UserMyApplication.jsp' "; >View All</button>

 </div>
 <%
while(rs3.next()){
%>
 <div class="jobs2">
 <h5 style="margin-left:30px; font-weight:bold;"><%= rs3.getString("job_title") %></h5>
 <p style="color:grey; font-weight:bold; margin-left:30px;;"><%= rs3.getString("company_name") %></p>
<p style=" text-align:center;background-color:green;color:white; width:100px; margin-left:270px;"><%= rs3.getString("status")%></p>
 
 </div>
 <%
}
%>
</div>



<div class="profile-div">
<div class="job-div">
<h5 style="margin-left:10px; font-weight:bold; marin-top:20px;">Profile Summary</h5>
<p style="margin-left:130px; font-weight:bold; margin-top:7px; color:orange; border:2px solid orange; width:60px; text-align:center;">Edit</p>

 </div>
 
 
 <h6>Name: <span style="color:grey;"><%= rs2.getString("full_name") %></span></h6>
 <h6>Email: <span  style="color:grey;"><%= rs2.getString("email") %></span></h6>
  <h6>Phone:<span style="color:grey;"><%= rs2.getString("mobile_no") %></span></h6>
 <h6>Qualification: <span style="color:grey;"><%= rs2.getString("qualification") %></span></h6>
 <h6>Experience: <span style="color:grey;"><%= rs2.getString("experience") %> years</span></h6>
 
 

</div>

<%
    }
%>


</div>



</div>




</div>
</div>

</body>
</html>