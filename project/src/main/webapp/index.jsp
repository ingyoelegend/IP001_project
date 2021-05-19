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
    <link rel="stylesheet" href="css/index.css" />
  </head>

  <body>
  
   <%
  
   ArrayList<Item> list;
   ItemController tmp = new ItemController();
   String category = request.getParameter("itemCategory");  

 
   
  int pageNumber = 1;
  
  if("null".equals(category) || category == null)
  {
	  category = "";
  }
  
  if(request.getParameter("pageNumber") != null)
  {
	  pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
  }

  
  
  
  %>
  
 
  
  
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
    
    <div id = "content_wrap">
    
   
    
     <%
     
    

    	  list = tmp.getItemList(pageNumber,category);
    
       
        
        
        for(int i = 0; i < list.size(); i++)
        {
        %>
            <div id = "content">
        	<div class="content_list">
        	
            <div id = "content_image">
            	  <div>
            	    <a href = "itemDetail.jsp?itemID=<%=list.get(i).getItemID()%>">
                  <img src="upload/<%=list.get(i).getItemImage()%>" width = "200" height = "200" alt="">
 			        </a>
                  </div>
      
            </div>
                    
                    
             <div id = "content_name">
 			     <a href = "itemDetail.jsp?itemID=<%=list.get(i).getItemID()%>">
 			     <%= list.get(i).getItemTitle() %>
 			    </a>
 			    <div id = "content_info">
               <div id = "content_count">
 				잔여 상품 개수: <%= list.get(i).getItemCount() %>
            	</div>
            
            	<div id = "content_price">
                 가격: 
 				<%= list.get(i).getItemPrice() %>
            	</div>
            </div>
            </div> 		
          
              <div id = "content_image">
            	  <div>
            	    <a href = ".jsp?itemID=<%=list.get(i).getItemID()%>">
                       구매하기
                     </a>
                       <br>
                       <a href = ".jsp?itemID=<%=list.get(i).getItemID()%>">
                       장바구니
                     </a>
                  </div>
      
            </div>
            
            
           
            
         </div>
         
         </div>
        
        <%
        }
        %>
        </div>
   
 
    
     <%if(tmp.nextCategoryPage(pageNumber+1,category))
     {
    	 
     %>
     <div class = "icon" id = "page">
    <a href = "index.jsp?pageNumber=<%=pageNumber+1%>&itemCategory=<%=category%>" id = "write_button"><i class="fas fa-arrow-right fa-5x"></i></a>
    </div>
    <%
     }
    %>
    

    <script
      src="https://kit.fontawesome.com/d19eaaab15.js"
      crossorigin="anonymous"
    ></script>
  
  </body>
</html>
