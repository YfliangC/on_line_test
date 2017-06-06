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
     String name1 = request.getParameter("name");
    if (name1 == null){
        out.print("<script>alert('异常登陆网站，请重新进入'); window.location='index.jsp'</script>");
    }
    Student student = StudentDao.getInstance().findByname(name1);
%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>在线考试系统-修改个人信息</title>
</head>
<body>
<form action="RwInfoDo.jsp" method="post">
    <input type="hidden" name="name1" value=<%=name1%>>
    <input type="text" name="name2" value=<%=name1%>>姓名
    <input type="text" name="sex" value=<%=student.getSex()%>>性别
    <input type="text" name="grade" value=<%=student.getGrade()%>>年级
    <input type="text" name="score1" value=<%=student.getScore1()%>>难度一最高成绩
    <input type="text" name="score2" value=<%=student.getScore2()%>>难度二最高成绩
    <input type="text" name="score3" value=<%=student.getScore3()%>>难度三最高成绩
    <input type="text" name="time" value=<%=student.getLast_data()%>>时间
    <input type="hidden" name="pwd" value=<%=student.getPwd()%>>
    <input type="password" name="pwd1" value="">修改密码请填写
    <input type="password" name="pwd2" value="">修改密码请再次填写
    <input type="submit"  value="提交修改">
</form>
<form action="MainInfo.jsp" method="post">
    <input type="hidden" name="name" value=<%=name1%>>
    <input type="submit" value="返回主界面">
</form>
</body>
</html>
