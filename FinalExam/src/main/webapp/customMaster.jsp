<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.io.PrintWriter" %>


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
   
       
         
        <form id="write_form" action="CustomMaster" method="post">
        
        <div id = "content_wrap">
			 <input type="text" name = "userID" placeholder = "이메일" required/>
       	     <br>
       	      <br>
       	      <br>
       	     추가
       	     <input type="radio" name = "opCode" value = 1 />
       	     삭제
       	     <input type="radio" name = "opCode" value = 0/>
       	     <br>
       	     <br>
       	      <br>
       	      <div id = "write_submit_wrap"> <input type="submit" id="write_submit" value = "수정" />
       	        <br>
       	        <br>
             </div>

		</div>


		</form>
         
            
          
            
            
            
          
			
	
      
       
        
      
        
   
 


    
    <script
      src="https://kit.fontawesome.com/d19eaaab15.js"
      crossorigin="anonymous"
    ></script>

  </body>
</html>
