<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
    <%
   
    String jobId = request.getParameter("job_id");
    
    Class.forName("com.mysql.cj.jdbc.Driver");
    
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/HR_Database","root","shadow@123");
    PreparedStatement ps = con.prepareStatement("SELECT * FROM addjob WHERE job_id=?");
    ps.setString(1,jobId);
    ResultSet rs = ps.executeQuery();
    if(rs.next()){
    
    %>
    
    
   
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"> 
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css">
    
</head>
<style>
.job-header{
height:60px;
width:100%;
display:flex;
box-shadow:0px 8px 10px rgba(0,0,0,0.15);
font-family:'poppins',sans-serif;

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

.outer-div{
width:100%;
height:800px;
display:flex;
}

.job-info{
height:650px;
width:400px;
border-radius:18px;
box-shadow:0px 4px 15px rgba(0,0,0,0.15);
margin-left:20px;
margin-top:30px;
}

.apply-form{
height:820px;
width:750px;
border-radius:18px;
box-shadow:0px 4px 15px rgba(0,0,0,0.15);
margin-left:20px;
margin-top:20px;

}
.undo-div{

height:150px;
width:350px;
background-color:orange;
border-radius:18px;
margin-left:30px;
margin-top:20px;

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

.cover-letter{
grid-column:1/3;

}

.subbtn{
height:40px;
background-color:orange;
border:none;
font-weight:bold;
}


</style>
<body>
<div class="job-header">
<h2 style=" margin-left:30px;"><i class="fa-solid fa-business-time"></i>Job<span class="highlight">Portal</span></h2>
<button class="btn" onclick="window.location.href='UserDashboard.jsp';"> <i style="margin-right:10px;" class="fa-solid fa-arrow-right fa-rotate-180"></i>Back to home</button>
</div>
<div class="outer-div">
<div class="job-info">
<h5 style="margin-left:40px;margin-top:15px; font-weight:bold;">Job Summary</h5>
<div class="undo-div">
<i style="font-size:33px;  margin-left:150px;margin-top:20px;" class="fa-solid fa-briefcase"></i>
<h4 style="margin-left:80px; margin-top:10px; font-weight:bold;"><%= rs.getString("job_title") %></h4>
<p style="margin-left:100px; color:grey; font-weight:bold; margin-top:10px;"><%= rs.getString("company_name") %></p>
</div>

<div style="margin-top: 30px;">
<h6 style="margin-left:40px;">Location  <span style="color:grey; margin-left:160px;"><%= rs.getString("location") %></span></h6>
 <h6 style="margin-left:40px;">Job Type <span  style="color:grey; margin-left:160px;"><%= rs.getString("job_type") %></span></h6>
  <h6 style="margin-left:40px;">Experience <span style="color:grey; margin-left:145px;"><%= rs.getString("experience") %></span></h6>
 <h6 style="margin-left:40px;">Salary  <span style="color:grey; margin-left:180px; "><%= rs.getString("salary") %></span></h6>
 <h6 style="margin-left:40px;">Qualification   <span style="color:grey; margin-left:130px;"><%= rs.getString("qualification") %></span></h6>
 <h6 style="margin-left:40px;">Last date  <span style="color:grey; margin-left:160px;"><%= rs.getString("last_date") %></span></h6>
 
</div>

<h5 style="margin-left:20px; font-weight:bold; color:orange;">Job Description</h5>
<p style="margin-left:18px;margin-right:10px; font-size:13px; "><%= rs.getString("description") %></p>
 
 <h5 style="margin-left:20px; font-weight:bold; color:orange;">Skills</h5>
 <p style="margin-left:18px;margin-right:10px; font-size:13px; "><%= rs.getString("skills") %></p>
 

</div>
<%
    }
%>

<div class="apply-form ">
<h4 style="margin-top:20px; margin-left:40px; font-weight:bold;"><i style="color:orange ; margin-right:10px;" class="fa-solid fa-paper-plane"></i>Apply for this Job</h4>
<p style="color:grey;font-weight:bold; margin-left:50px;">Fill in your details to apply for this position</p>
<form action="ApplyJob" method="post" class=form-box enctype="multipart/form-data">
<input type="hidden" name="job_id" value="<%= jobId %>">
<div class="input-box" >
<label>Full Name<span class="highlight">*</span></label>
<input type="text" placeholder="Enter your Full Name" name="name" required>
</div>
<div class="input-box">
<label>Email Address<span class="highlight">*</span></label>
<input type="text" placeholder="Enter your email" name="email" required>
</div>
<div class="input-box">
<label>Phone Number <span class="highlight">*</span></label>
<input type="text" placeholder="Enter your phone number" name="phoneno" required>
</div>
<div class="input-box">
<label>Experience(in years)<span class="highlight">*</span></label>
<input type="text" placeholder="e.g 2" name="exp" required>




</div>
<div class="input-box">
<label>Qualification <span class="highlight">*</span> </label>
<select name="qualification" autocomplete="off">

                <option value="">
                    Select Qualification
                </option>

                <option>10th</option>

                <option>12th</option>

                <option>Diploma</option>

                <option>BCA</option>
                 <option>B.Tech</option>
                  <option>B.Sc</option>
                   <option>B.Com</option>
                    <option>BA</option>
                     <option>MCA</option>
                      <option>M.Tech</option>
                       <option>M.Sc</option>
                        <option>MBA</option>
                         <option>phD</option>
                          <option>Other</option>

            </select>
</div>

<div class="input-box">
<label>Current Location<span class="highlight">*</span></label>
<input type="text" placeholder="Enter your location" name="location" required>
</div>
<div class="input-box">
<label>College/University<span class="highlight">*</span></label>
<input type="text" placeholder="Enter your college/university" name="college" required>
</div>

<div class="input-box">
<label>Skills<span class="highlight">*</span></label>
<input type="text" placeholder="Enter your skills" name="skills" required>
</div>
<div class="input-box">
<label>Apply Date<span class="highlight">*</span></label>
<input type="date" name="date" required>
</div>

<div class="input-box">
<label>Resume/CV<span class="highlight">*</span></label>
<input type="file"  name="resume" accept=".pdf ,.doc ,.docx" required>
<small style="color:gray;">Only PDF,DOC,DOCX(Max 2 MB)</small>
</div>

<div class="input-box cover-letter">
<label>Cover letter<span class="highlight">*</span></label>
<input type="text" placeholder="Write a brief cover letter" name="cover" required>
</div>
<button type="submit" class="cover-letter subbtn">Submit Application</button>

</form>

</div>
 </div>
</body>
</html>