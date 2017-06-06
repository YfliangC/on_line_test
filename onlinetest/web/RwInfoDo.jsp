<%--
  Created by IntelliJ IDEA.
  User: Maibenben
  Date: 2017/6/4
  Time: 21:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@page import="onlinetest.Students.Student,onlinetest.Students.StudentDao" %>
<%@ page import="java.util.Objects" %>
<%
    request.setCharacterEncoding("UTF-8");
    final String name1 = request.getParameter("name1");//用户名
    final String name2 = request.getParameter("name2");//新用户名
    if (name1 == null || name2 == null){
        out.print("<script>alert('异常登陆网站，请重新进入'); window.location='index.jsp'</script>");
    }
    final String pwd = request.getParameter("pwd");//原来密码
    final String pwd1 = request.getParameter("pwd1");//新密码1
    final String pwd2 = request.getParameter("pwd2");//新密码2
    final String sex = request.getParameter("sex");
    final String grade = request.getParameter("grade");
    Student student = StudentDao.getInstance().findByname(name1);
    System.out.println(pwd);
    System.out.println(pwd1);
    System.out.println(pwd2);
    int score1 = student.getScore1();
    int score2 = student.getScore2();
    int score3 = student.getScore3();
    java.sql.Date date = student.getLast_data();

    if (pwd1.equals(pwd2)){
        if (name1.equals(name2)){
            if (!pwd1.equals("")){
                student.setPwd(pwd1);
            }
            student.setSex(sex);
            student.setGrade(grade);
            int result = StudentDao.getInstance().upDate(student,student.getName());
            if(result == 1){
                %>
                    修改成功
                    <form method="post" action="RwInfo.jsp">
                        <input type="hidden" name="name" value=<%=name1%>>
                        <input type="submit"  value="查看个人信息">
                    </form>
                <%
            }
            else{
                %>
                    修改错误，请重新修改
                    <form method="post" action="RwInfo.jsp">
                        <input type="hidden" name="name" value=<%=name1%>>
                        <input type="submit"  value="修改个人信息">
                    </form>
                <%
            }
        }
        else {
            Student student2 = StudentDao.getInstance().findByname(name2);
            if(Objects.equals(student2.getName(), null)){
                %>
                该用户已存在，请尝试更改用户名
                <form method="post" action="RwInfo.jsp">
                            <input type="hidden" name="name" value=<%=name1%>>
                            <input type="submit"  value="查看个人信息">
                        </form>
                    <%
            }
            else {
                student.setName(name2);
                student.setSex(sex);
                student.setGrade(grade);
                student.setScore1(score1);
                student.setScore2(score2);
                student.setScore3(score3);
                student.setLast_date(date);
                if (!pwd1.equals("")){
                    student.setPwd(pwd1);
                }
                else {
                    student.setPwd(pwd);
                }
                int result = StudentDao.getInstance().upDate(student,name1);
                if (result == 1){
                    %>
                        修改成功
                        <form method="post" action="RwInfo.jsp">
                                <input type="hidden" name="name" value=<%=name2%>>
                                <input type="submit"  value="查看个人信息">
                            </form>
                    <%
                }
                else {
                    %>
                        修改错误，请重新修改
                        <form method="post" action="RwInfo.jsp">
                                <input type="hidden" name="name" value=<%=name1%>>
                                <input type="submit"  value="修改个人信息">
                            </form>
                    <%
                }
            }
        }
    }
    else{
                    %>
        两次密码不相同，请重新修改
        <form method="post" action="RwInfo.jsp">
            <input type="hidden" name="name" value=<%=name1%>>
            <input type="submit"  value="修改个人信息">
        </form>
        <%
    }
        %>