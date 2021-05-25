<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "userQuiz.UserController" %>
<%@ page import = "userQuiz.User" %>
<%@ page import = "java.io.PrintWriter" %>
<%@ page import = "java.util.ArrayList" %>
<%
request.setCharacterEncoding("UTF-8");
%>

<jsp:useBean id = "student" class = "userQuiz.User" scope = "page"/>
<jsp:setProperty name = "student" property = "id"/>
<jsp:setProperty name = "student" property = "name"/>
 <jsp:setProperty name = "student" property = "snum"/>
<jsp:setProperty name = "student" property = "year"/>
<jsp:setProperty name = "student" property = "pass"/> 
 <jsp:setProperty name = "student" property = "email"/>




<!DOCTYPE html>
<html>
  <head>
    <meta name="viewport" content="width=device-width"/>
    <title>퀴즈2</title>
    <link rel="stylesheet" href="" />
  </head>

  <body>
  
  <%
  
 
  UserController userc = new UserController();
  
  int result = userc.join(student);
  

  
  %>
  
  <h2>JavaBean StudentBean을 이용한 예제</h2>
  <hr>
  <h3>폼에서 전달받은 학생정보를 그대로 자바빈 StudentBean에 저장</h3>
   <hr>
  <h4>JavaBean StudentBean에 저장된 정보를 조회 출력</h4>
    
    학생 ID:  <jsp:getProperty name = "student" property = "id"/><br>
    학생 이름:  <jsp:getProperty name = "student" property = "name"/><br>
    학생 번호:  <jsp:getProperty name = "student" property = "snum"/><br>
    나이(생년): <%=student.getAge() %>(<jsp:getProperty name = "student" property = "year"/>) <br>
    암호: <jsp:getProperty name = "student" property = "pass"/> <br>
    전자메일:  <jsp:getProperty name = "student" property = "email"/><br>
  
  </body>
</html>
