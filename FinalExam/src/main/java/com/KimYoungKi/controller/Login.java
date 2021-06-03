package com.KimYoungKi.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.KimYoungKi.dao.UserDao;



@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	UserDao userDao = new UserDao();
   
    public Login() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		 HttpSession session = request.getSession();
		 
		 if(session.getAttribute("userID") != null)
		 {
			 response.sendRedirect("Index");
		 }
		 else
		 {

			 RequestDispatcher view = request.getRequestDispatcher("login.jsp");
	    	 view.forward(request, response);
		 }
	
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String userID = request.getParameter("userID");
		String userPassword = request.getParameter("userPassword");
		HttpSession session = request.getSession();
		
		int result = userDao.login(userID,userPassword);
		
	    if(result == 1)
	    {
	    	System.out.println("성공");
	    	 session.setAttribute("userID",userID);
	    	 response.sendRedirect("Index");
	    }
		
	}

}
