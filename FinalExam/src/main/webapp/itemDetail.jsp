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
    <link rel="stylesheet" href="css/itemDetail.css" />
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
 	 		 <div id = "dropdown_icon"><div>${profile}</div> 
 	 		  <br>
 	    <i class="far fa-user fa-lg"></i> 
 	  
 	   
     	
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
    
    <div id = "wrap">
    <div id = "item_wrap">
       
       <div id = "item_title">
        ${itemDetail.itemTitle}
       </div>
    
    <div id = "item">
    
      <div id = "item_image">
    		    <img src="upload/${itemDetail.itemImage}" width = "380" height = "380" alt="">
    		      <span>상품ID: ${itemDetail.itemID}</span>
    		      <br>
    		      <span>잔여 상품 개수: ${itemDetail.itemCount}</span>
    		    
      </div>
      
   
               
                 <div id = "item_info">
            	 
            	 <div id = "item_price"><span>가격:${itemDetail.itemPrice}원</span> 
            	 <c:if test = "${itemDetail.itemCount != 0}"><a href = "Purchase?itemID=${itemDetail.itemID}">
                       구매하기
                     </a>
            	  </c:if>
            	  <c:if test = "${itemDetail.itemCount <= 0}">품절
            	  </c:if>
            	  </div>
            	  
               <div id = "item_text">제품소개:${itemDetail.itemText}</div>
              
                
                </div>
                 
    </div>
    
    		 
    
         
            
   </div>
   </div>
     
     
   
    

    <script
      src="https://kit.fontawesome.com/d19eaaab15.js"
      crossorigin="anonymous"
    ></script>
  
  </body>
</html>
