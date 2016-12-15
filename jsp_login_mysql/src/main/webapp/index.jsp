<!DOCTYPE html>
<!--  Test for GutHub -->
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="robots" content="noindex">

   <title>login and registration in jsp</title>
        <link href="favicon.ico" rel="icon" type="image/x-icon" />
        <link href="favicon.ico" rel="shortcut icon" type="image/x-icon" />
        
		
        <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css" type="text/css">
    <style type="text/css">
    @import url(http://fonts.googleapis.com/css?family=Roboto);

/****** LOGIN MODAL ******/
th, td {
    padding: 2px;
    text-align: left;    
}

#register-td {padding-left:105px;} 

table {border: none;}

.loginmodal-container {
  padding: 30px;
  max-width: 350px;
  width: 100% !important;
  background-color: #F7F7F7;
  margin: 0 auto;
  border-radius: 2px;
  box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
  overflow: hidden;
  font-family: roboto;
}

.loginmodal-container h1 {
  text-align: center;
  font-size: 1.8em;
  font-family: roboto;
}

.loginmodal-container input[type=submit] {
  width: 100%;
  display: block;
  margin-bottom: 10px;
  position: relative;
}

.loginmodal-container input[type=text], input[type=password] {
  height: 44px;
  font-size: 16px;
  width: 100%;
  margin-bottom: 10px;
  -webkit-appearance: none;
  background: #fff;
  border: 1px solid #d9d9d9;
  border-top: 1px solid #c0c0c0;
  /* border-radius: 2px; */
  padding: 0 8px;
  box-sizing: border-box;
  -moz-box-sizing: border-box;
}

.loginmodal-container input[type=text]:hover, input[type=password]:hover {
  border: 1px solid #b9b9b9;
  border-top: 1px solid #a0a0a0;
  -moz-box-shadow: inset 0 1px 2px rgba(0,0,0,0.1);
  -webkit-box-shadow: inset 0 1px 2px rgba(0,0,0,0.1);
  box-shadow: inset 0 1px 2px rgba(0,0,0,0.1);
}

.loginmodal {
  text-align: center;
  font-size: 14px;
  font-family: 'Arial', sans-serif;
  font-weight: 700;
  height: 36px;
  padding: 0 8px;
/* border-radius: 3px; */
/* -webkit-user-select: none;
  user-select: none; */
}

.loginmodal-submit {
  /* border: 1px solid #3079ed; */
  border: 0px;
  color: #fff;
  text-shadow: 0 1px rgba(0,0,0,0.1); 
  background-color: #4d90fe;
  padding: 17px 0px;
  font-family: roboto;
  font-size: 14px;
  /* background-image: -webkit-gradient(linear, 0 0, 0 100%,   from(#4d90fe), to(#4787ed)); */
}

.loginmodal-submit:hover {
  /* border: 1px solid #2f5bb7; */
  border: 0px;
  text-shadow: 0 1px rgba(0,0,0,0.3);
  background-color: #357ae8;
  /* background-image: -webkit-gradient(linear, 0 0, 0 100%,   from(#4d90fe), to(#357ae8)); */
}

.loginmodal-container a {
  text-decoration: none;
  color: #666;
  font-weight: 400;
  text-align: center;
  display: inline-block;
  opacity: 0.6;
  transition: opacity ease 0.5s;
} 

.login-help{
  font-size: 12px;
}
    </style>
    <script src="//code.jquery.com/jquery-1.10.2.min.js"></script>
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
    </head>
<body>

<!--      
  	<a href="#" data-toggle="modal" data-target="#login-modal">Loginnn</a> ||
	<a href="#" data-toggle="modal" data-target="#register-modal">Register</a>
-->


  
<script>
// This would automatically run when page loads.
$(document).ready(function() {
$("#login-modal").modal('show');
});
</script>


<div class="modal fade" id="login-modal" role="dialog" aria-labelledby="myModalLabel" tabindex="-1" aria-hidden="true" style="display: none;">
    	  <div class="modal-dialog">
				<div class="loginmodal-container">
					<h1>Login to Your Account</h1><br>
					<form method ="POST" action="login.jsp">
					<input type="text" name="user" placeholder="Username" >
					<input type="password" name="pass" placeholder="Password">
					<input type="submit" name="login" class="login loginmodal-submit" value="Login">
				  </form>
				  <div class="login-help">
					<a href="#" data-toggle="modal" data-target="#register-modal">Register</a> - <a href="#">Forgot Password</a>
				  </div>
				</div>
			</div>
		  </div>
	
	<div class="modal fade" id="register-modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
    	  <div class="modal-dialog">
				<div class="loginmodal-container">
					<h1>Signup for Account</h1><br>
					
				  <form method ="POST" action="register.jsp">
				  	<table width="290px">
						<tr>
						<td width="100"><input type="radio" name="userType" value="Applicant" checked="checked">Applicant</td>
						<td id="register-td"><input type="radio" name="userType" value="Employer"> Employer</td>
						</tr>
					</table>				  
					<input type="text" name="user" placeholder="Username">
					<input type="password" name="pass1" placeholder="Password">
					<input type="password" name="pass2" placeholder="Confirm Password">
					<input type="submit" name="Register" class="login loginmodal-submit" value="Register">
				  </form>
				  	<div class="login-help">
			  		 <a href="index.jsp">Back to Login Section</a>
			  		</div>				 		  
				</div>
			</div>
		  </div>
</body>
</html>

