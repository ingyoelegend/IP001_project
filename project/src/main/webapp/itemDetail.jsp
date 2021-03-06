<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "user.UserController" %>
<%@ page import = "item.ItemController" %>
<%@ page import = "item.Item" %>
<%@ page import = "java.io.PrintWriter" %>
<%@ page import = "java.util.ArrayList" %>
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
      <a id="logo" href="index.jsp"><img src="resource/logo.PNG" alt="" /></a>
      <form id="search" action="index_search.jsp" method="post">
        
        <input type="text" id="search_input" name = "itemSearch" />
        <input type="submit" id="submit" value = "&#xf002;" />
    
                        
      </form>


 	 <div id="dropdown">
 	   <div id = "dropdown_icon"> <i class="far fa-user fa-lg"></i> 
 	  
 	   
     	
      	<div id="dropdown-content">
      	<%
      	if(session.getAttribute("userID") == null)
      	{
      		out.println("<a href = 'login.jsp'>로그인</a>");
      		out.println("<a href = 'join.jsp'>회원가입</a>");  	  
      	}
      	else
      	{
      		out.println("<a href = 'logoutController.jsp'>로그아웃</a>");
      		out.println("<a href = 'changeProfile.jsp'>프로필</a>");
      		out.println("<a href = 'join.jsp'>회원가입</a>");  	  
      	}
      	
      	%>

        </div>
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
        <%
        UserController us = new UserController();
   
        
        if(us.getOpCode((String)session.getAttribute("userID")) == 1)
        {
        	
        %>
        
        <a href="master.jsp" class="nav_item">관리자 페이지</a>
        
        <%
        
        }
       
        %>
      
     
      </div>
    </div>
    <br />
    
    
    <%
    ItemController it = new ItemController();
    String itemID = request.getParameter("itemID");
    Item result = it.itemDetail(itemID);
    %>
    
    <div id = "wrap">
    <div id = "item_wrap">
       
       <div id = "item_title">
        <%=result.getItemTitle() %>
       </div>
    
    <div id = "item">
    
      <div id = "item_image">
    		    <img src="upload/<%=result.getItemImage()%>" width = "380" height = "380" alt="">
            	
                 
 			  
                  </div>
      
   
               
                 <div id = "item_info">
            	 
                <%=result.getItemPrice() %>
                <%=result.getItemText() %>
                
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
