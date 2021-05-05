<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "user.UserController" %>
<%@ page import = "java.io.PrintWriter" %>
<%
request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id = "user" class = "user.User" scope = "page"/>
<jsp:setProperty name = "user" property = "userID"/>
<jsp:setProperty name = "user" property = "userPassword"/>
<jsp:setProperty name = "user" property = "userName"/>
<jsp:setProperty name = "user" property = "userAddress"/>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영기PC</title>
</head>
<body>
<%

if(user.getUserID() == null ||user.getUserPassword() == null ||user.getUserName() == null ||user.getUserAddress() == null)
{
	 PrintWriter script = response.getWriter();
 	 script.println("<script>");
 	 script.println("alert('입력이 안된 정보가 있습니다. 다시 입력해주세요.')");
   	 script.println("history.back()");
 	 script.println("</script>");
}
else
{
	 UserController userAuth = new UserController();
	 int result = userAuth.join(user);
	 
	 if(result == -1)
	 {
		 PrintWriter script = response.getWriter();
     	 script.println("<script>");
     	 script.println("alert('이미 존재하는 이메일 입니다.')");
       	 script.println("history.back()");
     	 script.println("</script>");
	 }
	 else
	 {
		 PrintWriter script = response.getWriter();
     	 script.println("<script>");
     	 script.println("alert('회원가입이 완료되었습니다. 로그인 후에 이용해주세요.')");
       	 script.println("location.href = 'login.jsp'");
     	 script.println("</script>");
	 }
	 
}

%>
</body>
</html>