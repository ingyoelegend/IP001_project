<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "userQuiz.UserController" %>
<%@ page import = "java.io.PrintWriter" %>
<%
request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id = "user" class = "userQuiz.User" scope = "page"/>
<jsp:setProperty name = "user" property = "userPhone"/>
<jsp:setProperty name = "user" property = "userGender"/>
<jsp:setProperty name = "user" property = "userName"/>
<jsp:setProperty name = "user" property = "userHobby"/>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>퀴즈</title>
</head>
<body>
<%



	 UserController userAuth = new UserController();
	 int result = userAuth.join(user);
	 
	 if(result == -1)
	 {
		 PrintWriter script = response.getWriter();
     	 script.println("<script>");
     	 script.println("alert('데이터베이스 오류.')");
       	 script.println("location.href = 'joinQuiz.jsp'");
     	 script.println("</script>");
	 }
	 else
	 {
		 PrintWriter script = response.getWriter();
		 script.println("<script>");
		 script.println("location.href = 'joinQuiz.jsp'");
	  	 script.println("</script>");
	 }
	
	 


%>
</body>
</html>