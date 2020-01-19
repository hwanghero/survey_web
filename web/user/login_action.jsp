<%@ page import="sql.userDAO" %>
<%@ page language ="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8");%>
<jsp:useBean id="user" class="sql.userDTO" scope="page"/>
<jsp:setProperty name="user" property="userID"/>
<jsp:setProperty name="user" property="userPW"/>

<html>
<head>
    <title>로그인</title>
</head>
<body>
<script src="/movepage.js"></script>
<%=user.getUserID()%>
<%=user.getUserPW()%>
<%
    userDAO userdao = new userDAO();
    int check = userdao.Login(user);
    if(check == 1){
        session.setAttribute("userID", user.getUserID());
        out.print("<script> alert('welcome "+user.getUserID()+"'); home(); </script>");
    }else{
        out.print("<script> alert('login failed'); back(); </script>");
    }
%>
</body>
</html>