<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import = "java.io.PrintWriter" %>

<%@ page import = "java.util.*" %>

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
   

    <%
    request.getParameter();
    //한개 가져오기
    
    
    String [] value = request.getParameterValues();
   
    //체크박스같이 여러개 값 가져오기
    
    for(String val : value)
    {
    	
    }
    
    %>

  </body>
</html>
