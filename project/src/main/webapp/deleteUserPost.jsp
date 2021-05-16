<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.io.PrintWriter" %>
<%@ page import = "user.UserController" %>
<%@ page import = "com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import = "com.oreilly.servlet.MultipartRequest" %>
<%@ page import = "item.Item" %>
<%@ page import = "item.ItemController" %>


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
        	 script.println("location.href = 'login.jsp'");
        	 script.println("</script>");
        	
    	}
        
        if(us.getOpCode((String)session.getAttribute("userID")) != 1)
        {     
        	 PrintWriter script = response.getWriter();
        	
        	 script.println("<script>");
        	 script.println("alert('관리자 권한을 보유하고 있지 않습니다.')");
        	 script.println("location.href = 'index.jsp'");
        	 script.println("</script>");
        	
        }
             
        %>
            
       
         
       <%
       
       String userID = request.getParameter("userID");
       
       UserController user = new UserController();
       
       int result = user.delete(userID);
       
       if(result == -1)
       {
    	   PrintWriter script = response.getWriter();
       	 script.println("<script>");
       	 script.println("alert('존재하지 않는 이메일 입니다.')");
         	 script.println("location.href = 'login.jsp'");
       	 script.println("</script>");
       }
       else
       {
    	   PrintWriter script = response.getWriter();
       	 script.println("<script>");
       	 script.println("alert('회원 삭제를 성곻했습니다.')");
         	 script.println("location.href = 'login.jsp'");
       	 script.println("</script>");
       }
       
       %>
            
          
            
            
            
          
			
	
      
       
        
      
        
   
 


    
    <script
      src="https://kit.fontawesome.com/d19eaaab15.js"
      crossorigin="anonymous"
    ></script>

  </body>
</html>
