<%@ page import="onlinetest.Teachers.Teacher" %>
<%@ page import="onlinetest.Teachers.TeacherDao" %>
<%@ page import="java.util.Objects" %><%--
  Created by IntelliJ IDEA.
  User: Maibenben
  Date: 2017/6/5
  Time: 11:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    request.setCharacterEncoding("UTF-8");
    final String name1 = request.getParameter("name1");//用户名
    final String name2 = request.getParameter("name2");//新用户名
    if (name1 == null || name2 == null){
        out.print("<script>alert('异常登陆网站，请重新进入'); window.location='index.jsp'</script>");
    }
    final String pwd = request.getParameter("pwd");
    final String pwd1 = request.getParameter("pwd1");  //新密码
    final String pwd2 = request.getParameter("pwd2");
    final String teasex = request.getParameter("teasex");
    final String teaphone = request.getParameter("teaphone");
    Teacher teacher = TeacherDao.getInstance().selectWhere(name1);
    final java.sql.Date date = teacher.getTime();
    if (pwd1.equals(pwd2)){
        if (name1.equals(name2)){
            teacher.setTeasex(teasex);
            teacher.setTeaphone(Integer.parseInt(teaphone));
            if (!pwd1.equals("")){
                teacher.setTeapassword(pwd1);
            }
            int reasult = TeacherDao.getInstance().upDate(teacher,name1);
            if (reasult == 1 ){
                %>
                    修改成功
                    <form method="post" action="RwInfoT.jsp">
                        <input type="hidden" name="name" value=<%=name1%>>
                        <input type="submit" value="查看个人信息">
                    </form>
                <%
            }else {
                %>
                    修改错误，请重新修改
                    <form method="post" action="RwInfoT.jsp">
                        <input type="hidden" name="name" value=<%=name1%>>
                        <input type="submit" value="返回">
                    </form>
                <%
            }
        }
        else {
            Teacher teacher1 = TeacherDao.getInstance().selectWhere(name2);
            if (!Objects.equals(teacher1.getTeaname(),null)){
                %>
                    该用户已存在，请尝试更换用户名
                    <form method="post" action="RwInfoT.jsp">
                        <input type="hidden" name="name" value=<%=name1%>>
                        <input type="submit" value="返回">
                    </form>
                <%
            }
            else{
                teacher1.setTeaname(name2);
                if (!pwd1.equals("")){
                    teacher1.setTeapassword(pwd1);
                }
                else {
                    teacher1.setTeapassword(pwd);
                }
                teacher1.setTeaphone(Integer.parseInt(teaphone));
                teacher1.setTeasex(teasex);
                int result = TeacherDao.getInstance().upDate(teacher1,name1);
                if (result == 1){
                    %>
                        修改成功
                        <form method="post" action="RwInfoT.jsp">
                            <input type="hidden" name="name" value=<%=name2%>>
                            <input type="submit" value="查看个人信息">
                        </form>
                    <%
                }
                else {
                    %>
                        修改错误，请重新尝试
                        <form method="post" action="RwInfoT.jsp">
                            <input type="hidden" name="name" value=<%=name1%>>
                            <input type="submit" value="返回">
                        </form>
                    <%
                }
            }
        }
    }
    else{
        %>
            两次密码不相同，请重新修改
            <form method="post" action="RwInfoT.jsp">
                <input type="hidden" name="name" value=<%=name1%>>
                <input type="submit" value="返回">
            </form>
        <%
    }
%>