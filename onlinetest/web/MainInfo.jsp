<%--
  Created by IntelliJ IDEA.
  User: Maibenben
  Date: 2017/6/4
  Time: 0:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>在线考试系统</title>

    <style type="text/css">
        input{
            color:red;
            font-size:12pt;
        }
    </style>

</head>
<body bgcolor="#add8e6">
<center><h1>在线考试系统-主页</h1></center>
<hr>
<%
    request.setCharacterEncoding("utf-8");
    response.setContentType("text/html;charset=utf-8");
    String  name=request.getParameter("name");
    if (name == null){
        out.print("<script>alert('异常登陆网站，请重新进入'); window.location='index.jsp'</script>");
    }
    out.println("登陆成功，用户名[<font color='red'>"+ name +"</font>],");
%>
<br>
<p align="center">
    请选择您要进行的操作：
<form action="RwInfo.jsp" method="post">
    <input type="hidden" name="name" value=<%=name%>>
    <input type="submit" name="submit" value="查看并修改个人信息">
</form>
<form action="Test.jsp" method="post">
    <input type="hidden" name="name" value=<%=name %>>
    <input type="radio" name="qstdifficult" value="easy" checked>简单
    <br>
    <input type="radio" name="qstdifficult" value="middle">中等
    <br>
    <input type="radio" name="qstdifficult" value="difficult">困难
    <input type="submit" name="submit" value="考试">
</form>
<a href="javascript:;"onclick="location='index.jsp'">
    <input type=button value="退出登陆" />
</a>
</body>
</html>
