<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "board.BoardController" %>
<%@ page import = "java.io.PrintWriter" %>
<%
request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id = "board" class = "board.Board" scope = "page"/>
<jsp:setProperty name = "board" property = "boardText"/>
<jsp:setProperty name = "board" property = "boardTitle"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영기PC</title>
</head>
<body>
 <%
          BoardController bd = new BoardController();
 
          int result = bd.write(board.getBoardTitle(), (String)session.getAttribute("userID"), board.getBoardText());
          
          if(board.getBoardTitle() == null || board.getBoardText() == null)
          {
        	  PrintWriter script = response.getWriter();
          	  script.println("<script>");
          	  script.println("alert('입력이 안된 사항이 있습니다.')");
              script.println("history.back()");
          	  script.println("</script>");
          }
          else if(result == -1)
          {
         	 PrintWriter script = response.getWriter();
         	 script.println("<script>");
         	 script.println("alert('데이터베이스 오류가 발생했습니다.이용에 불편함을 드려 죄송합니다.')");
           	 script.println("location.href = 'board.jsp'");
         	 script.println("</script>");
          }
          else
          {
         	 PrintWriter script = response.getWriter();
         	 script.println("<script>");
         	 script.println("location.href = 'board.jsp'");
         	 script.println("</script>");
         	 
          }
     %>
</body>
</html>