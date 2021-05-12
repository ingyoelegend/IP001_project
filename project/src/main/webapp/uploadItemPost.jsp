<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "board.BoardController" %>
<%@ page import = "java.io.PrintWriter" %>
<%@ page import = "user.UserController" %>
<%
request.setCharacterEncoding("UTF-8");
%>

<!DOCTYPE html>
<html>
  <head>
    <meta name="viewport" content="width=device-width"/>
    <title>영기PC</title>
    <link rel="stylesheet" href="css/uploadItem.css" />
  </head>

  <body>
    <%
        UserController us = new UserController();
        
    	if(session.getAttribute("userID") == null)
    	{
    		 PrintWriter script = response.getWriter();
        	
        	 script.println("<script>");
        	 script.println("alert('로그인 후에 이용해주세요.')");
        	 script.println("history.back()");
        	 script.println("</script>");
        	
    	}
        
        if(us.getOpCode((String)session.getAttribute("userID")) != 1)
        {     
        	 PrintWriter script = response.getWriter();
        	
        	 script.println("<script>");
        	 script.println("alert('관리자 권한을 보유하고 있지 않습니다.')");
        	 script.println("history.back()");
        	 script.println("</script>");
        	
        }
       
        %>
        
        
        <%
        
        String directory = application.getRealPath("/upload/");
        int maxSize = 1024*1024*100;
        String encoding = "UTF-8";
        
        
        %>
 


    
    <script
      src="https://kit.fontawesome.com/d19eaaab15.js"
      crossorigin="anonymous"
    ></script>

  </body>
</html>
