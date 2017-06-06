<%--
  Created by IntelliJ IDEA.
  User: Maibenben
  Date: 2017/6/5
  Time: 11:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>在线考试系统</title>
</head>
<body>
<h1>在线考试系统-主页</h1>
<%
    request.setCharacterEncoding("utf-8");
    response.setContentType("text/html;charset=utf-8");
    String  name=request.getParameter("name");
    if (name == null){
        out.print("<script>alert('异常登陆网站，请重新进入'); window.location='index.jsp'</script>");
    }
    out.println("亲爱的教师你好，用户名[<font color='red'>"+ name +"</font>],");
%>

<br>
<p align="center">
    请选择您要进行的操作：
<form action="RwInfoT.jsp" method="post">
    <input type="hidden" name="name" value=<%=name%>>
    <input type="submit" name="submit" value="查看并修改个人信息">
</form>

<form action="RwQstinfoT.jsp" method="post">
    <input type="hidden" name="name" value=<%=name %>>
    <input type="radio" name="qstdifficult" value="easy" checked>简单
    <input type="radio" name="qstdifficult" value="middle">中等
    <input type="radio" name="qstdifficult" value="difficult">困难
    <input type="radio" name="qsttype" value="1">单选题
    <input type="radio" name="qsttype" value="2">多选题
    <input type="hidden" name="rwbefore" value="0">
    <input type="submit" name="submit" value="查看并修改试卷信息">
</form>
<a href="javascript:;"onclick="location='index.jsp'">
    <input type=button value="退出登陆" />
</a>

</body>
</html>
