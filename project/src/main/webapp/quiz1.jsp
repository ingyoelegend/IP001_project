<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import = "java.io.PrintWriter" %>

<%@ page import = "java.util.*" %>



<!DOCTYPE html>
<html>
  <head>
    <meta name="viewport" content="width=device-width"/>
    <title>퀴즈</title>
    <link rel="stylesheet" href="" />
  </head>

  <body>
   
<%
Date dt = new Date();
%>


       <form action="quiz1Post.jsp" method="post">
       
       	  <input type="text" placeholder="" name = "" required />
       	  
       	  
      	  <input type="submit" value="제출" id = "submit" />
    
       </form>
       
          

  </body>
</html>
