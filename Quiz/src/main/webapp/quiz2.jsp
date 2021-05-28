<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.io.PrintWriter" %>
<%@ page import = "java.util.ArrayList" %>
<%
request.setCharacterEncoding("UTF-8");
%>


<!DOCTYPE html>
<html>
  <head>
    <meta name="viewport" content="width=device-width"/>
    <title>퀴즈2</title>
    <link rel="stylesheet" href="" />
  </head>

  <body>
  
 <form name="student" method="post" action="student.jsp">
      <center>
        <table cellspacing="1" cellpadding="2">
          <tr bgcolor="yellow">
            <td align="center" colspan="2"><b>학생정보</b></td>
          </tr>

          <tr>
            <td align="right">학생 아이디:</td>
            <td><input type="text" name="id" /></td>
          </tr>

          <tr>
            <td align="right">학생 이름:</td>
            <td><input type="text" name="name" /></td>
          </tr>

          <tr>
            <td align="right">학생 번호:</td>
            <td><input type="text" name="snum" /></td>
          </tr>

          <tr>
            <td align="right">태어난 해:</td>
            <td>
              <select name="year">
                <option selected value="1990">1990</option>
                <option value="1991">1991</option>
                <option value="1992">1992</option>
                <option value="1993">1993</option>
                <option value="1994">1994</option>
                <option value="1995">1995</option>
                <option value="1996">1996</option>
              </select>
            </td>
          </tr>
          <tr>
            <td align="right">암호:</td>
            <td><input type="password" name="pass" /></td>
          </tr>

          <tr>
            <td align="right">전자메일:</td>
            <td><input type="text" name="email" /></td>
          </tr>

          <tr>
            <td align="center">
              <input type="submit" name="submit" value="입력완료" />
            </td>
            <td align="center">
              <input type="reset" name="reset" value="다시쓰기" />
            </td>
          </tr>
        </table>
      </center>
    </form>
    

    
  
  </body>
</html>
