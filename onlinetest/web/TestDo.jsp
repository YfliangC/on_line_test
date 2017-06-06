<%@ page import="onlinetest.Questions.QuestionDao" %>
<%@ page import="onlinetest.Questions.Question" %>
<%@ page import="onlinetest.Students.Student" %>
<%@ page import="onlinetest.Students.StudentDao" %><%--
  Created by IntelliJ IDEA.
  User: Maibenben
  Date: 2017/6/4
  Time: 17:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String name = request.getParameter("name");
    String qstdifficult = request.getParameter("qstdifficult");
    if ((name == null) || (qstdifficult == null) ) {
        out.print("<script>alert('异常登陆网站，请重新进入'); window.location='index.jsp'</script>");
    }
%>
<%
    if ((name != null) && (qstdifficult!=null))
    {
        java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        java.util.Date currentTime = new java.util.Date();
        String str_date1 = formatter.format(currentTime); //将日期时间格式化
        String str_date2 = currentTime.toString();

        int finalscore = 0;
        finalscore+= QuestionDao.getInstance().putScore(request.getParameter("q0"),request.getParameterValues("0"));
        finalscore+= QuestionDao.getInstance().putScore(request.getParameter("q1"),request.getParameterValues("1"));
        finalscore+= QuestionDao.getInstance().putScore(request.getParameter("q2"),request.getParameterValues("2"));
        finalscore+= QuestionDao.getInstance().putScore(request.getParameter("q3"),request.getParameterValues("3"));
        finalscore+= QuestionDao.getInstance().putScore(request.getParameter("q4"),request.getParameterValues("4"));


        Student student = StudentDao.getInstance().findByname(name);
        int thisScore = StudentDao.getInstance().getScoreByqstd(student,qstdifficult);
        %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>在线考试系统-考试结果</title>
</head>
<body>
<table border="1">
    <tr>
        <td>姓名</td>
        <td>性别</td>
        <td>年级</td>
        <td>本次考试难度</td>
        <td>本次考试分数</td>
        <td>改难度最高分数</td>
        <td>本次考试时间</td>
    </tr>
    <tr>
        <td><%=student.getName() %></td>
        <td><%=student.getSex() %></td>
        <td><%=student.getGrade()%></td>
        <td><%=qstdifficult %></td>
        <td><%=finalscore %></td>
        <td><%=thisScore %></td>
        <td><%=str_date1 %><td>
    </td>
    </tr>
</table>
<%
    StudentDao.getInstance().setScore(student,qstdifficult,finalscore);
    StudentDao.getInstance().setTime(student,currentTime);
    StudentDao.getInstance().upDate(student,student.getName());
%>
<form action="MainInfo.jsp" method="post">
    <input type="hidden" name="name" value=<%=name %>>
    <input type="submit" name="username" value="返回上一页">
</form>
</body>
</html>
<%
    }

%>



