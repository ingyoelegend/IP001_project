 <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta name="viewport" content="width=device-width" />
    <title>퀴즈</title>
  
  </head>

  <body>
    

    <form action="joinPostQuiz.jsp" id="login-form" method="post">
      <input type="text" placeholder="이름"  name = "userName" required />
      <input type="text" placeholder="성별"  name = "userGender" required/>
      <input type="text" placeholder="취미"  name = "userHobby" required/>
      <input type="text" placeholder="전화번호"  name = "userPhone" required/>
      <input type="submit" value="회원가입" id = "submit" />
    </form>

<br>

   <form action="showPostQuiz.jsp" id="login-form" method="post">
      <input type="submit" value="회원 정보 조회" id = "submit" />
    </form>
  
         

  </body>
</html>
