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
import com.KimYoungKi.dao.ItemDao;
import com.KimYoungKi.dao.UserDao;
import com.KimYoungKi.model.BoardModel;
import com.KimYoungKi.model.ItemModel;



@WebServlet("/ItemDetail")
public class ItemDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	ItemDao itemDao = new ItemDao();
	UserDao userDao = new UserDao();
    public ItemDetail() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		
			HttpSession session = request.getSession();
		
			response.setCharacterEncoding("UTF-8");
			response.setContentType("text/html; charset=UTF-8");
			
		    String userID = (String)session.getAttribute("userID");
		    
		    if(session.getAttribute("userID") == null)
	      	{
	      		request.setAttribute("out", "<a href = 'Login'>로그인</a><a href = 'Join'>회원가입</a>");  
	      		     		
	      	}
	      	else
	      	{
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
			
			 String itemID = request.getParameter("itemID");
			 
			 ItemModel tmp = itemDao.getItemDetail(itemID);
			 
			 System.out.println(tmp);
			 
			 request.setAttribute("itemDetail", tmp);
			 
			 RequestDispatcher view = request.getRequestDispatcher("itemDetail.jsp");
	    	 view.forward(request, response);
					
		 
	
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{

	
		
	}

}
