<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
    <%
    
    String name = (String)session.getAttribute("name");
    Integer id = (Integer)session.getAttribute("id");
    
    
    Class.forName("com.mysql.cj.jdbc.Driver");
    
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/HR_Database","root","shadow@123");
    
    
    PreparedStatement ps1 = con.prepareStatement("SELECT a.application_id, a.full_name,a.status,a.email,a.mobile_no,a.qualification AS applicant_qualification, a.experience AS applicant_experience , a.skills AS applicant_skills,a.cover_letter,a.current_location,a.apply_date, j.job_title,j.company_name,j.location,j.job_type,j.salary,j.qualification AS job_qualification, j.experience AS job_experience,j.skills AS job_skills,j.description,j.last_date FROM applications a JOIN addjob j ON a.job_id = j.job_id");
    
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
body{
background-color:#FFF2DB;
}
.job-header{
height:60px;
width:100%;
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

.job-div{
height:620px;
width:1140px;
background-color:white;
margin-left:70px;
margin-top:20px;
border-radius:10px;
box-shadow:0 4px 20px rgba(0,0,0,0.1);
display:flex;

}

.applicant-info{
width:640px;
height:590px;
margin-top:10px;
margin-left:20px;

box-shadow:0 4px 20px rgba(0,0,0,0.1);
}

.job-info{
width:430px;
height:590px;

box-shadow:0 4px 20px rgba(0,0,0,0.1);
margin-left:17px;
margin-top:10px;
}
h6{
margin-top:10px;
font-weight:bold;
margin-left:50px;
margin-top:15px;
}
.line-div{
width:100px;
height:4px;
background-color:orange;
border-radius:10px;
margin-left:50px;
}
.cl{
width:500px;
height:180px;
border:2px solid orange;
margin-left:40px;
border-radius:10px;
background-color:#FFF2DB;

}
.undo-div{
height:70px;
width:300px;
background-color:orange;
border-radius:10px;
margin-left:30px;
text-align:center;
}

.ss{
margin-left:40px;
border:none;
box-shadow:0 4px 20px rgba(0,0,0,0.1);
margin-top:10px;
}
</style>
</head>
<body>
<div class="job-header">
<h2 style=" margin-left:30px;"><i class="fa-solid fa-business-time"></i>Job<span class="highlight">Applicants</span></h2>
<button class="btn" onclick="window.location.href='HRDashboard.jsp';"> <i style="margin-right:10px;" class="fa-solid fa-arrow-right fa-rotate-180"></i>Back to home</button>
</div>
<%
while(rs1.next()){
%>
<div class="job-div">
<div class="applicant-info">
<h4 style="margin-left:50px;margin-top:10px;font-weight:bold;"> <i class="fa-solid fa-user"  style="margin-right:5px;" ></i>Candidate Information</h4>
<div class="line-div"></div>
<h6>Name: <span style="color:grey;"><%= rs1.getString("full_name") %></span></h6>
 <h6>Email: <span  style="color:grey;"><%= rs1.getString("email") %></span></h6>
  <h6>Phone:<span style="color:grey;"><%= rs1.getString("mobile_no") %></span></h6>
 <h6>Qualification: <span style="color:grey;"><%= rs1.getString("applicant_qualification") %></span></h6>
 <h6>Experience: <span style="color:grey;"><%= rs1.getString("applicant_experience") %> years</span></h6>
 <h6>Skills: <span style="color:grey;"><%= rs1.getString("applicant_skills") %></span></h6>
 <h6>Apply date: <span style="color:grey;"><%= rs1.getString("apply_date") %></span></h6>
  <h6>Location: <span style="color:grey;"><%= rs1.getString("current_location") %></span></h6>
   
 
 <div class="cl">
 <h5 style="margin-left:20px; font-weight:bold; "><i class="fa-solid fa-file" style="margin-right:5px;"></i>Cover letter</h5>
 <p style="margin-left:20px;margin-right:20px;"><%= rs1.getString("cover_letter") %></p>
 </div>
 <form action="update" method="post">
 <input type="hidden" name="application_id" value="<%= rs1.getInt("application_id")%>">

 <select class="ss" name="status" onchange="changeColor(this)">
 <option>Select Status</option>
  <option value="Applied" style="color:yellow; font-weight:bold;" <%= rs1.getString("status").equals("Applied") ? "selected" : ""%>>Applied</option>
   <option value="Under Review" style="color:blue; font-weight:bold;" <%= rs1.getString("status").equals("Under Review") ? "selected" : ""%>>Under Review</option>
    <option value="Selected" style="color:green; font-weight:bold;" <%= rs1.getString("status").equals("Selected") ? "selected" : ""%>>Selected</option>
     <option value="Rejected" style="color:red; font-weight:bold;" <%= rs1.getString("status").equals("Rejected") ? "selected" : ""%>>Rejected</option>
          <option value="Pending" style="color:pink; font-weight:bold;" <%= rs1.getString("status").equals("Pending") ? "selected" : ""%>>Pending</option>
     
 </select><br>
 <button style="border:none; border-radius:10px; margin-top:10px;margin-left:40px; background-color:orange;" type="submit">Update Status</button>
 
 </form>
 
 
 
</div>
<div class="job-info">
<h4 style="margin-left:50px;margin-top:10px;font-weight:bold;"> <i class="fa-solid fa-suitcase"  style="margin-right:5px;" ></i>Job Information</h4>

<div class="undo-div">
<h5 style=" font-weight:bold;"><%= rs1.getString("job_title") %></h5>
<p style=" color:grey; font-weight:bold;"><%= rs1.getString("company_name") %></p>
</div>

<div style="margin-top: 30px;">
<h6 style="margin-left:40px; font-size:14px;">Location  <span style="color:grey; margin-left:160px;"><%= rs1.getString("location") %></span></h6>
 <h6 style="margin-left:40px; font-size:14px;">Job Type <span  style="color:grey; margin-left:160px;"><%= rs1.getString("job_type") %></span></h6>
  <h6 style="margin-left:40px; font-size:14px;">Experience <span style="color:grey; margin-left:145px;"><%= rs1.getString("job_experience") %></span></h6>
 <h6 style="margin-left:40px; font-size:14px;">Salary  <span style="color:grey; margin-left:180px; "><%= rs1.getString("salary") %></span></h6>
 <h6 style="margin-left:40px; font-size:14px;">Qualification   <span style="color:grey; margin-left:130px;"><%= rs1.getString("job_qualification") %></span></h6>
 <h6 style="margin-left:40px; font-size:14px;">Last date  <span style="color:grey; margin-left:160px;"><%= rs1.getString("last_date") %></span></h6>
 
</div>

<h6 style="margin-left:20px; font-weight:bold; color:orange; margin-top:20px;">Job Description</h6>
<p style="margin-left:18px;margin-right:10px; font-size:13px; "><%= rs1.getString("description") %></p>
 
 <h6 style="margin-left:20px; font-weight:bold; color:orange; margin-top:0px;">Skills</h6>
 <p style="margin-left:18px;margin-right:10px; font-size:13px; "><%= rs1.getString("job_skills") %></p>
 

</div>


</div>
<%
}
%>



</body>
</html>