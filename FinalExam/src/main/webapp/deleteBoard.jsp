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
    <link rel="stylesheet" href="css/master.css" />
  </head>

  <body>
    
            
       
        <form id="write_form" action="DeleteBoard" method="post">
        
        <div id = "content_wrap">
        	<span class="upload-hidden">삭제할 게시글 ID</span>
        	  <br>
			 <input type="text" name = "boardID" required/>
       	     <br>
       	      <div id = "write_submit_wrap"> <input type="submit" id="write_submit" value = "삭제 확인" />
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
