package com.KimYoungKi.controller;

import java.io.IOException;
import java.io.PrintWriter;
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
import com.KimYoungKi.model.BoardModel;



@WebServlet("/BoardDetail")
public class BoardDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	BoardDao boardDao = new BoardDao();
	UserDao userDao = new UserDao();
    public BoardDetail() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");	
		 HttpSession session = request.getSession();
		 
		 String userID = (String)session.getAttribute("userID");
		 
		 if(session.getAttribute("userID") == null)
	      	{
	      		request.setAttribute("out", "<a href = 'Login'>로그인</a><a href = 'Join'>회원가입</a>");  
	      		     		
	      	}
	      	else
	      	{
	      		String profile = userDao.getName((String)session.getAttribute("userID"));
			     request.setAttribute("profile", profile+"님 환영합니다.");
	      		request.setAttribute("out", "<a href = 'Logout'>로그아웃</a><a href = 'Join'>회원가입</a>");
	      		
	      		
	      	}
		 
		 int opCode = userDao.getOpCode(userID);
		  
			
			if(opCode == 1)
	        {
	        	
	     
	        
	        request.setAttribute("opCode", "<a href=\"Master\" class=\"nav_item\">관리자 페이지</a>");
	      
	        
	        }
			else
			{
				  request.setAttribute("opCode", "");
			}
		
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
			 String boardID = request.getParameter("boardID");
			 
			 BoardModel tmp = boardDao.getBoardDetail(boardID);
			 
			 request.setAttribute("boardDetail", tmp);
			 
			
			 
			 RequestDispatcher view = request.getRequestDispatcher("boardDetail.jsp");
	    	 view.forward(request, response);
		}
		
		
		 
		

			
		 
	
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{

	
		
	}

}
