<%@ page session="true" import ="java.sql.*, java.io.*" %>
<%
	StringWriter sw = new StringWriter();  
	PrintWriter pw = new PrintWriter(sw);  


	try{
    String user = request.getParameter("user");    
    String pwd = request.getParameter("pass1");
    String pwd2 = request.getParameter("pass2");
    String userType = request.getParameter("userType");
    
    
    if (!pwd.equals(pwd2)) {
    	out.println("Entered passwords don't match<br>" + pwd + " / " + pwd2 + "<br>");
    	out.println("Please, return to the <a href='index_reg.jsp'>Register Page</a> and try again");
    	return;
    }
    
    
    Class.forName("com.mysql.jdbc.Driver");
    session.setAttribute("user", user);
	
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/job_portal?useSSL=false",
            "root", "root#12345");
    Statement st = con.createStatement();
    st.executeUpdate("insert into login(uname, pass, userType) values('"+user+"','"+pwd+"','"+userType+"')");
    if (userType.equals("Applicant")) {
    	response.sendRedirect("register_applicant.jsp");	
    } else {
    	response.sendRedirect("register_employer.jsp");
    }
    
	//out.print("Congratulations " + userid + "! You successfully registred as an" + userType);	         
   }
   catch(Exception e){       
	   e.printStackTrace(pw);  
	   out.print(sw);  
	   sw.close();  
	   pw.close();  	          
   }      
%>