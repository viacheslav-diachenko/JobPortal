<%@ page session="true" language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
	if ((session.getAttribute("user") == null) || (session.getAttribute("user") == "")) {
%>
<script>
	alert("You are not logged in. \n Please log in.");
	window.location.href = "index.jsp";
</script>
<%
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css" type="text/css">
    <script src="//code.jquery.com/jquery-1.10.2.min.js"></script>
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
</head>
<body>
<form class="form-horizontal" method ="POST" action="dbinsert_employer.jsp">
<fieldset>

<!-- Form Name -->
<h1 align="center">Employer registration</h1>
<hr>
<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="companyName">Company Name</label>  
  <div class="col-md-4">
  <input id="companyName" name="companyName" type="text" placeholder="Enter the company name you represent" class="form-control input-md">
    
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="firstName">Company contact First Name </label>  
  <div class="col-md-4">
  <input id="firstName" name="firstName" type="text" placeholder="Enter contact First name" class="form-control input-md">
  <span class="help-block">Enter the first name of the person how represents your company</span>  
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="lastName">Company contact Last Name </label>  
  <div class="col-md-4">
  <input id="lastName" name="lastName" type="text" placeholder="Enter contact Last Name" class="form-control input-md">
  <span class="help-block">Enter the last name of the person how represents your company</span>  
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="email">E-mail address</label>  
  <div class="col-md-4">
  <input id="email" name="email" type="text" placeholder="Enter e-mail address" class="form-control input-md">
  <span class="help-block">Enter the email address of the responsible person who will contact applicants</span>  
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="website">Web-Site</label>  
  <div class="col-md-4">
  <input id="website" name="website" type="text" placeholder="Enter your company's website" class="form-control input-md">
    
  </div>
</div>

<!-- Textarea -->
<div class="form-group">
  <label class="col-md-4 control-label" for="comments">Additional info</label>
  <div class="col-md-4">                     
    <textarea class="form-control" id="comments" name="comments"></textarea>
  </div>
</div>

<!-- Button (Double) -->
<div class="form-group">
  <label class="col-md-4 control-label" for="submit"></label>
  <div class="col-md-8">
    <button id="submit" name="submit" class="btn btn-success" type="submit">Submit form</button>
    <button id="cancel" name="cancel" class="btn btn-danger" onclick="window.location='index.jsp';return false;">Cancel</button>
  </div>
</div>

</fieldset>
</form>


</body>
</html>