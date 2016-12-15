<%
    if ((session.getAttribute("userid") == null) || (session.getAttribute("userid") == "")) {
%>
<script>
alert("You are not logged in. \n Please log in.");
window.location.href = "index.jsp";
</script>
<%} else {
%>
Welcome <%=session.getAttribute("userid")%>
<a href='logout.jsp'>Log out</a>
<%
    }
%>