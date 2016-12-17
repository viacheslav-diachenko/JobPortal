<%-- 
    Document   : Login
    Created on : 16 Nov, 2016
    Author     : Chinmay vivek
--%>

<%@ page session="true" import ="java.sql.*" %>
<%
    try{
        
    String user = request.getParameter("user");    
    String pwd = request.getParameter("pass");
	
    Class.forName("com.mysql.jdbc.Driver");
	
	
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/job_portal?useSSL=false",
            "root", "root#12345");
    Statement st = con.createStatement();
    ResultSet rs;
    rs = st.executeQuery("select * from login where uname='" + user + "' and pass='" + pwd + "'");    
    //out.println("select was successful <br>" );
    if (rs.next()) {
        int userid = rs.getInt("id"); 
        //out.println("User ID: " + userid + "<br>" );
        session.setAttribute("user", user);
        String userType = rs.getString("userType");
        //out.println("User Type: " + userType + "<br>");
        if(userType.equals("Employer")) {
	        rs = st.executeQuery("select * from employer where userid ='" + userid + "'");
        	if(rs.next()) {
	        	String companyName = rs.getString("companyName"); 
        		String website = rs.getString("website");
            	session.setAttribute("companyName", companyName);
            	session.setAttribute("website", website);
            	session.setAttribute("userid", userid);
        		response.sendRedirect("employer_profile.jsp");
        		//out.print("Company name: " + companyName);
        	}
        }
    } else {
        out.println("Invalid lofin or password <a href='index.jsp'>try again</a>. You entered " + user + " / " + pwd);
    }
         
   }
   catch(Exception e){       
       out.println(e);       
   }      
%>