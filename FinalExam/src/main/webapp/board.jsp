<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.io.PrintWriter" %>
<%@ page import = "java.util.ArrayList" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
  <head>
    <meta name="viewport" content="width=device-width"/>
    <title>영기PC</title>
    <link rel="stylesheet" href="css/board.css" />
  </head>

  <body>
 
  
   <div id="header_wrap">
    <div id="header">
      <a id="logo" href="Index"><img src="resource/logo.PNG" alt="" /></a>
      <form id="search" action="Index" method="post">
        
        <input type="text" id="search_input" name = "itemSearch" />
        <input type="submit" id="submit" value = "&#xf002;" />
    
                        
      </form>


 	 <div id="dropdown">
 	 		 <div id = "dropdown_icon"><div>${profile}</div> 
 	   <i class="far fa-user fa-lg"></i> 
 	   
     	
      	<div id="dropdown-content">
      ${out}

        </div>
     </div>
    </div>

    </div>
   </div>



    <div id="nav">
      <div id="nav_list">
        <a href="Index?itemCategory=키보드" class="nav_item">키보드</a>
        <a href="Index?itemCategory=마우스" class="nav_item">마우스</a>
        <a href="Index?itemCategory=케이스" class="nav_item">케이스</a>
        <a href="Index?itemCategory=헤드폰" class="nav_item">헤드폰</a>
        <a href="Index?itemCategory=모니터" class="nav_item">모니터</a>
        <a href="Board" class="nav_item">게시판</a>
          ${opCode}


      </div>
    </div>
    <br />
    
  <div id = "content_wrap">
  
    <div id="content">

        <div class="content_list">
           <div class = "content_list_code">
				게시글ID
           </div>
           
           <div class = "content_list_title">
				제목
           </div >
           		
            <div class = "content_list_writer">
				작성자
           </div >		
           		
           <div class = "content_list_date">
				작성일
           </div>
           
        </div>
        
       <c:forEach var = "list" items = "${list}" varStatus = "status">
       
        	<div class="content_list">
            <div class = "content_list_code">
            <a href = "BoardDetail?boardID=${list.boardID}">
 			${list.boardID}
 			</a>
            </div>
            
            <div class = "content_list_title">
 			${list.boardTitle}
            </div >
            		
             <div class = "content_list_writer">
 		     ${list.boardWriter}
            </div >		
            		
            <div class = "content_list_date">
 	
 			  ${list.boardDate}
            </div>
            
         </div>
        
          </c:forEach>
        
 
       
        <form id="board_search" action="Board" method="post">
        
        <input type="text" id="board_search_input" name = "board_search" maxlength = "40" />
        <input type="submit" id="board_submit" value = "검색" />
    
        </form>
       
      </div>
      
     
      
    </div>
    
    
    <div class = "icon" id = "write">
    <a href = "BoardWrite" id = "write_button"><i class="fas fa-pencil-alt fa-5x"></i></a>
    </div>
    
     
    
    
    
    
   ${nextPage}
   

    <script
      src="https://kit.fontawesome.com/d19eaaab15.js"
      crossorigin="anonymous"
    ></script>

  </body>
</html>
