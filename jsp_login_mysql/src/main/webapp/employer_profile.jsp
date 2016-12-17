<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
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
<meta "content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<style>
/* The Modal (background) */
.modal {
	display: none; /* Hidden by default */
	position: fixed; /* Stay in place */
	z-index: 1; /* Sit on top */
	padding-top: 100px; /* Location of the box */
	left: 0;
	top: 0;
	width: 100%; /* Full width */
	height: 100%; /* Full height */
	overflow: auto; /* Enable scroll if needed */
	background-color: rgb(0, 0, 0); /* Fallback color */
	background-color: rgba(0, 0, 0, 0.4); /* Black w/ opacity */
}

/* Modal Content */
.modal-content {
	position: relative;
	background-color: #fefefe;
	 margin: auto; 
	padding: 0;
	border: 1px solid #888;
	width: 30%;
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0
		rgba(0, 0, 0, 0.19);
	-webkit-animation-name: animatetop;
	-webkit-animation-duration: 0.4s;
	animation-name: animatetop;
	animation-duration: 0.4s
}

/* Add Animation */
@
-webkit-keyframes animatetop {
	from {top: -300px;
	opacity: 0
}

to {
	top: 0;
	opacity: 1
}

}
@
keyframes animatetop {
	from {top: -300px;
	opacity: 0
}

to {
	top: 0;
	opacity: 1
}

}

/* The Close Button */
.close {
	color: white;
	float: right;
	font-size: 28px;
	font-weight: bold;
}

.close:hover, .close:focus {
	color: #000;
	text-decoration: none;
	cursor: pointer;
}

.modal-header {
	padding: 2px 16px;
	background-color: #5cb85c;
	color: white;
}

.modal-body {
	padding: 2px 16px;
}

.modal-footer {
	padding: 2px 16px;
	background-color: #5cb85c;
	color: white;
}

.jobTable {
	margin-left: 20px;
}

.jobRow td {
	background-color: #F7F7F7; 
	border: 1px solid;
	padding: 6px;
	margin: 10px;
}

.tableHeader td {
	font-weight: bold;
	border: 1px solid;
	padding: 6px;
	margin: 10px;
	background-color: #87CEFA;
}

body {margin:5px;padding:0px}

</style>
<title>Insert title here</title>
</head>
<body>
	<%@ page import="java.sql.*"%>
	<%
		try {
			
			String cn = (String)session.getAttribute("companyName");
			String ws = (String)session.getAttribute("website");			
			int userid = (Integer)session.getAttribute("userid");
			int companyId = 0;

			//session.setAttribute("companyName", cn);
			
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/job_portal?useSSL=false",
					"root", "root#12345");
			Statement st = con.createStatement();
			ResultSet rs;
			rs = st.executeQuery("select * from employer where userid = " + userid);
			if(rs.next()) {
				companyId = rs.getInt("id");
				session.setAttribute("companyId", companyId);
			}

			out.print("<h1 style='display: inline' id='company'>" + cn
					+ "</h1><br><h2 style='display: inline'>company profile</h2>");
			out.print("<br>Web site: <a id='siteurl' href='" + ws + "'>" + ws + "</a><br>");
			out.print("User Id: " + userid);
			out.print("<br><br><a href='logout.jsp'>Log out</a><hr>");
			
			
			rs = st.executeQuery("select * from job where companyId = " + companyId);
			if(rs.next()) {				 
				out.print("<table class='jobTable'>");
				out.print("<tr class='tableHeader'><td>Job ID</td><td>Vacancy City</td><td>Job position</td><td>Salary</td></tr>");
				String city = rs.getString("city");
				String position = rs.getString("post");
				int salary = rs.getInt("salary");
				int jobid = rs.getInt("id");
				String jobInfo = rs.getString("job_desc");
				out.print("<tr class='jobRow'>");
				out.print("<td>" + jobid + "</td>");
				out.print("<td>" + city + "</td>");
				out.print("<td>" + position + "</td>");
				out.print("<td>" + salary + "</td>");
				out.print("</tr>");
				while(rs.next()) {
					city = rs.getString("city");
					position = rs.getString("post");
					salary = rs.getInt("salary");
					jobid = rs.getInt("id");
					jobInfo = rs.getString("job_desc");
					out.print("<tr class='jobRow'>");
					out.print("<td>" + jobid + "</td>");
					out.print("<td>" + city + "</td>");
					out.print("<td>" + position + "</td>");
					out.print("<td>" + salary + "</td>");
					out.print("</tr>");
				}
			out.print("</table>");								
			} else {
				out.print("<h3> No added vacancies yet. Add a new vacancy.</h3>");
			}


		} catch (Exception e) {
			out.println(e);
		}
	%>
	<!-- Trigger/Open The Modal -->
	<br>
	<button id="myBtn">Add a new vacancy</button>
	
	<!-- The Modal -->
	<div id="myModal" class="modal">

		<!-- Modal content -->
		<div class="modal-content">
			<div class="modal-header">
				<span class="close">&times;</span>
				<h2>Adding a new job</h2>
			</div>
			<div class="modal-body">
				<form class="form-horizontal" method="POST" action="dbinsert_job.jsp">
					<fieldset>

						<!-- Form Name 
<legend>Employer registration</legend> -->

						<!-- Text input-->
						<div class="form-group">
							<label class="col-md-4 control-label" for="companyName">Company
								Name</label>
							<div class="col-md-7">
								<input id="companyName" name="companyName" type="text"
									placeholder="Enter the company name you represent"
									class="form-control input-md" required="">

							</div>
						</div>

						<!-- Text input-->
						<div class="form-group">
							<label class="col-md-4 control-label" for="website">Web-Site</label>
							<div class="col-md-7">
								<input id="website" name="website" type="text"
									placeholder="Enter your company" class="form-control input-md">

							</div>
						</div>

						<!-- Text input-->
						<div class="form-group">
							<label class="col-md-4 control-label" for="city">City</label>
							<div class="col-md-7">
								<input id="city" name="city" type="text"
									placeholder="Enter the City" class="form-control input-md" required="">

							</div>
						</div>

						<!-- Text input-->
						<div class="form-group">
							<label class="col-md-4 control-label" for="position">Position</label>
							<div class="col-md-7">
								<!-- <input id="position" name="position" type="text" placeholder="Enter the position" class="form-control input-md"> -->
								<select id="jobRole" name="jobRole" class="form-control">
									<option value="Systems Administrator">Systems Administrator</option>
									<option value="Systems Architect">Systems Architect</option>
									<option value="QA Engineer">QA Engineer</option>
									<option value="Front-End developer">Front-End developer</option>
									<option value="Back-End developer">Back-End developer</option>
									<option value="Business analyst">Business analyst</option>
									<option value="ERP or CRM systems consultant">ERP or CRM systems consultant</option>
								</select>
							</div>
						</div>

						<!-- Text input-->
						<div class="form-group">
							<label class="col-md-4 control-label" for="salary">Salary</label>
							<div class="col-md-7">
								<input id="salary" name="salary" type="text"
									placeholder="Enter the salary" class="form-control input-md">

							</div>
						</div>

						<!-- Textarea -->
						<div class="form-group">
							<label class="col-md-4 control-label" for="jobDesc">Job
								Description</label>
							<div class="col-md-7">
								<textarea class="form-control" id="jobDesc" name="jobDesc"></textarea>
							</div>
						</div>

						<!-- Button (Double) -->
						<div class="form-group">
							<label class="col-md-4 control-label" for="submit"></label>
							<div class="col-md-8">
								<button id="submit" name="submit" class="btn btn-success">Submit
									form</button>
								<button type="button" id="cancel" name="cancel"
									class="btn btn-danger">Cancel</button>
					</fieldset>
				</form>
			</div>
		</div>

		<!-- </fieldset> -->
		<!-- </form> -->
	</div>
	<!--     <div class="modal-footer">
      <h3>Modal Footer</h3>
    </div>
 -->
	</div>

	</div>

	<script>
		// Get the modal
		var modal = document.getElementById('myModal');

		// Get the button that opens the modal
		var btn = document.getElementById("myBtn");

		// Get the <span> element that closes the modal
		var span = document.getElementsByClassName("close")[0];
		var cancel = document.getElementById("cancel");
		var company = document.getElementById("company").innerHTML;
		var companyName = document.getElementById("companyName");
		var siteUrl = document.getElementById("siteurl").innerHTML;

		// When the user clicks the button, open the modal 
		btn.onclick = function() {
			//alert("Company name is: " + companyName);
			modal.style.display = "block";
			companyName.value = company;
			website.value = siteUrl;
			//alert(companyName.innerHTML);
		}

		// When the user clicks on <span> (x), close the modal
		span.onclick = function() {
			modal.style.display = "none";
		}

		cancel.onclick = function() {
			modal.style.display = "none";
		}

		// When the user clicks anywhere outside of the modal, close it
		window.onclick = function(event) {
			if (event.target == modal) {
				modal.style.display = "none";
			}
		}
	</script>
</body>
</html>