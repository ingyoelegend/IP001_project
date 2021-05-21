<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "userQuiz.UserController" %>
<%@ page import = "userQuiz.User" %>
<%@ page import = "java.io.PrintWriter" %>
<%@ page import = "java.util.ArrayList" %>
<%
request.setCharacterEncoding("UTF-8");
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>퀴즈</title>
</head>
<body>
<%



	UserController auth = new UserController();
     ArrayList<User> user = auth.profile();
	 
	 if(user == null)
	 {
		 PrintWriter script = response.getWriter();
     	 script.println("<script>");
     	 script.println("alert('데이터베이스 오류.')");
       	 script.println("location.href = 'joinQuiz.jsp'");
     	 script.println("</script>");
	 }
	 else
	 {
		 
%>

<%

for(int i = 0; i < user.size(); i++)
{

%>

    <span><%=user.get(i).getUserID()%></span> 
    <br>
     <span><%=user.get(i).getUserName()%></span> 
      <br>
     <span><%=user.get(i).getUserGender()%></span> 
      <br>
     <span><%=user.get(i).getUserHobby()%></span> 
      <br>
     <span><%=user.get(i).getUserPhone()%></span> 
       <br>
       <br>

<%
}
%>

<%
	 }
		
%>
		
</body>
</html>