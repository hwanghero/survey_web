<%@ page import="sql.surveyDAO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="/css/bootstrap.css">

<%
    int num = Integer.parseInt(request.getParameter("num"));
    surveyDAO surveydao = new surveyDAO();
    String[] list = surveydao.main_getSurveyList(num);

    String userid = (String)session.getAttribute("userID");
    if(userid == null){
        out.print("<script> alert('Please login'); back(); </script>");
    }
%>
<html>
<head>
    <title><%=list[1]%> 설문조사</title>
</head>
<body>

<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
    <a class="navbar-brand" href="#"><%=list[1]%></a>

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

<form method="post" action="start_action.jsp">
<%
    // 서브 설문조사 불러옴
    String[][] survey = surveydao.getSurveyList(num);

    // 객관식
    int mulit_count;
    String[][] get_mulit;

    // 주관식
    int short_count;
    out.print(" <div class=\"container p-3 my-3 bg-dark text-white\">");
    for(int i=0; i<survey.length; i++){


        mulit_count = surveydao.getMulitCount(Integer.parseInt(survey[i][0]));
        short_count = surveydao.getShortCount(Integer.parseInt(survey[i][0]));

        out.print("<h3>"+survey[i][1]+"</h3><p>");
        String name = "mulit_";

        if(mulit_count > 0){
            get_mulit = surveydao.getMulititem(Integer.parseInt(survey[i][0]));
            for(int x=0; x<mulit_count; x++){

                if(survey[i][4].equals("Radio")){
                    out.print("<div class=\"form-check\">\n" +
                            "  <label class=\"form-check-label\">");
                    out.print("<input type='radio' class=\"form-check-input\" name='"+"radio_"+name+survey[i][0]+"' value='"+get_mulit[x][3]+"'>"+get_mulit[x][3]);
                    out.print(" </label>\n" +
                            "</div>");
                }
                out.print("<p>");
                if(survey[i][4].equals("Check")){
                    out.print("<div class=\"form-check\">\n" +
                            "  <label class=\"form-check-label\">");
                    out.print("<input type='checkbox' class=\"form-check-input\" name='"+"check_"+name+survey[i][0]+"' value='"+get_mulit[x][3]+"'>"+get_mulit[x][3]);
                    out.print("</label>\n" +
                            "</div>");

                }
                out.print("<p>");
                // 마지막에 띄어주고
                if(mulit_count == x+1){
                    out.print("<p>");
                }
            }
        }

        if(short_count > 0){
            if(survey[i][4].equals("Text")){
                out.print("<textarea class=\"form-control\" rows=\"3\" name='"+"short_"+survey[i][0]+"'></textarea>");
                out.print("<p>");
            }
            // 마지막에 띄어주고
            out.print("<p>");
        }

    }

%>
<input type="hidden" value=<%=num%> name="num">
    <center>
<p><input type="submit" class="btn btn-success btn-lg"value="제출">
    </center>
</form>
</div>
</body>
</html>
