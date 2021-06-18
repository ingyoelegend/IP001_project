package com.KimYoungKi.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.KimYoungKi.dao.ItemDao;
import com.KimYoungKi.dao.UserDao;
import com.KimYoungKi.model.ItemModel;
import com.KimYoungKi.model.UserModel;


@WebServlet("/Index")
public class Index extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
	UserDao userDao = new UserDao();
	ItemDao itemDao = new ItemDao();
   
    public Index() {
    	
    	
    	
        super();
        
   
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		   
		

		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
	
			
	
		 String category = request.getParameter("itemCategory");  
		 String search = request.getParameter("search");
		 int pageNumber = 1;
		 HttpSession session = request.getSession();
		 
		 
		 
		 if("null".equals(category) || category == null)
		  {
			  category = "";
			 
		  }
		 
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
	      		String profile = userDao.getName((String)session.getAttribute("userID"));
			     request.setAttribute("profile", profile+"님 환영합니다.");
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
			hashmap.put("category", category);
			hashmap.put("search", search);
			
		     List<ItemModel> list = itemDao.getItemList(hashmap);
	     
		     request.setAttribute("list", list);
		     
		     hashmap.clear();
		     
		     hashmap.put("pageNumber", Integer.toString(pageNumber+1));
			 hashmap.put("category", category);
			 hashmap.put("search", search);
		     
		     if(itemDao.nextPage(hashmap))
		     {
		    	 
		    
		    	  request.setAttribute("nextPage", "  <div class = \"icon\" id = \"page\">\r\n"
		    	  		+ "		    <a href = \"Index?pageNumber="+(pageNumber+1)+"&search="+search+"&itemCategory="+category+"\" id = \"write_button\"><i class=\"fas fa-arrow-right fa-5x\"></i></a>\r\n"
		    	  		+ "		    </div>");
		    	 
		   
		    
		     }
		     else
		     {
		    	 request.setAttribute("nextPage", "");
		     }
		    
		  
		    
			 RequestDispatcher view = request.getRequestDispatcher("index.jsp");
	    	 view.forward(request, response);
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		

		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
	
		 String search = request.getParameter("itemSearch");
		
		 response.sendRedirect("Index?search="+search);
		
	}

}
