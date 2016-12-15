<%-- 
    Document   : Login
    Created on : 16 Nov, 2016
    Author     : Chinmay vivek
--%>

<%@ page import ="java.sql.*" %>
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
    if (rs.next()) {
        session.setAttribute("used", user);
        out.println("welcome very much" + user);
        out.println("<a href='logout.jsp'>Log out</a>");
        response.sendRedirect("success.jsp");
    } else {
        out.println("Invalid password <a href='index.jsp'>try again</a>. You entered " + user + " / " + pwd);
    }
         
   }
   catch(Exception e){       
       out.println(e);       
   }      
%>