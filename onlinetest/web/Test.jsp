<%--
  Created by IntelliJ IDEA.
  User: Maibenben
  Date: 2017/6/4
  Time: 0:16
  To change this template use File | Settings | File Templates.
--%>
<%@page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="onlinetest.Questions.Question,onlinetest.Questions.QuestionDao" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Iterator" %>
<%
    request.setCharacterEncoding("utf-8");
    response.setContentType("text/html;charset=utf-8");
    String name = request.getParameter("name");
    String qstdifficult = request.getParameter("qstdifficult");
    if ((name == null) || (qstdifficult == null)){
        out.print("<script>alert('异常登陆网站，请重新进入'); window.location='index.jsp'</script>");
    }
%>
<html>
<head>
    <title>在线考试系统-考试界面</title>
    亲爱的<%=name%>的你好，欢迎考试。
</head>
<body>
<form method="post" action="TestDo.jsp">
<%
    if (qstdifficult!= null && name != null){
        List<Question> list = QuestionDao.getInstance().randomTopic(qstdifficult);
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
    <input type="submit" value="提交答案">
</form>
</body>

</html>
