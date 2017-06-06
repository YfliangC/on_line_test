<%@ page import="onlinetest.Questions.Question" %>
<%@ page import="onlinetest.Questions.QuestionDao" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Iterator" %><%--
  Created by IntelliJ IDEA.
  User: Maibenben
  Date: 2017/6/5
  Time: 11:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setCharacterEncoding("utf-8");
    response.setContentType("text/html;charset=utf-8");
    final String name = request.getParameter("name");//用户名
    final String qstdifficult = request.getParameter("qstdifficult");//问题难度
    final int qsttype = Integer.valueOf(request.getParameter("qsttype"));//问题类型
    int rwbefor = Integer.valueOf(request.getParameter("rwbefore"));//是否修改过
    List<Question> list = (List)request.getAttribute("list");
    if ((name == null) || (qstdifficult == null) || ( qsttype == 0)){
        out.print("<script>alert('异常登陆网站，请重新进入'); window.location='index.jsp'</script>");
    }else {
        if ()
    }
%>


<html>
<head>
    <title>在线考试系统-查看并修改试题</title>
    亲爱的<%=name%>的你好，欢迎查看并修改试题。
</head>
<body>
<form method="post" action="TestDo.jsp">
    <%
        if (qstdifficult!= null && name != null){
            List<Question> list = QuestionDao.getInstance().selectAll(QuestionDao.getInstance().getDifficult(qstdifficult),qsttype);
            int count = 0;
            Iterator iterator = list.iterator();
            while (iterator.hasNext())
            {
                Question question = (Question)iterator.next();
    %>
    <p class="ques_text"><%=question.getQsttitle()%></p>
    <input type="hidden" name=<%="q"+count%> value=<%=question.getQsttitle() %>>
    <input type=<%=QuestionDao.getInstance().getType(question)%> name=<%=count%> value="a"><%=question.getQstoptiona()%><br>
    <input type=<%=QuestionDao.getInstance().getType(question)%> name=<%=count%> value="b"><%=question.getQstoptionb()%><br>
    <input type=<%=QuestionDao.getInstance().getType(question)%> name=<%=count%> value="c"><%=question.getQstoptionc()%><br>
    <input type=<%=QuestionDao.getInstance().getType(question)%> name=<%=count%> value="d"><%=question.getQstoptiond()%><br>
    <%
                count++;
            }
        }

    %>
    <input type="hidden" name="qstdifficult" value=<%=qstdifficult%>>
    <input type="hidden" name="name" value=<%=name %>>
    <input type="submit" value="提交提交修改">
</form>
</body>
</html>
