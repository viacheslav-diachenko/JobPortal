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
		
	try {
		String companyName = request.getParameter("companyName");
		String website = request.getParameter("website");
		String city = request.getParameter("city");
		String position = request.getParameter("jobRole");
		String salary = request.getParameter("salary");
		String jobDesc = request.getParameter("jobDesc");
		Integer companyId = (Integer)session.getAttribute("companyId");
				
 		Class.forName("com.mysql.jdbc.Driver");

		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/job_portal?useSSL=false",
				"root", "root#12345");
		Statement st = con.createStatement();
		ResultSet rs;
		rs = st.executeQuery("select id from login ORDER BY id DESC LIMIT 1");
		if (rs.next()) {
			if(salary == null) {
				salary = "N/A";
			}
			int userid = rs.getInt("id");
			session.setAttribute("userid", userid);
			st.executeUpdate(
					"insert into job(companyId, city, post, salary, job_desc) values ('"
							+ companyId + "','" + city + "','" + position + "','" + salary + "','" + jobDesc +"')");
			response.sendRedirect("employer_profile.jsp");

		} 		
		
		//out.print("Congratulations " + userid + "! You successfully registred as an" + userType);	         
	} catch (Exception e) {
		out.print(e);
	}
%>