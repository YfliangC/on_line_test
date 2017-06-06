<%--
  Created by IntelliJ IDEA.
  User: Maibenben
  Date: 2017/6/4
  Time: 0:16
  To change this template use File | Settings | File Templates.
--%>

<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="onlinetest.Students.Student,onlinetest.Students.StudentDao" %>
<%
    request.setCharacterEncoding("utf-8");
    response.setContentType("text/html;charset=utf-8");
    String name=request.getParameter("name");
    if (name == null){
        out.print("<script>alert('异常登陆网站，请重新进入'); window.location='index.jsp'</script>");
    }
    Student student = StudentDao.getInstance().findByname(name);
%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>在线考试系统-个人信息</title>
</head>
<body>
<table border="1">
    <tr>
        <td>姓名</td>
        <td>性别</td>
        <td>年级</td>
        <td>难度一最高成绩</td>
        <td>难度二最高成绩</td>
        <td>难度三最高成绩</td>
        <td>最后一次考试时间</td>
    </tr>
    <tr>
        <td><%=student.getName() %></td>
        <td><%=student.getSex() %></td>
        <td><%=student.getGrade() %></td>
        <td><%=student.getScore1() %></td>
        <td><%=student.getScore2() %></td>
        <td><%=student.getScore3() %></td>
        <td><%=student.getLast_data() %><td>
    </td>
    </tr>
</table>
<form action="MainInfo.jsp" method="post">
    <input type="hidden" name="name" value=<%=name %>>
    <input type="submit" name="username" value="返回上一页">
</form>
</body>
</html>
