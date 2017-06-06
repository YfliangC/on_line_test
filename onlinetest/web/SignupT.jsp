<%--
  Created by IntelliJ IDEA.
  User: Maibenben
  Date: 2017/6/5
  Time: 11:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>在线考试系统-注册界面</title>
</head>
<body>
亲爱的老师，你尚未注册，请注册
<form method="post" action="SignupDoT.jsp">
    <table align="center" >
        <tr>
            <td>用户id(数字)：</td>
            <td>
                <input type="text" onkeyup="value=value.replace(/[^1234567890-]+/g,'')" name="teaid" /><font color="red">*</font>
            </td>
        </tr>
        <tr>
            <td>用户名：</td>
            <td>
                <input type="text" name="teaname"><font color="red">*</font>
            </td>
        </tr>
        <tr>
            <td>密码：</td>
            <td>
                <input type="password" name="teapassword"><font color="red">*</font>
            </td>
        </tr>
        <tr>
            <td>性别：(男，女)</td>
            <td>
                <input type="text" name="teasex"><font color="red">*</font>
            </td>
        </tr>
        <tr>
            <td>电话：</td>
            <td>
                <input type="text" onkeyup="value=value.replace(/[^1234567890-]+/g,'')" name="teaphone"><font color="red">*</font>
            </td>
        </tr>
        <tr>
            <td>
                <input type="submit" value="注册">
                <input type="reset" value="重置">
            </td>
            <td>
                <input type="button" value="返回" onclick="location.href='javascript:history.go(-1);'"/>
            </td>
        </tr>
    </table>

</body>
</html>
