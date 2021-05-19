<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "user.UserController" %>
<%@ page import = "board.BoardController" %>
<%@ page import = "board.Board" %>
<%@ page import = "java.io.PrintWriter" %>
<%@ page import = "java.util.ArrayList" %>
<!DOCTYPE html>
<html>
  <head>
    <meta name="viewport" content="width=device-width"/>
    <title>영기PC</title>
    <link rel="stylesheet" href="css/boardDetail.css" />
  </head>

  <body>
  
 <%
 if(session.getAttribute("userID") == null)
	{
		 PrintWriter script = response.getWriter();
	
	 script.println("<script>");
	 script.println("alert('로그인 후에 이용해주세요.')");
	 script.println("location.href = 'login.jsp'");
	 script.println("</script>");
	
	}
  %>
  
  
   <div id="header_wrap">
    <div id="header">
      <a id="logo" href="index.jsp"><img src="resource/logo.PNG" alt="" /></a>
      <form id="search" action="index_search.jsp" method="post">
        
        <input type="text" id="search_input" />
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
      		out.println("<a href = 'changeProfile.jsp'>프로필 수정</a>");
      		out.println("<a href = 'join.jsp'>회원가입</a>");  	  
      	}
      	
      	%>

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
    <div id="content">

        
       
        <%
        
        int boardNum;
        
        if(request.getParameter("boardID") != null)
        {
          boardNum = Integer.parseInt(request.getParameter("boardID"));
      	  
      	  BoardController bd = new BoardController();
      	  
      	  Board tmp = bd.getBoardDetail(boardNum);
      	  
      	  if(tmp != null)
      	  {
      		  
       %>
      		  
      	 <div id="title">
 
       <br>
       <br>
       	    <span><%=tmp.getBoardTitle()%></span>
       	     <br>
       	      <br>
       </div>
   
      <div id="text">
       <br>
       <br>
       	   <span><%=tmp.getBoardText() %></span>
       	  
     
      </div> 
      		  
      		  
      <%
      	  }
        }
        
      %>      
       
      </div>
      
    </div>
    
    <script
      src="https://kit.fontawesome.com/d19eaaab15.js"
      crossorigin="anonymous"
    ></script>

  </body>
</html>
