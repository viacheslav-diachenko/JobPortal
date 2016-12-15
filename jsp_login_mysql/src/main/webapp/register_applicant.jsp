<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%if ((session.getAttribute("user") == null) || (session.getAttribute("user") == "")) {%>
<script>
alert("You are not logged in. \n Please log in.");
window.location.href = "index.jsp";
</script>
<%
    }
%>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css" type="text/css">
    <script src="//code.jquery.com/jquery-1.10.2.min.js"></script>
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
    
<title>Insert title here</title>
</head>
<body>
<h1 align="center">Applicant registration</h1>
<hr>
<form class="form-horizontal">
<fieldset>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="firstName">First Name</label>  
  <div class="col-md-4">
  <input id="firstName" name="firstName" type="text" placeholder="Enter your First Name" class="form-control input-md">
    
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="lastName">Last Name</label>  
  <div class="col-md-4">
  <input id="lastName" name="lastName" type="text" placeholder="Enter your Last Name" class="form-control input-md">
    
  </div>
</div>

<!-- Multiple Radios -->
<div class="form-group">
  <label class="col-md-4 control-label" for="gender">Gender</label>
  <div class="col-md-4">
  <div class="radio">
    <label for="gender-0">
      <input type="radio" name="gender" id="gender-0" value="m" checked="checked">
      Male
    </label>
	</div>
  <div class="radio">
    <label for="gender-1">
      <input type="radio" name="gender" id="gender-1" value="f">
      Female
    </label>
	</div>
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="city">City</label>  
  <div class="col-md-4">
  <input id="city" name="city" type="text" placeholder="Enter the city you are living in" class="form-control input-md">
    
  </div>
</div>

<!-- Select Basic -->
<div class="form-group">
  <label class="col-md-4 control-label" for="jobRole">Job role</label>
  <div class="col-md-4">
    <select id="jobRole" name="jobRole" class="form-control">
      <option value="sysadmin">Systems Administrator</option>
      <option value="sysarchitect">Systems Architect</option>
      <option value="qaEngineer">Q&amp;A Engineer</option>
      <option value="feDeveloper">Front-End developer</option>
      <option value="beDeveloper">Back-End developer</option>
      <option value="ba">Business analyst</option>
      <option value="consultant">ERP or CRM systems consultant</option>
    </select>
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="phone">Phone number</label>  
  <div class="col-md-4">
  <input id="phone" name="phone" type="text" placeholder="Enter your phone number" class="form-control input-md">
    
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="email">Email address</label>  
  <div class="col-md-4">
  <input id="email" name="email" type="text" placeholder="Enter you E-mail address" class="form-control input-md">
    
  </div>
</div>

<!-- Textarea -->
<div class="form-group">
  <label class="col-md-4 control-label" for="comments">Additional info about yourself</label>
  <div class="col-md-4">                     
    <textarea class="form-control" id="comments" name="comments"></textarea>
  </div>
</div>

<!-- Button (Double) -->
<div class="form-group">
  <label class="col-md-4 control-label" for="submit"></label>
  <div class="col-md-8">
    <button id="submit" name="submit" class="btn btn-success">Submit form</button>
    <button id="cancel" name="cancel" class="btn btn-danger" onclick="window.location='index.jsp';return false;">Cancel</button>    
  </div>
</div>

</fieldset>
</form>

</body>
</html>