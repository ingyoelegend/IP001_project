<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
%>

<!DOCTYPE html>
<html>
  <head>
    <meta name="viewport" content="width=device-width"/>
    <title>영기PC</title>
    <link rel="stylesheet" href="css/master.css" />
  </head>

  <body>
  

       <form id="write_form" action="UploadItem" enctype="multipart/form-data" method="post">
      
                   <div id = "content_wrap">
    <div id="content">
         <div id="image">
           <span class="upload-hidden">상품 이미지</span>

       <br>
       	    <input type="file" name = "itemImage" accept = "image/*" required/>
       	     <br>
       	      <br>
       </div>
       
       <div id="category">
      <span class="upload-hidden">카테고리</span>
       <br>
       키보드
        <input type = "radio"  name = "itemCategory" value = "키보드" required></input>
         <br>
       마우스
        <input type = "radio"  name = "itemCategory" value = "마우스"></input>
         <br>
       케이스
        <input type = "radio"  name = "itemCategory" value = "케이스"></input>
         <br>
       헤드폰
        <input type = "radio"  name = "itemCategory" value = "헤드폰"></input>
         <br>
       모니터
        <input type = "radio"  name = "itemCategory" value = "모니터"></input>
       	   <br>
       	      <br>
       	 
       	    </div>
       	  
     
      </div>
      
       <div id="title">
           <span class="upload-hidden">상품명</span>
       <br>
 
       	    <input type="text" placeholder = "상품명."  maxlength = "40" name = "itemTitle" required/>
       	     <br>
       	  
       </div>
   
              <br>
       	 
   
      <div id="text">
      <span class="upload-hidden">소개글</span>
  
       	            <br>
       <br>
       	
       	    <textarea placeholder = "소개글을 입력해 주세요." name = "itemText" maxlength = "100" required></textarea>
       	    </div>
       	  
     
      </div>
        <br>
         <div id="count">
           <span class="upload-hidden">상품 개수</span>
   <br>

       	    <input type="number" placeholder = "상품개수" id = "itemCount" name = "itemCount" required/>
       	     <br>
       	      <br>
       </div>
       
          <div id="title">
           <span class="upload-hidden">상품 가격</span>
 
 <br>
       	    <input type="number" placeholder = "화폐 단위는(원)입니다" id = "itemPrice" name = "itemPrice" required />
       	    <br>
       	      <br>
       	    <div id = "write_submit_wrap"> <input type="submit" id="write_submit" value = "상품 등록" />
       	     <br>
       	      <br>
       </div>
       
       
   
      
        
       
      </div>
      
    
       </form>
       
           
 
    
    <script
      src="https://kit.fontawesome.com/d19eaaab15.js"
      crossorigin="anonymous"
    ></script>
    
    

  </body>
</html>
