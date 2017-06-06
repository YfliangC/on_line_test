<%@ page import="onlinetest.Teachers.Teacher" %>
<%@ page import="onlinetest.Teachers.TeacherDao" %>
<%@ page import="java.util.Objects" %><%--
  Created by IntelliJ IDEA.
  User: Maibenben
  Date: 2017/6/5
  Time: 0:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setCharacterEncoding("utf-8");
    String name = request.getParameter("name");
    String pwd = request.getParameter("pwd");

    if ((null != name) && (null != pwd) && ("" != name) && ("" != pwd)) {
        Teacher teacher = TeacherDao.getInstance().selectWhere(name);
        if (Objects.equals(teacher.getTeaname(), null)) {
            out.print("<script>result=confirm('用户名不存在，请注册'); if(result == true){self.location = 'index.jsp'} else{ window.location='index.jsp'}</script>");
        } else {
            if (!Objects.equals(teacher.getTeapassword(), pwd)) {
                out.print("<script>result=confirm('用户名或密码不正确，请重新登陆'); if(result == true){self.location = 'index.jsp'} else{ window.close();}</script>");
            } else {
                request.getRequestDispatcher("MainInfoT.jsp").forward(request, response);
            }
        }
    }
    else {
        out.print("<script>result=confirm('用户名或密码为空，请重新登陆'); if(result == true){self.location = 'index.jsp'} else{ window.close();}</script>");
    }
%>