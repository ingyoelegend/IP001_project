<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "user.UserController" %>
<%@ page import = "item.ItemController" %>
<%@ page import = "item.Item" %>
<%@ page import = "java.io.PrintWriter" %>
<%@ page import = "java.util.ArrayList" %>
<!DOCTYPE html>
<html>
  <head>
    <meta name="viewport" content="width=device-width"/>
    <title>영기PC</title>
    <link rel="stylesheet" href="css/index.css" />
  </head>

  <body>
  
   <%
  
  int pageNumber = 1;
  if(request.getParameter("pageNumber") != null)
  {
	  pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
	  
	  ItemController it = new ItemController();
	  if(!it.nextPage(pageNumber))
	  {
		  PrintWriter script = response.getWriter();
			 script.println("<script>");
		  	 script.println("alert('페이지에 상품이 존재하지 않습니다.')");
		  	 script.println("location.href = 'index.jsp'");
		  	 script.println("</script>");
	  }
  }
  
  
  
  %>
  
  
 <div id="header_wrap">
 
   <div id="header_wrap">
    <div id="header">
      <a id="logo" href="index.jsp"><img src="resource/logo.PNG" alt="" /></a>
      <form id="search" action="search.html" method="post">
        
        <input type="text" id="search_input" />
        <input type="submit" id="submit" value = "검색" />
    
                        
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
        <a href="" class="nav_item">키보드</a>
        <a href="" class="nav_item">마우스</a>
        <a href="" class="nav_item">케이스</a>
        <a href="" class="nav_item">헤드폰</a>
        <a href="" class="nav_item">모니터</a>
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
        ItemController tmp = new ItemController();
        ArrayList<Item> list = tmp.getItemList(pageNumber);
        
        for(int i = 0; i < list.size(); i++)
        {
        %>
        	<div class="content_list">
            <div class = "content_list_code">
            <a href = "itemDetail.jsp?itemID=<%=list.get(i).getItemID()%>">
            <%=list.get(i).getItemID()%>
 			<%= list.get(i).getItemTitle() %>
 			</a>
            </div>
                     		
            <div class = "content_list_date">
            <img src="upload/<%=list.get(i).getItemImage()%>" width = "200" height = "200" alt="">
 			
            </div>
            
            <div class = "content_list_date">
 			<%= list.get(i).getItemCount() %>
            </div>
            
            <div class = "content_list_date">
              
 			<%= list.get(i).getItemPrice() %>
            </div>
            
         </div>
        
        <%
        }
        %>
        
    
      <div id="content">

        
        
       
      </div>
    </div>

    <script
      src="https://kit.fontawesome.com/d19eaaab15.js"
      crossorigin="anonymous"
    ></script>
  
  </body>
</html>
