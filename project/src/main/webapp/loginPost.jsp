<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "user.UserController" %>
<%@ page import = "java.io.PrintWriter" %>
<%
request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id = "user" class = "user.User" scope = "page"/>
<jsp:setProperty name = "user" property = "userID"/>
<jsp:setProperty name = "user" property = "userPassword"/>

<!DOCTYPE html>
<html>
  <head>
    
    <meta name="viewport" content="width=device-width" />
    <title>영기PC</title>
    <link rel="stylesheet" href="css/login.css" />
  </head>

  <body>
     <%
     UserController userAuth = new UserController();
          int result = userAuth.login(user.getUserID(),user.getUserPassword());
          if(result == 1)
          {
         	 PrintWriter script = response.getWriter();
         	 session.setAttribute("userID", user.getUserID());
         	 script.println("<script>");
         	 script.println("location.href = 'index.jsp'");
         	 script.println("</script>");
         	 
          }
          else if(result == 0)
          {
         	 PrintWriter script = response.getWriter();
         	 script.println("<script>");
         	 script.println("alert('비밀번호가 틀립니다.')");
           	 script.println("history.back()");
         	 script.println("</script>");
          }
          else if(result == -1)
          {
         	 PrintWriter script = response.getWriter();
         	 script.println("<script>");
         	 script.println("alert('아이디가 존재하지 않습니다.')");
           	 script.println("history.back()");
         	 script.println("</script>");
          }
          else if(result == 0)
          {
         	 PrintWriter script = response.getWriter();
         	 script.println("<script>");
         	 script.println("alert('데이터베이스 오류가 발생했습니다.이용에 불편함을 드려 죄송합니다.')");
           	 script.println("history.back()");
         	 script.println("</script>");
          }
     %>
  </body>
</html>
