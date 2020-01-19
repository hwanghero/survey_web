<%@ page import="sql.surveyDAO" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %><%--
  Created by IntelliJ IDEA.
  User: owner
  Date: 2020-01-11
  Time: 오전 2:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page language ="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8");%>
<html>
<head>
    <meta charset="UTF-8">
    <title>Title</title>
</head>
<body>
<script src="/movepage.js"></script>
<%
    // 메인 설문조사
    int num = Integer.parseInt(request.getParameter("num"));
    // 유저
    String userid = (String)session.getAttribute("userID");

    if(userid == null){
        out.print("<script> alert('Please login'); back(); </script>");
    }
    surveyDAO surveydao = new surveyDAO();

    // 현재날짜 구함
    Date date = new Date();
    SimpleDateFormat simpleDate = new SimpleDateFormat("yyyy-MM-dd");
    String strdate = simpleDate.format(date);

    // 주관식,객관식 구함
    String[][] survey = surveydao.getSurveyList(num);
    String[] get_mulit = new String[survey.length];
    String[] get_short = new String[survey.length];

    for(int i=0; i<survey.length; i++){
        if(survey[i][4].equals("Radio")){
            get_mulit[i] = request.getParameter("radio_mulit_"+survey[i][0]);
            surveydao.useranswer_insert(num, userid, strdate, "Radio", get_mulit[i], Integer.parseInt(survey[i][0]));
            out.print("라디오 결과: "+get_mulit[i]);
        }
        if(survey[i][4].equals("Check")){
            String[] get_check = request.getParameterValues("check_mulit_"+survey[i][0]);
            for(String val : get_check){
                surveydao.useranswer_insert(num, userid, strdate, "Check", val, Integer.parseInt(survey[i][0]));
                out.print("체크박스 결과: "+val);
            }
        }
        if(survey[i][4].equals("Text")){
            get_short[i] = request.getParameter("short_"+survey[i][0]);
            surveydao.useranswer_insert(num, userid, strdate, "Text", get_short[i], Integer.parseInt(survey[i][0]));
            out.print("주관식 결과: "+get_short[i]);
        }
    }
%>
<script>home();</script>
<br>
설문조사 번호 <%=num%>
</body>
</html>
