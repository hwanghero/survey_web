<%@ page language ="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8");%>

<script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.3.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width", initial-scale="1">
  <link rel="stylesheet" href="css/bootstrap.css">
  <title>설문조사</title>
</head>
<body>
<style>
  body {
    background: gray;
  }
</style>
<script language="JavaScript" src="/movepage.js"></script>
<center>
  <div class="container" style="padding-top: 200px">
    <div class="col-lg-4">
      <div class="jumbotron" style="">
        <form method="post" action="/user/login_action.jsp">
          <h3 style="text-align: center; margin-bottom: 30px;">설문조사 로그인</h3>
          <div class="form-group">
            <input type="text" class="form-control" placeholder="아이디" name="userID" maxlength="20">
          </div>
          <div class="form-group">
            <input type="password" class="form-control" placeholder="비밀번호" name="userPW" maxlength="20">
          </div>
          <input type="submit" class="btn btn-primary form-control" style="margin-bottom: 10px;" value="로그인">
          <input class="btn btn-primary form-control" value="회원가입" onclick="join()">
        </form>
      </div>
    </div>
  </div>
</center>
</body>
</html>