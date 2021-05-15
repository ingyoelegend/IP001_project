<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.io.PrintWriter" %>
<%@ page import = "user.UserController" %>
<%@ page import = "com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import = "com.oreilly.servlet.MultipartRequest" %>
<%@ page import = "item.Item" %>
<%@ page import = "item.ItemController" %>


<%
request.setCharacterEncoding("UTF-8");
%>

<!DOCTYPE html>
<html>
  <head>
    <meta name="viewport" content="width=device-width"/>
    <title>영기PC</title>
    <link rel="stylesheet" href="css/uploadItem.css" />
  </head>

  <body>
    <%
        UserController us = new UserController();
        
    	if(session.getAttribute("userID") == null)
    	{
    		 PrintWriter script = response.getWriter();
        	
        	 script.println("<script>");
        	 script.println("alert('로그인 후에 이용해주세요.')");
        	 script.println("location.href = 'login.jsp'");
        	 script.println("</script>");
        	
    	}
        
        if(us.getOpCode((String)session.getAttribute("userID")) != 1)
        {     
        	 PrintWriter script = response.getWriter();
        	
        	 script.println("<script>");
        	 script.println("alert('관리자 권한을 보유하고 있지 않습니다.')");
        	 script.println("location.href = 'index.jsp'");
        	 script.println("</script>");
        	
        }
       
     
            String directory = this.getClass().getResource("").getPath();
            directory = directory.substring(1,directory.indexOf(".metadata"))+"project/src/main/webapp/upload";

   	


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
            	 PrintWriter script = response.getWriter();
             	 script.println("<script>");
             	 script.println("alert('입력이 안된 정보가 있습니다. 다시 입력해주세요.')");
               	 script.println("location.href = 'uploadItem.jsp'");
             	 script.println("</script>");
            }  

            if(!itemImage.substring(itemImage.lastIndexOf(".")+1).equals("jpg") && !itemImage.substring(itemImage.lastIndexOf(".")+1).equals("jpeg")&& !itemImage.substring(itemImage.lastIndexOf(".")+1).equals("png"))
            {
            	 PrintWriter script = response.getWriter();
             	 script.println("<script>");
             	 script.println("alert('jpg jpeg png 파일만 허용됩니다.')");
               	 script.println("location.href = 'uploadItem.jsp'");
             	 script.println("</script>");
            }
            
            Item item = new Item();
            
            item.setItemText(itemText);
            item.setItemTitle(itemTitle);
            item.setItemPrice(Integer.parseInt(itemPrice));
            item.setItemCount(Integer.parseInt(itemCount));            
            item.setItemImage(itemImage);
            item.setItemImageReal(itemImageReal);
            item.setItemCategory(itemCategory);
            
            ItemController tmp2 = new ItemController();
            
            int result = tmp2.upload(item);
         
            
            if(result == 1)
            {
            	PrintWriter script = response.getWriter();
           	 script.println("<script>");
           	 script.println("alert('상품 등록에 성공하였습니다.')");
             	 script.println("location.href = 'index.jsp'");
           	 script.println("</script>");
              
            }
             
        %>
            
       
         
         
            
          
            
            
            
          
			
	
      
       
        
      
        
   
 


    
    <script
      src="https://kit.fontawesome.com/d19eaaab15.js"
      crossorigin="anonymous"
    ></script>

  </body>
</html>
