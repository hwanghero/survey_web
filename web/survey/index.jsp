<%@ page import="sql.surveyDAO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="/css/bootstrap.css">

<script src="/movepage.js"></script>
<%
    String userid = (String)session.getAttribute("userID");
    if(userid == null){
        out.print("<script> alert('Please login'); back(); </script>");
    }
%>
<html>
<head>
    <title>설문조사</title>
</head>
<body>
    <nav class="navbar navbar-expand-sm bg-dark navbar-dark">
        <a class="navbar-brand" href="#">메인화면</a>

        <ul class="navbar-nav mr-auto">
            <li class="nav-item">
                <a class="nav-link" href="index.jsp">참여하기</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/user/mypage.jsp">내 정보</a>
            </li>
            <li class="nav-item">
                <a class="nav-link">(접속중인 아이디: <%=userid%>)</a>
            </li>
        </ul>
    </nav>
    <!--
    유저 설문조사 중복체크해야함
    -->
    <script>
        function start(num) {
            console.log(num);
            location.href="/survey/start.jsp?num="+num;
        }
    </script>
    <%
        surveyDAO surveydao = new surveyDAO();
        int count = surveydao.main_surveyCount();
        String[][] list = surveydao.main_getSurveyList();
    %>

    <div class="container">
    <div class="row">
    <div class="col">
    <p><Center>
        <h1>참여하기</h1>
    </Center>
        <p>
    <ul class="nav nav-tabs">
        <li class="nav-item">
            <a class="nav-link active" data-toggle="tab" href="#join">미참여</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" data-toggle="tab" href="#list">참여</a>
        </li>
    </ul>
    <div class="tab-content">
        <div class="tab-pane fade show active" id="join">
            <div class="container">
            <table class="table">
                <thead>
                <tr>
                    <th>제목</th>
                    <th>설명</th>
                    <th>참여여부</th>
                </tr>
                </thead>
                <tbody>
                <%
                    for(int i=0; i<list.length; i++){
                        int check = surveydao.user_survey_check(Integer.parseInt(list[i][0]), userid);
                        if(check == 0){
                            out.print("<tr><td>"+list[i][1]+"</td>"+
                                    "<td>"+list[i][3]+"</td>"+
                                    "<td><input type='button' class='btn btn-success' value='참여' onclick='start("+list[i][0]+")'></td></tr>");
                        }
                        System.out.println(Integer.parseInt(list[i][0]));
                    }
                %>
                </tbody>
            </table>
            </div>
    </div>
        <div class="tab-pane fade" id="list">
            <div class="container">
                <table class="table">
                    <thead>
                    <tr>
                        <th>제목</th>
                        <th>설명</th>
                    </tr>
                    </thead>
                    <tbody>
                    <%
                        for(int i=0; i<list.length; i++){
                            int check = surveydao.user_survey_check(Integer.parseInt(list[i][0]), userid);
                            if(check == 1){
                                out.print("<tr><td>"+list[i][1]+"</td>"+
                                        "<td>"+list[i][3]+"</td>");
                            }
                        }
                    %>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    </div>
    </div>
    </div>
</body>
</html>
