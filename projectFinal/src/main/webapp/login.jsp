<!DOCTYPE html>
<html>
  <head>
     <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <meta name="viewport" content="width=device-width" />
    <title>영기PC</title>
    <link rel="stylesheet" href="css/login.css" />
  </head>

  <body>
    <header class="welcome-header">
      <h1 class="welcome-header__title">로그인 하여 영기PC를 이용하세요.</h1>
      <p class="welcome-header__text">
        계정이 없으시다면 회원가입을 진행해주세요.
      </p>
    </header>

    <form action="home.html" id="login-form" method="post">
      <input type="email" placeholder="이메일" id = "id" />
      <input type="password" placeholder="비밀번호" id = "pwd"/>
      <input type="submit" value="로그인" />
      <a href="join.jsp">회원가입</a>
    </form>

    <script
      src="https://kit.fontawesome.com/d19eaaab15.js"
      crossorigin="anonymous"
    ></script>
  </body>
</html>
