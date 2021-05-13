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
    <link rel="stylesheet" href="css/board_write.css" />
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
      <form id="search" action="search.html" method="post">
        
        <input type="text" id="search_input" required/>
        <input type="submit" id="submit" value = "검색" required/>
    
                        
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
    <div id="content">

       <form id="write_form" action="board_write_Post.jsp" method="post">
      
      
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
