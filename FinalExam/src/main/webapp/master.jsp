<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
  <head>
    <meta name="viewport" content="width=device-width"/>
    <title>영기PC</title>
    <link rel="stylesheet" href="css/master.css" />
  </head>

  <body>


      
        
        <div id = "page">
        <input class="upload-name" value="관리자 메뉴" disabled="disabled">
         <div class = "page_list">
         <a href = "UploadItem" class="upload-hidden">상품 등록 페이지</a>
        </div>
        
         <div class = "page_list">
         <a href = "DeleteItem" class="upload-hidden">상품 삭제 페이지</a>
        </div>
        
          <div class = "page_list">
         <a href = "DeleteUser" class="upload-hidden">회원 삭제 페이지</a>
        </div>
        
          <div class = "page_list">
         <a href = "DeleteBoard" class="upload-hidden">게시판 글 삭제 페이지</a>
        </div>
        
          <div class = "page_list">
         <a href = "CustomMaster" class="upload-hidden">관리자 권한 수정 페이지</a>
        </div>
        
       
        
       
        </div>
       
      
    

    <script
      src="https://kit.fontawesome.com/d19eaaab15.js"
      crossorigin="anonymous"
    ></script>
  
  </body>
</html>
