package com.KimYoungKi.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.KimYoungKi.dao.BoardDao;
import com.KimYoungKi.dao.UserDao;


@WebServlet("/BoardWrite")
public class BoardWrite extends HttpServlet {
	private static final long serialVersionUID = 1L;
      
   
    public BoardWrite() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		

		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
	
		UserDao userDao = new UserDao();
		BoardDao boardDao = new BoardDao(); 
		
		
		 String search = request.getParameter("search");
		 int pageNumber = 1;
		 HttpSession session = request.getSession();
		 
		 
		
		 
		 if("null".equals(search) || search == null)
		  {
			  search = "";
			 
		  }
		  
		  if(request.getParameter("pageNumber") != null)
		  {
			  pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
		  }
		  
		  if(session.getAttribute("userID") == null)
	      	{
	      		request.setAttribute("out", "<a href = 'Login'>로그인</a><a href = 'Join'>회원가입</a>");  
	      		     		
	      	}
	      	else
	      	{
	      		request.setAttribute("out", "<a href = 'Logout'>로그아웃</a><a href = 'Join'>회원가입</a>");
	      		
	      		
	      	}
		  
		  
		    String userID = (String)session.getAttribute("userID");
			int opCode = userDao.getOpCode(userID);
		  
			
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


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{

		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		 
	}

}
