<!DOCTYPE html>
<html>
  <head>
     <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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

    <form action="home.html" id="login-form" method="post">
      <input type="email" placeholder="이름" id="name" />
      <input type="text" placeholder="이메일" id = "id"/>
      <input type="password" placeholder="비밀번호" id = "pwd" />
      <input type="password" placeholder="비밀번호 재확인" id = "pwd2"/>
      <input type="text" placeholder="주소" id = "address"/>
      <input type="submit" value="회원가입" />
    </form>

    <script
      src="https://kit.fontawesome.com/d19eaaab15.js"
      crossorigin="anonymous"
    ></script>
  </body>
</html>
