<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.io.PrintWriter" %>
<%@ page import = "java.util.ArrayList" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
request.setCharacterEncoding("UTF-8");
%>


<!DOCTYPE html>
<html>
  <head>
    <meta name="viewport" content="width=device-width"/>
    <title>영기PC</title>
    <link rel="stylesheet" href="css/index.css" />
  </head>

  <body>
 
 
  
  
 <div id="header_wrap">
 
   <div id="header_wrap">
    <div id="header">
      <a id="logo" href="Index"><img src="resource/logo.PNG" alt="" /></a>
      <form id="search" action="Index" method="post">
        
        <input type="text" id="search_input" name = "itemSearch" />
        <input type="submit" id="submit" value = "&#xf002;" />
    
                        
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
    
   	<c:forEach var = "list" items = "${list}" varStatus = "status">
 
            <div id = "content">
        	<div class="content_list">
        	
            <div id = "content_image">
            	  <div>
            	    <a href = "ItemDetail?itemID=${list.itemID}">
                  <img src="upload/${list.itemImage}" width = "200" height = "200" alt="">
 			        </a>
                  </div>
      
            </div>
                   
                    
             <div id = "content_name">
 			     <a href = "ItemDetail?itemID=${list.itemID}">
 			    상품명: ${list.itemTitle}
 			     <br>
 			    상품ID: ${list.itemID}
 			    </a>
 			    <div id = "content_info">
               <div id = "content_count">
 				잔여 상품 개수: ${list.itemCount}
            	</div>
            
            	<div id = "content_price">
                 가격: 
 				${list.itemPrice}
            	</div>
            </div>
            </div> 		
          
              <div id = "content_image">
            	  <div>
            	    <a href = ".jsp?itemID=${list.itemID}">
                       구매하기
                     </a>
                       <br>
                       <a href = ".jsp?itemID=${list.itemID}">
                       장바구니
                     </a>
                  </div>
      
            </div>
            
            
           
            
         </div>
         
         </div>
        
        </c:forEach>
        
        
        </div>
  
    ${nextPage}

    <script
      src="https://kit.fontawesome.com/d19eaaab15.js"
      crossorigin="anonymous"
    ></script>
  
  </body>
</html>
