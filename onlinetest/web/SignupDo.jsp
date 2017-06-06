<%--
  Created by IntelliJ IDEA.
  User: Maibenben
  Date: 2017/6/3
  Time: 18:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="onlinetest.Students.StudentDao,onlinetest.Students.Student" %>
<%@ page import="java.util.Objects" %>
<%

    request.setCharacterEncoding("UTF-8");
    String userid = request.getParameter("userid");
    String name = request.getParameter("name");//获取注册用户名
    String pwd = request.getParameter("pwd");  //获取注册用户的密码
    String sex = request.getParameter("sex");
    String grade = request.getParameter("grade");
    Student student = StudentDao.getInstance().findByname(name);
    if(!Objects.equals(student, null)){
        student.setId(Integer.parseInt(userid));
        student.setName(name);
        student.setPwd(pwd);
        student.setSex(sex);
        student.setGrade(grade);
        int result = StudentDao.getInstance().insert(student);
        if(result == 1){
            out.print("<script>alert('注册成功，请返回登陆'); window.location='index.jsp'</script>");
        }
        else{
            out.print("<script>alert('注册错误，请尝试更换用户名'); window.location='Signup.jsp'</script>");
        }
    }
    else{
        out.print("<script>alert('已存在该用户'); window.location='Signup.jsp'</script>");
    }
%>