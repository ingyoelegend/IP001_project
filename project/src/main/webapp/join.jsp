 <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta name="viewport" content="width=device-width" />
    <title>영기PC</title>
    <link rel="stylesheet" href="css/join.css" />
  </head>

  <body>
    <header class="welcome-header">
      <h1 class="welcome-header__title">회원가입을 진행하여 영기PC를 이용하세요.</h1>
      <p class="welcome-header__text">
        회원가입을 통해 영기 PC를 이용하세요!
      </p>
    </header>

    <form action="joinPost.jsp" id="login-form" method="post">
      <input type="text" placeholder="이름" id="name" name = "userName" required />
      <input type="email" placeholder="이메일" id = "id" name = "userID" required/>
      <input type="password" placeholder="비밀번호" id = "pwd" name = "userPassword" required/>
      <input type="password" placeholder="비밀번호 재확인" id = "pwd2" name = "userPassword2" required/>
      <input type="text" placeholder="주소" id = "address" name = "userAddress" required/>
      <input type="submit" value="회원가입" id = "submit" />
    </form>

    <script
      src="https://kit.fontawesome.com/d19eaaab15.js"
      crossorigin="anonymous"
    ></script>
    
   <script type = "text/javascript" src="Javascript/join.js" charset="utf-8"></script>
         

  </body>
</html>
