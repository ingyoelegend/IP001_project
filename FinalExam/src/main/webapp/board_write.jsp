<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
%>

<!DOCTYPE html>
<html>
  <head>
    <meta name="viewport" content="width=device-width"/>
    <title>영기PC</title>
    <link rel="stylesheet" href="css/board_write.css" />
  </head>

  <body>
  
  
   <div id="header_wrap">
    <div id="header">
      <a id="logo" href="index.jsp"><img src="resource/logo.PNG" alt="" /></a>
      <form id="search" action="index_search.jsp" method="post">
        
        <input type="text" id="search_input" required/>
        <input type="submit" id="submit" value = "&#xf002;" required/>
    
                        
      </form>


 	 <div id="dropdown">
 	   <div id = "dropdown_icon"> <i class="far fa-user fa-lg"></i> 
 	  
 	   
     	
      	<div id="dropdown-content">
     	${out}
     

        </div>
     </div>
    </div>

    </div>
   </div>



    <div id="nav">
      <div id="nav_list">
        <a href="index.jsp?itemCategory=키보드" class="nav_item">키보드</a>
        <a href="index.jsp?itemCategory=마우스" class="nav_item">마우스</a>
        <a href="index.jsp?itemCategory=케이스" class="nav_item">케이스</a>
        <a href="index.jsp?itemCategory=헤드폰" class="nav_item">헤드폰</a>
        <a href="index.jsp?itemCategory=모니터" class="nav_item">모니터</a>
        <a href="board.jsp" class="nav_item">게시판</a>
        ${opCode}


      </div>
    </div>
    <br />
    
  <div id = "content_wrap">
    <div id="content">

       <form id="write_form" action="BoardWrite" method="post">
      
      
       <div id="title">
           <span>제목</span>
       <br>
       <br>
       	    <input type="text" placeholder = "제목을 입력해 주세요."  maxlength = "40" name = "boardTitle" />
       	     <br>
       	      <br>
       </div>
   
      <div id="text">
      <span>내용</span>
       <br>
       <br>
       	    <textarea placeholder = "내용을 입력해 주세요." name = "boardText" maxlength = "2048"></textarea>
       	    <div id = "write_submit_wrap"> <input type="submit" id="write_submit" value = "작성완료" />  </div>
       	  
     
      </div>
       
       
   
                  
       </form>
        
       
      </div>
      
    </div>
    
    
    <script
      src="https://kit.fontawesome.com/d19eaaab15.js"
      crossorigin="anonymous"
    ></script>

  </body>
</html>
