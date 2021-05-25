<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "userQuiz.User1" %>
<%@ page import = "java.io.PrintWriter" %>
<%@ page import = "java.util.ArrayList" %>
<%
request.setCharacterEncoding("UTF-8");
%>

<jsp:useBean id = "score" class = "userQuiz.User1" scope = "page"/>
<jsp:setProperty name = "score" property = "point"/>
<jsp:setProperty name = "score" property = "name"/>




<!DOCTYPE html>
<html>
  <head>
    <meta name="viewport" content="width=device-width"/>
    <title>퀴즈</title>
    <link rel="stylesheet" href="" />
  </head>

  <body>
  
  <h2>JavaBeans을 이용한 학생의 점수에 따른 성적 처리 예제</h2>
  <hr>
  <h3>폼에서 전달받은 이름과 성적은 JavaBeans GradeBean에 저장</h3>
    이름: <%=request.getParameter("name") %>,
    성적:  <%=request.getParameter("point") %><p>
    
  
   <hr>

  <h4>JavaBeans GradeBean에 저장된 정보를 조회 출력</h4>
    
    이름:  <jsp:getProperty name = "score" property = "name"/><br>
    성적:  <jsp:getProperty name = "score" property = "point"/><br>
    등급:  <jsp:getProperty name = "score" property = "grade"/><br>
   
  
  </body>
</html>
