package com.KimYoungKi.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.KimYoungKi.dao.BoardDao;
import com.KimYoungKi.dao.ItemDao;
import com.KimYoungKi.dao.UserDao;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;


@WebServlet("/UploadItem")
public class UploadItem extends HttpServlet {
	private static final long serialVersionUID = 1L;
      
	
   
    public UploadItem() {
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
	        	RequestDispatcher view = request.getRequestDispatcher("uploadItem.jsp");
	   		 	view.forward(request, response);
	        }
	     
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		ItemDao itemDao = new ItemDao();
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
            
            String directory = request.getSession().getServletContext().getRealPath("/upload/");

            int maxSize = 1024*1024*100;
            String encoding = "UTF-8";
            DefaultFileRenamePolicy policy = new DefaultFileRenamePolicy();
            
            
            MultipartRequest multipartRequest = new MultipartRequest(request,directory,maxSize,encoding,policy);
            
            String itemImage = multipartRequest.getOriginalFileName("itemImage");
            String itemImageReal = multipartRequest.getFilesystemName("itemImage");
            String itemText = multipartRequest.getParameter("itemText");
            String itemTitle = multipartRequest.getParameter("itemTitle");
            String itemPrice = multipartRequest.getParameter("itemPrice");
            String itemCount = multipartRequest.getParameter("itemCount");
            String itemCategory = multipartRequest.getParameter("itemCategory");
           
            if(itemText == null || itemTitle == null ||itemCount.equals("") || itemPrice.equals("")  || itemImage == null )
            {
            	File file = new File(directory+itemImageReal);
            	file.delete();
            	
            	 PrintWriter script = response.getWriter();
             	 script.println("<script>");
             	 script.println("alert('입력이 안된 정보가 있습니다. 다시 입력해주세요.')");
               	 script.println("location.href = 'UploadItem'");
             	 script.println("</script>");
            }  
            else if(!itemImage.substring(itemImage.lastIndexOf(".")+1).equals("jpg") && !itemImage.substring(itemImage.lastIndexOf(".")+1).equals("jpeg")&& !itemImage.substring(itemImage.lastIndexOf(".")+1).equals("png")
            		&& !itemImage.substring(itemImage.lastIndexOf(".")+1).equals("PNG") && !itemImage.substring(itemImage.lastIndexOf(".")+1).equals("JPEG")&& !itemImage.substring(itemImage.lastIndexOf(".")+1).equals("JPG"))
            {
            	File file = new File(directory+itemImageReal);
            	file.delete();
            	
            	 PrintWriter script = response.getWriter();
             	 script.println("<script>");
             	 script.println("alert('jpg jpeg png 파일만 허용됩니다.')");
               	 script.println("location.href = 'UploadItem'");
             	 script.println("</script>");
            }
            else
            {
            	HashMap<String,String> hashmap = new HashMap<>();
    			
    			hashmap.put("itemImage", itemImage);
    			hashmap.put("itemImageReal", itemImageReal);
    			hashmap.put("itemText", itemText);
    			hashmap.put("itemTitle", itemTitle);
    			hashmap.put("itemPrice", itemPrice);
    			hashmap.put("itemCount", itemCount);
    			hashmap.put("itemCategory", itemCategory);
    			
    			int itemID = itemDao.getNext()+1;
    			
    			hashmap.put("itemID", Integer.toString(itemID));
    			
    		
    			
    			int result = itemDao.uploadItem(hashmap);


    			if(result == 1)
    			    			{
    			    				 PrintWriter script = response.getWriter();
    			                 	 script.println("<script>");
    			                 	 script.println("alert('등록을 완료했습니다.')");
    			                   	 script.println("location.href = 'Index'");
    			                 	 script.println("</script>");
    			    			}
    			    			else
    			    			{
    			    				 PrintWriter script = response.getWriter();
    			                 	 script.println("<script>");
    			                 	 script.println("alert('등록에 실패했습니다.')");
    			                   	 script.println("location.href = 'UploadItem'");
    			                 	 script.println("</script>");
    			    			}
    			
    			
    			
            }
	       
	}

}
