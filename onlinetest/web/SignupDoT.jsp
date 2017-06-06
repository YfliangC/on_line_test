<%@ page import="onlinetest.Teachers.Teacher" %>
<%@ page import="onlinetest.Teachers.TeacherDao" %>
<%@ page import="java.util.Objects" %><%--
  Created by IntelliJ IDEA.
  User: Maibenben
  Date: 2017/6/5
  Time: 11:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%

    request.setCharacterEncoding("UTF-8");
    String teaid = request.getParameter("teaid");
    String teaname = request.getParameter("teaname");//获取注册用户名
    String teapassword = request.getParameter("teapassword");  //获取注册用户的密码
    String teasex = request.getParameter("teasex");
    String teaphone = request.getParameter("teaphone");
    Teacher teacher = TeacherDao.getInstance().selectWhere(teaname);
    if (Objects.equals(teacher.getTeaname(),null)){
        teacher.setTeaid(Integer.parseInt(teaid));
        teacher.setTeaname(teaname);
        teacher.setTeapassword(teapassword);
        teacher.setTeasex(teasex);
        teacher.setTeaphone(Integer.parseInt(teaphone));
        int result = TeacherDao.getInstance().insert(teacher);
        if(result == 1){
            out.print("<script>alert('注册成功，请返回登陆'); window.location='index.jsp'</script>");
        }
        else{
            out.print("<script>alert('注册错误，请尝试更换用户名'); window.location='SignupT.jsp'</script>");
        }
    }
    else{
        out.print("<script>alert('已存在该用户'); window.location='SignupT.jsp'</script>");
    }

%>