<%--
  Created by IntelliJ IDEA.
  User: Maibenben
  Date: 2017/6/3
  Time: 17:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<%@ page import="onlinetest.Students.Student,onlinetest.Students.StudentDao" %>
<%@ page import="java.util.Objects" %>

<%
    request.setCharacterEncoding("utf-8");
    String name = request.getParameter("name");
    String pwd = request.getParameter("pwd");

    if ((null != name) && (null != pwd) && ("" != name) && ("" != pwd)) {
        Student student = StudentDao.getInstance().findByname(name);
        if (Objects.equals(student.getName(), null)) {
            out.print("<script>result=confirm('用户名不存在，请注册'); if(result == true){self.location = 'index.jsp'} else{ window.location='index.jsp'}</script>");
        } else {
            if (!Objects.equals(student.getPwd(), pwd)) {
                out.print("<script>result=confirm('用户名或密码不正确，请重新登陆'); if(result == true){self.location = 'index.jsp'} else{ window.close();}</script>");
            } else {
                request.getRequestDispatcher("MainInfo.jsp").forward(request, response);
            }
        }
    }
    else {
        out.print("<script>result=confirm('用户名或密码为空，请重新登陆'); if(result == true){self.location = 'index.jsp'} else{ window.close();}</script>");
    }
%>
