<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ page import="java.sql.*" %>
    
    <%
    ResultSet rs =(ResultSet)request.getAttribute("rs");
    
    
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
<button onclick="window.location.href='EditPasswordServlet'";  class="option-btn"> <i style=" margin-right:10px; margin-left:10px;"class="fa-solid fa-lock" style="color: rgb(243, 104, 35);"></i>Change Password</button><br>
<button onclick="window.location.href='LogOutServlet'"; class="option-btn"> <i  style=" margin-right:50px;"class="fa-solid fa-share-from-square" style="color: rgb(243, 104, 35);"></i>Logout</button><br>

<img src="hm.jpg">


</div>

<div class="details-div">


<div class="welcome-head">
<div class="welcome-text">
<h1 style="font-size:30px; font-weight:bold;">Add New Job</h1>
<p style="font-weight:bold; color:grey;"><span class="highlight">Dashboard</span> > Add New Job</p>

</div>

<div class="welcome-icon">
<i class="fa-solid fa-briefcase"></i>

</div>


</div>

<h2 style="font-size:26px; margin-left:60px; margin-top:20px; font-weight:bold;">Job Details</h2>

<form action="UpdateJobServlet" method="post" class=form-box>

<input type="hidden" name="job_id" value=<%= rs.getInt("job_id") %>>
<div class="input-box" >
<label>Job Title <span class="highlight">*</span></label>
<input type="text" placeholder="Enter job title" value="<%= rs.getString("job_title") %>" name="title" required>
</div>
<div class="input-box">
<label>Company Name <span class="highlight">*</span></label>
<input type="text" placeholder="Enter company name" value="<%= rs.getString("company_name") %>" name="company" required>
</div>
<div class="input-box">
<label>Location <span class="highlight">*</span></label>
<input type="text" placeholder="Enter job location" value="<%= rs.getString("location") %>" name="location" required>
</div>
<div class="input-box">
<label>Experience Required <span class="highlight">*</span></label>
<select name="experience">
<option value="">--Select Experience--</option>
<option value="Fresher" <%= rs.getString("experience").equals("Fresher") ? "selected" : "" %>>Fresher</option>

<option value="0 - 1 Years" <%= rs.getString("experience").equals("0 - 1 Years") ? "selected" : "" %>>0 - 1 Years</option>
<option value="1 - 2 Years" <%= rs.getString("experience").equals("1 - 2 Years") ? "selected" : "" %>>1 - 2 Years</option>
<option value="2 - 3 Years" <%= rs.getString("experience").equals("2 - 3 Years") ? "selected" : "" %>>2 - 3 Years</option>
<option value="3 - 5 Years" <%= rs.getString("experience").equals("3 - 5 Years") ? "selected" : "" %>>3 - 5 Years</option>
<option value="5+ Years" <%= rs.getString("experience").equals("5+ Years") ? "selected" : "" %>>5+ Years</option>







</select>
</div>
<div class="input-box">
<label>Qualification <span class="highlight">*</span> </label>
<input type="text" placeholder="Enter qualification" value="<%= rs.getString("qualification") %>" name="qualification">
</div>
<div class="input-box">
<label>Job Type <span class="highlight">*</span></label>
<select name="jobtype">
<option value="">--Select Job Type--</option>
<option value="Full Time" <%= rs.getString("job_type").equals("Full Time") ? "selected" : "" %>>Full Time</option>
<option value="Part Time" <%= rs.getString("job_type").equals("Part Time") ? "selected" : "" %>>Part Time</option>
<option value="Internship" <%= rs.getString("job_type").equals("Internship") ? "selected" : "" %>>Internship</option>
<option value="Contract" <%= rs.getString("job_type").equals("Contract") ? "selected" : "" %>>contract</option>
<option value="Remote" <%= rs.getString("job_type").equals("Remote") ? "selected" : "" %>>Remote</option>
<option value="Hybrid" <%= rs.getString("job_type").equals("Hybrid") ? "selected" : "" %>>Hybrid</option>







</select>
</div>

<div class="input-box">
<label>Salary </label>
<input type="text" placeholder="Enter salary" value="<%= rs.getString("salary") %>" name="salary" required>
</div>

<div class="input-box">
<label>Last Date to Apply</label>
<input type="date"  name="lastdate" value="<%= rs.getString("last_date") %>" required>
</div>

<div class="input-box">
<label>Skills Required<span class="highlight">*</span></label>
<input type="text" placeholder="Enter skills" value="<%= rs.getString("skills") %>" name="skills" required>
</div>

<div class="input-box">
<label>Job Description<span class="highlight">*</span></label>
<input type="text" placeholder="Enter job description...." value="<%= rs.getString("description") %>" name="discription" required>
</div>


<button type="submit" style="width:150px; height:50px; border-radius:10px; background-color:orange;color:white; font-weight:bold; margin-left:10px; border:none;"> <i  style="margin-right:10px;" class="fa-solid fa-paper-plane" style="color: rgb(243, 104, 35);"></i>Update Job</button>


</form>
</div>
</div>

</body>
</html>