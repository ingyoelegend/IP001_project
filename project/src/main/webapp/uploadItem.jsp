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
        	 script.println("location.href = 'index.jsp'");
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
 


       <form id="write_form" action="uploadItemPost.jsp" enctype="multipart/form-data" method="post">
      
                   <div id = "content_wrap">
    <div id="content">
         <div id="image">
           <span>상품 이미지</span>
       <br>
       <br>
       	    <input type="file" name = "itemImage" accept = "image/*" required/>
       	     <br>
       	      <br>
       </div>
       
       <div id="category">
      <span>카테고리</span>
       <br>
       <br>
       	    <input type = "text" placeholder = "카테고리를 입력해 주세요." name = "itemCategory" maxlength = "40" required></input>
       	    </div>
       	  
     
      </div>
      
       <div id="title">
           <span>상품명</span>
       <br>
       <br>
       	    <input type="text" placeholder = "상품명."  maxlength = "40" name = "itemTitle" required/>
       	     <br>
       	      <br>
       </div>
   
      <div id="text">
      <span>소개글</span>
       <br>
       <br>
       	    <textarea placeholder = "소개글을 입력해 주세요." name = "itemText" maxlength = "2048" required></textarea>
       	    </div>
       	  
     
      </div>
      
         <div id="count">
           <span>상품 개수</span>
       <br>
       <br>
       	    <input type="number" placeholder = "상품개수" name = "itemCount" required/>
       	     <br>
       	      <br>
       </div>
       
          <div id="title">
           <span>상품 가격</span>
       <br>
       <br>
       	    <input type="number" placeholder = "화폐 단위는(원)입니다" name = "itemPrice" required />
       	    <div id = "write_submit_wrap"> <input type="submit" id="write_submit" value = "상품 등록" /> 
       	     <br>
       	      <br>
       </div>
       
       
   
      
        
       
      </div>
      
    </div>
    
       </form>
       
           
 
    
    <script
      src="https://kit.fontawesome.com/d19eaaab15.js"
      crossorigin="anonymous"
    ></script>

  </body>
</html>
