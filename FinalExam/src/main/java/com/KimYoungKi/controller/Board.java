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
import com.KimYoungKi.model.BoardModel;


@WebServlet("/Board")
public class Board extends HttpServlet {
	private static final long serialVersionUID = 1L;
	UserDao userDao = new UserDao();
	BoardDao boardDao = new BoardDao(); 
   
    public Board() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		

		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
	
	
		
		
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
			
			
			HashMap<String,String> hashmap = new HashMap<>();
			
			hashmap.put("pageNumber", Integer.toString(pageNumber));
			
			hashmap.put("search", search);
			
		     List<BoardModel> list = boardDao.getBoardList(hashmap);
	     
		     request.setAttribute("list", list);
		     		     
		     hashmap.clear();
		     
		     hashmap.put("pageNumber", Integer.toString(pageNumber+1));
			
			 hashmap.put("search", search);
		     
		     if(boardDao.nextPage(hashmap))
		     {
		    	 
		    
		    	  request.setAttribute("nextPage", "  <div class = \"icon\" id = \"page\">\r\n"
		    	  		+ "		    <a href = \"Board?pageNumber="+(pageNumber+1)+"&search="+search+"\" id = \"write_button\">다음페이지</a>\r\n"
		    	  		+ "		    </div>");
		    	 
		   
		    
		     }
		     else
		     {
		    	 request.setAttribute("nextPage", "");
		     }
		    
		  
		     
			 RequestDispatcher view = request.getRequestDispatcher("board.jsp");
	    	 view.forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{

		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		 String search = request.getParameter("board_search");
		
		 response.sendRedirect("Board?search="+search);
	}

}