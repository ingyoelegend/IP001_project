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
import com.KimYoungKi.model.UserModel;



@WebServlet("/Join")
public class Join extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	UserDao userDao = new UserDao();
   
    public Join() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	


			 RequestDispatcher view = request.getRequestDispatcher("join.jsp");
	    	 view.forward(request, response);
		
	
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		try 
		{
			String userName = request.getParameter("userName");
			String userAddress = request.getParameter("userAddress");
			String userID = request.getParameter("userID");
			String userPassword = request.getParameter("userPassword");
			
			UserModel user = new UserModel();
			
			user.setUserID(userID);
			user.setUserName(userName);
			user.setUserPassword(userPassword);
			user.setUserAddress(userAddress);
			user.setOpCode(0);
			
			
			int result = userDao.join(user);
			
		    if(result == 1)
		    {
		    	  PrintWriter script = response.getWriter();
		    	  session.invalidate();
	       	      script.println("<script>");
	       	      script.println("alert('회원가입을 성공했습니다. 로그인 후에 이용해주세요.')");
	         	  script.println("location.href = 'Login'");
	         	  script.println("</script>");
		    }
		} 
		catch (Exception e) 
		{
			e.printStackTrace();

	    	 PrintWriter script = response.getWriter();
        	 script.println("<script>");
        	 script.println("alert('이미 계정이 존재하거나 데이터베이스 오류입니다.')");
          	 script.println("location.href = 'Join'");
        	 script.println("</script>");
		}
		
		
	   
		
	}

}
