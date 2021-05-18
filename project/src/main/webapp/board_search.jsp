<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "user.UserController" %>
<%@ page import = "board.BoardController" %>
<%@ page import = "board.Board" %>
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
    <link rel="stylesheet" href="css/board.css" />
  </head>

  <body>
  
  <%
  
  int pageNumber = 1;
  if(request.getParameter("pageNumber") != null)
  {
	  pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
	  
  }
  
  
  
  %>
  
  
   <div id="header_wrap">
    <div id="header">
      <a id="logo" href="index.jsp"><img src="resource/logo.PNG" alt="" /></a>
      <form id="search" action="index_search.jsp" method="post">
        
        <input type="text" id="search_input"  name = "itemSearch"/>
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
        String search = request.getParameter("board_search");
        ArrayList<Board> list = tmp.getSearchBoardList(pageNumber,search);
        
     
        
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
        
        
       
        <form id="board_search" action="board_search.jsp" method="post">
        
        <input type="text" id="board_search_input" name = "board_search" maxlength = "40" />
        <input type="submit" id="board_submit" value = "검색" />
    
                        
        </form>
       
      </div>
      
    </div>
    
    
    <div class = "icon" id = "write">
    <a href = "board_write.jsp" id = "write_button"><i class="fas fa-pencil-alt fa-5x"></i></a>
    </div>
    
       <%if(tmp.nextPage(pageNumber,search))
     {
    	 
     %>
     <div class = "icon" id = "page">
    <a href = "board_search.jsp?pageNumber=<%=pageNumber+1%>&board_search=<%=search%>" id = "write_button"><i class="fas fa-arrow-right fa-5x"></i></a>
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
