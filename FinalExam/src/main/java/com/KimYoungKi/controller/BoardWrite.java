package com.KimYoungKi.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;


import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.KimYoungKi.dao.BoardDao;

import com.KimYoungKi.dao.UserDao;
import com.KimYoungKi.model.BoardModel;


@WebServlet("/BoardWrite")
public class BoardWrite extends HttpServlet {
	private static final long serialVersionUID = 1L;
      
	
	UserDao userDao = new UserDao();
	BoardDao boardDao = new BoardDao();
   
    public BoardWrite() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		

			response.setCharacterEncoding("UTF-8");
			response.setContentType("text/html; charset=UTF-8");
	
		
		
		
		   HttpSession session = request.getSession();
		 
		  
		  	if(session.getAttribute("userID") == null)
	      	{
		  		 PrintWriter script = response.getWriter();
		      	 script.println("<script>");
		      	 script.println("alert('로그인 후에 이용할수 있습니다.')");
		         script.println("location.href = 'Login'");
		      	 script.println("</script>");
	      		     		
	      	}
	      	else
	      	{
	      		String profile = userDao.getName((String)session.getAttribute("userID"));
			     request.setAttribute("profile", profile+"님 환영합니다.");
	      		 request.setAttribute("out", "<a href = 'Logout'>로그아웃</a><a href = 'Join'>회원가입</a>");
	      		 
	      		int opCode = userDao.getOpCode((String)session.getAttribute("userID"));
	  		  
				
				if(opCode == 1)
		        {
		        	
		     
		        
		        request.setAttribute("opCode", "<a href=\"Master\" class=\"nav_item\">관리자 페이지</a>");
		      
		        
		        }
				else
				{
					  request.setAttribute("opCode", "");
				}
				
			
	      		 
				 RequestDispatcher view = request.getRequestDispatcher("board_write.jsp");
		    	 view.forward(request, response);
	      		
	      		
	      	}
		  
		  	
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{


		HttpSession session = request.getSession();
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		String boardTitle = request.getParameter("boardTitle");
		String boardText = request.getParameter("boardText");
		
		BoardModel board = new BoardModel();
		
		board.setBoardText(boardText);
		board.setBoardTitle(boardTitle);
		int boardID = boardDao.getNext()+1;
		board.setBoardID(boardID);
		board.setBoardWriter((String)session.getAttribute("userID"));
	
		String boardDate = boardDao.getDate();
		board.setBoardDate(boardDate);
		
		
		
		
						int result = boardDao.boardWrite(board);


						if(result == 1)
		    			{
		    				 PrintWriter script = response.getWriter();
		                 	 script.println("<script>");
		                 	 script.println("alert('등록을 완료했습니다.')");
		                   	 script.println("location.href = 'Board'");
		                 	 script.println("</script>");
		    			}
		    			else
		    			{
		    				 PrintWriter script = response.getWriter();
		                 	 script.println("<script>");
		                 	 script.println("alert('등록에 실패했습니다.')");
		                   	 script.println("location.href = 'Board'");
		                 	 script.println("</script>");
		    			}
		
		 
	}

}
