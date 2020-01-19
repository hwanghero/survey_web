<%@ page language ="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8");%>

<link rel="stylesheet" href="/css/bootstrap.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="/js/bootstrap.js"></script>

<html>
<head>
    <title>설문조사 회원가입</title>
</head>
<body>
<style>
    body {
        background: gray;
    }
</style>
<script src="/movepage.js"></script>

<center>
<div class="container" style="padding-top: 200px;">
    <div class="col-lg-4">
        <div class="jumbotron" style="padding-top: 25px; ">
            <form method="post" action="join_action.jsp">
                <h3 style="text-align: center; margin-bottom: 15px;">설문조사 회원가입</h3>
                <div class="form-group">
                    <input type="text" class="form-control" placeholder="이름" name="userName" maxlength="20">
                </div>
                <div class="form-group">
                    <input type="text" class="form-control" placeholder="아이디" name="userID" maxlength="20">
                </div>
                <div class="form-group">
                    <input type="password" class="form-control" placeholder="비밀번호" name="userPW" maxlength="20">
                </div>
                <input type="submit" class="btn btn-primary form-control" style="margin-bottom: 10px;" value="회원가입">
                <input class="btn btn-primary form-control" value="취소" onclick="back()">
            </form>
        </div>
    </div>
</div>
</center>
</body>
</html>
