<%--
  Created by IntelliJ IDEA.
  User: Maibenben
  Date: 2017/6/3
  Time: 16:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>

<link rel="stylesheet" href="bootstrap-3.3.7-dist/css/bootstrap.min.css">
<link rel="stylesheet" href="src/css/myCss.css">
<script src="bootstrap-3.3.7-dist/js/jquery-3.2.0.js"></script>
<script src="bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<script src="src/js/functions.js"></script>

<html lang="en">
<head>
  <title>在线考试系统</title>
</head>
<body style="overflow: hidden;background-color: #222222;">
<div class="myfadein">
  <canvas class="mybody" id="canvas"></canvas>
</div>
<div id="entrance" style="position: absolute;left: 50%;top: 50%;width: 900px;height: 600px;margin-top: -300px;margin-left: -450px;">
  <div class="jumbotron" align="center" style="background-color: rgba(183,120,104,0.6);width:100%;height: 100%;border-radius: 6px;padding: 20px;">
    <h1 style="color: white;margin-top: 70px">Welcome to My</h1>
    <h1 style="color: white">Examination System!</h1>
    <p style="color: white">This is an examination system. You can sign up or login an account and start taking exams!</p>
    <button id="studentLogin" class="btn btn-success" type="submit" style="width: 100%;margin-top: 20px;background-color: rgba(92,184,92,0.5)" onclick="studentEntrance()">考生入口</button>
    <button id="teacherLogin" class="btn btn-success" type="submit" style="width: 100%;margin-top: 20px;background-color: rgba(92,184,92,0.5)" onclick="teacherEntrance()">教师入口</button>
    <button id="exit" class="btn btn-danger" type="button" style="width: 100%;margin-top: 20px;background-color: rgba(184,111,105,0.5)" onclick="window.close()">退出</button>
  </div>
</div>
<div id="bothLogin" style="position: absolute;left: 50%;top: 50%;width: 600px;height: 700px;margin-top: -350px;margin-left: -300px;display: none">
  <div class="jumbotron" style="background-color: rgba(108,175,183,0.6);width:100%;height: 100%;border-radius: 5px;vertical-align: middle">
    <div style="margin-top: 120px">
      <h1 style="color: white;margin: 20px;font-size: 40px">Please login you account!</h1>
      <form id="form" method="post" style="margin-top: 20px;margin-right: 20px;margin-left: 20px">
        <input type="hidden" id="hide" value="student">
        <div class="input-group" id="name_div" style="margin-top: 10px;opacity: 0.6">
                    <span class="input-group-addon">
                        <span class="glyphicon glyphicon-user" aria-hidden="true"></span>
                    </span>
          <input type="text" autocomplete="off" name="name" class="form-control" id="name" style="border-top-right-radius: 3px;border-bottom-right-radius: 3px" placeholder="请输入用户名">
          <span class="input-group-addon" id="name_check" style="display: none">
                        <span class="glyphicon glyphicon-ok" id="name_check_icon" style="color: #05b80a" aria-hidden="true"></span>
                    </span>
        </div>
        <div class="input-group" id="pwd_div" style="margin-top: 10px;opacity: 0.6">
                    <span class="input-group-addon">
                        <span class="glyphicon glyphicon-lock" aria-hidden="true"></span>
                    </span>
          <input type="password" autocomplete="off" name="pwd" maxlength="20" class="form-control" id="pwd" style="border-top-right-radius: 3px;border-bottom-right-radius: 3px" placeholder="请输入密码（6到20位）">
          <span class="input-group-addon" id="password_check" style="display: none">
                        <span class="glyphicon glyphicon-ok" id="password_check_icon" style="color: #05b80a" aria-hidden="true"></span>
                    </span>
        </div>
        <div align="left">
          <p class="text-warning" style="color: white;font-size: small;margin-top: 5px;margin-bottom: 5px;padding-bottom: 0;width: 30%">显示密码
            <input id="show_pwd" type="checkbox" style="margin-bottom: 0;padding-bottom: 0" title="显示密码" aria-label="选取显示密码">
          </p>
        </div>
      </form>
      <div style="margin-left: 20px;margin-right: 20px;">
        <button class="btn btn-success" style="width: 100%;background-color: rgba(92,184,92,0.5)" onclick="mySubmit()">登陆</button>
        <button class="btn btn-success" style="width: 100%;margin-top: 20px;background-color: rgba(92,184,92,0.5)" onclick="window.location='Signup.jsp'">注册</button>
        <button class="btn btn-danger" style="width: 100%;margin-top: 20px;background-color: rgba(184,111,105,0.5)" onclick="back()">返回</button>
      </div>
    </div>
  </div>
</div>
<div class="modal fade" id="message_empty" style="top: 35%">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">×</button>
        <h4 class="modal-title" style="color: #ff7654">警告</h4>
      </div>
      <div  class="modal-body">
        请填写所有的内容！
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" data-dismiss="modal" style="padding-left: 24px;padding-right: 24px">确定</button>
      </div>
    </div>
  </div>
</div>
<div class="modal fade" id="password_wrong" style="top: 35%">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">×</button>
        <h4 class="modal-title" style="color: #ff7654">警告</h4>
      </div>
      <div  class="modal-body">
        密码长度不符，请重新输入！
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" data-dismiss="modal" style="padding-left: 24px;padding-right: 24px">确定</button>
      </div>
    </div>
  </div>
</div>
</body>

<script>
    $('#name').blur(function () {
        var name_check = document.getElementById('name_check');
        var name_check_icon = document.getElementById('name_check_icon');
        if ($('#name').val()==""){
            name_check_icon.setAttribute('class','glyphicon glyphicon-remove');
            name_check_icon.setAttribute('style','margin-left: 3px;color: red');
        }else {
            name_check_icon.setAttribute('class','glyphicon glyphicon-ok');
            name_check_icon.setAttribute('style','margin-left: 3px;color: #05b80a');
        }
        name_check.setAttribute('style','display: block');
    });

    $('#pwd').blur(function () {
        var password_check = document.getElementById('password_check');
        var password_check_icon = document.getElementById('password_check_icon');
        if (($('#pwd').val()=="") || ($('#pwd').val().length < 6) || ($('#pwd').val().length > 20)){
            password_check_icon.setAttribute('class','glyphicon glyphicon-remove');
            password_check_icon.setAttribute('style','margin-left: 3px;color: red');
        }else {
            password_check_icon.setAttribute('class','glyphicon glyphicon-ok');
            password_check_icon.setAttribute('style','margin-left: 3px;color: #05b80a');
        }
        password_check.setAttribute('style','display: block');
    });

    $('#show_pwd').change(function () {
        var password = document.getElementById('pwd');
        if ($('#show_pwd').prop("checked")){
            password.setAttribute('type', 'text');
        }
        else{
            password.setAttribute('type', 'password');
        }
    });
</script>

</html>