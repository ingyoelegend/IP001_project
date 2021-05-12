<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "user.UserController" %>
<%@ page import = "java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영기PC</title>
</head>
<body>

 <%
 	 if(session.getAttribute("userID") == null)
 	 {
 		 
 	  PrintWriter script = response.getWriter();
	  script.println("<script>");
  	  script.println("alert('로그인 후에 이용해주세요.')");
  	  script.println("</script>");
  	  
	  response.sendRedirect("login.jsp");
	  
 	 }
  %>

<%
session.invalidate();
response.sendRedirect("index.jsp");

%>
</body>
</html>