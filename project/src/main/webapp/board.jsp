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
    <link rel="stylesheet" href="css/board.css" />
  </head>

  <body>
  
  <%
  
  int pageNumber = 1;
  if(request.getParameter("pageNumber") != null)
  {
	  pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
	  
	  BoardController bd = new BoardController();
	  if(!bd.nextPage(pageNumber))
	  {
		  PrintWriter script = response.getWriter();
			 script.println("<script>");
		  	 script.println("alert('페이지에 내용이 없습니다.')");
		  	 script.println("location.href = 'board.jsp'");
		  	 script.println("</script>");
	  }
  }
  
  
  
  %>
  
  
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



    <div id="nav">
      <div id="nav_list">
        <a href="" class="nav_item">키보드</a>
        <a href="" class="nav_item">마우스</a>
        <a href="" class="nav_item">케이스</a>
        <a href="" class="nav_item">헤드폰</a>
        <a href="" class="nav_item">모니터</a>
        <a href="board.jsp" class="nav_item">게시판</a>


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
        
        <%
        BoardController tmp = new BoardController();
        ArrayList<Board> list = tmp.getBoardList(pageNumber);
        
        for(int i = 0; i < list.size(); i++)
        {
        %>
        	<div class="content_list">
            <div class = "content_list_code">
            <a href = "boardDetail.jsp?boardID=<%=list.get(i).getBoardID()%>">
 			<%= list.get(i).getBoardID() %>
 			</a>
            </div>
            
            <div class = "content_list_title">
 			<%= list.get(i).getBoardTitle() %>
            </div >
            		
             <div class = "content_list_writer">
 		     <%= list.get(i).getBoardWriter() %>
            </div >		
            		
            <div class = "content_list_date">
 			<%= list.get(i).getBoardDate().substring(0,11)+list.get(i).getBoardDate().substring(11,13)+"시"+list.get(i).getBoardDate().substring(14,16)+"분" %>
            </div>
            
         </div>
        
        <%
        }
        %>
        
       
      </div>
      
    </div>
    
    
    <div class = "icon" id = "write">
    <a href = "board_write.jsp" id = "write_button"><i class="fas fa-pencil-alt fa-5x"></i></a>
    </div>
    
    
     <div class = "icon" id = "page">
    <a href = "board.jsp?pageNumber=<%=pageNumber+1%>" id = "write_button"><i class="fas fa-arrow-right fa-5x"></i></a>
    </div>
    
   

    <script
      src="https://kit.fontawesome.com/d19eaaab15.js"
      crossorigin="anonymous"
    ></script>

  </body>
</html>
