<%@ page language ="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8");%>
<%@ page import="sql.userDAO" %>
<%@ page import="java.io.PrintWriter" %>
<jsp:useBean id="user" class="sql.userDTO" scope="page"/>
<jsp:setProperty name="user" property="userID"/>
<jsp:setProperty name="user" property="userPW"/>
<jsp:setProperty name="user" property="userName"/>
<script src="/movepage.js"></script>
<%
    userDAO userdao = new userDAO();
    if(user.getUserID().equals("") || user.getUserPW().equals("") || user.getUserName().equals("")){
        out.print("<script> alert('입력되지 않는 정보가 있습니다.');</script>");
    }else{
        int result = userdao.join(user);
        if(result == 0){
            out.print("<script> alert('회원가입을 완료하였습니다.'); back(); </script>");
        }else{
            out.print("<script> alert('아이디가 이미 등록되어있습니다.'); join(); </script>");

        }
    }
%>