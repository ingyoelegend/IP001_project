package com.KimYoungKi.controller;

import java.io.IOException;
import java.io.PrintWriter;
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


@WebServlet("/DeleteUser")
public class DeleteUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
      
	
   
    public DeleteUser() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{

		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		UserDao userDao = new UserDao();
		
		 HttpSession session = request.getSession();
		 int opCode = userDao.getOpCode((String)session.getAttribute("userID"));
		  	       
	        
		 
		 	if(session.getAttribute("userID") == null)
	    	{	    		
	    		 PrintWriter script = response.getWriter();
      	 script.println("<script>");
      	 script.println("alert('로그인 후에 이용할수 있습니다.')");
        	 script.println("location.href = 'Index'");
      	 script.println("</script>");
	    		
	    	}
	        else if(opCode != 1)
	        {     
	        	 PrintWriter script = response.getWriter();
      	 script.println("<script>");
      	 script.println("alert('관리자만 이용할수 있습니다.')");
        	 script.println("location.href = 'Index'");
      	 script.println("</script>");
	        	
	        }
	        else
	        {
	        	RequestDispatcher view = request.getRequestDispatcher("deleteUser.jsp");
	   		 	view.forward(request, response);
	        }
	     
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{

		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
			UserDao userDao = new UserDao();
		
			String userID = request.getParameter("userID");
			
			
			
			int result = userDao.delete(userID);
			
			if(result == 1)
			{
				System.out.println("삭제성공");
				 response.sendRedirect("Index");
			}
			else
			{
				System.out.println("실패");
				 response.sendRedirect("DeleteUser");
			}
			
	}

}
