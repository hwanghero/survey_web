<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2020-01-17
  Time: 오전 10:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="/css/bootstrap.css">
<html>
<head>
    <title>내 정보</title>
</head>
<body>
<%
    String userid = (String)session.getAttribute("userID");
    if(userid == null){
        out.print("<script> alert('Please login'); back(); </script>");
    }
%>
<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
    <a class="navbar-brand" href="#">내 정보</a>

    <ul class="navbar-nav mr-auto">
        <li class="nav-item">
            <a class="nav-link" href="/survey/index.jsp">참여하기</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="/user/mypage.jsp">내 정보</a>
        </li>
        <li class="nav-item">
            <a class="nav-link">(접속중인 아이디: <%=userid%>)</a>
        </li>
    </ul>
</nav>
<div class="container">
    <div class="row">
        <div class="col">
            <p><Center><h1>내 정보</h1></Center><p>
            <ul class="nav nav-tabs">
                <li class="nav-item">
                    <a class="nav-link active" data-toggle="tab" href="#join">수정</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" data-toggle="tab" href="#list">탈퇴</a>
                </li>
            </ul>

            <div class="tab-content">
                <div class="tab-pane fade show active" id="join">
                    <div class="container">
                       
                    </div>
                </div>
                <div class="tab-pane fade" id="list">
                    <div class="container">

                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
