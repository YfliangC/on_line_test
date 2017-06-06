<%@ page import="onlinetest.Teachers.Teacher" %>
<%@ page import="onlinetest.Teachers.TeacherDao" %><%--
  Created by IntelliJ IDEA.
  User: Maibenben
  Date: 2017/6/5
  Time: 11:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setCharacterEncoding("utf-8");
    response.setContentType("text/html;charset=utf-8");
    String name1 = request.getParameter("name");
    if (name1 == null){
        out.print("<script>alert('异常登陆网站，请重新进入'); window.location='index.jsp'</script>");
    }
    Teacher teacher = TeacherDao.getInstance().selectWhere(name1);
%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>在线考试系统-教师修改个人信息</title>
</head>
<body>
<form action="RwInfoDoT.jsp" method="post">
    <input type="hidden" name="name1" value=<%=name1%>>
    <input type="text" name="name2" value=<%=name1%>>用户名
    <input type="text" name="teasex" value=<%=teacher.getTeasex()%>>性别
    <input type="text" name="teaphone" value=<%=teacher.getTeaphone()%>>联系电话
    <input type="text" name="time" value=<%=teacher.getTime()%>>最后一次登陆时间
    <input type="hidden" name="pwd" value=<%=teacher.getTeapassword()%>>
    <input type="text" name="pwd1" value="">修改密码请输入
    <input type="text" name="pwd2" value="">请再次输入
    <input type="submit"  value="提交修改">
</form>
<form action="MainInfoT.jsp" method="post">
    <input type="hidden" name="name" value=<%=name1%>>
    <input type="submit" value="返回主界面">
</form>
</body>
</html>
