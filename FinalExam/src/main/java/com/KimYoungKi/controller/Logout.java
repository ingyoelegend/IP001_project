package com.KimYoungKi.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.KimYoungKi.dao.UserDao;



@WebServlet("/Logout")
public class Logout extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	
   
    public Logout() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		
		
		
		 HttpSession session = request.getSession();
		 
		 if(session.getAttribute("userID") == null)
		 {
			 
		    		 PrintWriter script = response.getWriter();
	            	 script.println("<script>");
	            	 script.println("alert('로그인 후에 이용할수 있습니다.')");
	              	 script.println("location.href = 'Index'");
	            	 script.println("</script>");
		    		
		 }
		 else
		 {
			 session.invalidate();
			 response.sendRedirect("Index");

		 }
	
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{

		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		
		
	}

}
