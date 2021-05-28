<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.io.PrintWriter" %>
<%@ page import = "java.util.ArrayList" %>
<%
request.setCharacterEncoding("UTF-8");
%>


<!DOCTYPE html>
<html>
  <head>
    <meta name="viewport" content="width=device-width"/>
    <title>퀴즈</title>
    <link rel="stylesheet" href="" />
  </head>

  <body>
  
  <h2>이름과 점수를 입력하세요</h2>
  
  <form name = "student" method = "post" action = "grade.jsp">
  
  

 이름: <input type = "text" name = "name" size = 16>
 <br>
점수: <input type = "text" name = "point" size = 3><p>
  
 
 
     
  <input type = "submit" name = "submit" value = "입력완료">
    <input type = "reset" name = "reset" value = "다시쓰기">
 

  
  </form>
    

    
  
  </body>
</html>
