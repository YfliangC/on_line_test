<%--
  Created by IntelliJ IDEA.
  User: Maibenben
  Date: 2017/6/3
  Time: 18:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"  pageEncoding="UTF-8" %>
<html>
<head>
    <title>在线考试系统-注册界面</title>
</head>
<body>
亲爱的用户，你尚未注册，请注册
<form method="post" action="SignupDo.jsp">
    <table align="center" >
        <tr>
            <td>用户id(数字)：</td>
            <td>
                <input type="text" onkeyup="value=value.replace(/[^1234567890-]+/g,'')" name="userid" id="userid" /><font color="red">*</font>
            </td>
        </tr>
        <tr>
            <td>用户名：</td>
            <td>
                <input type="text" name="name" id="name"><font color="red">*</font>
            </td>
        </tr>
        <tr>
            <td>密码：</td>
            <td>
                <input type="password" name="pwd" id="pwd"><font color="red">*</font>
            </td>
        </tr>
        <tr>
            <td>性别：(男，女)</td>
            <td>
                <input type="text" name="sex" id="sex"><font color="red">*</font>
            </td>
        </tr>
        <tr>
            <td>年级：(大一，大二，大三，大四)</td>
            <td>
                <input type="text" name="grade" id="grade"><font color="red">*</font>
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
</form>
</body>
</html>
