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
import com.KimYoungKi.dao.ItemDao;
import com.KimYoungKi.dao.UserDao;


@WebServlet("/Purchase")
public class Purchase extends HttpServlet {
	private static final long serialVersionUID = 1L;
	UserDao userDao = new UserDao();
	ItemDao itemDao = new ItemDao();
	
   
    public Purchase() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{

		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		
	
		
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
	        	String itemID = request.getParameter("itemID");
	        	int result = itemDao.purchase(itemID);
	        	
	        	if(result == 1)
	        	{
	        		 PrintWriter script = response.getWriter();
		    		 script.println("<script>");
		    		 script.println("alert('구매를 성공했습니다.')");
		    		 script.println("location.href = 'Index'");
		    		 script.println("</script>");
	        	}
	        	else
	        	{
	        		 PrintWriter script = response.getWriter();
		    		 script.println("<script>");
		    		 script.println("alert('구매를 실패했습니다.')");
		    		 script.println("location.href = 'Index'");
		    		 script.println("</script>");
	        	}
	        }
	     
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{

	}

}
