<%@ page session="true" import="java.sql.*, java.io.*"%>
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
<%
	StringWriter sw = new StringWriter();
	PrintWriter pw = new PrintWriter(sw);

	try {
		String companyName = request.getParameter("companyName");
		String website = request.getParameter("website");
		String jobRole = request.getParameter("userType");
		String firstName = request.getParameter("firstName");
		String lastName = request.getParameter("lastName");
		String email = request.getParameter("email");
		String comments = request.getParameter("comments");
		session.setAttribute("companyName", companyName);
		session.setAttribute("website", website);
		
		Class.forName("com.mysql.jdbc.Driver");

		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/job_portal?useSSL=false",
				"root", "root#12345");
		Statement st = con.createStatement();
		ResultSet rs;
		rs = st.executeQuery("select id from login ORDER BY id DESC LIMIT 1");
		if (rs.next()) {
			int userid = rs.getInt("id");
			session.setAttribute("userid", userid);
			st.executeUpdate(
					"insert into employer(userid, companyName, contactFirstName, contactLastName, email, website, comments) values ('"
							+ userid + "','" + companyName + "','" + firstName + "','" + lastName + "','" + email + "','" + website + "','" + comments +"')");
			response.sendRedirect("employer_profile.jsp");

		}		
		
		//out.print("Congratulations " + userid + "! You successfully registred as an" + userType);	         
	} catch (Exception e) {
		//e.printStackTrace(pw);
		out.print(e);
		//sw.close();
		//pw.close();
	}
%>