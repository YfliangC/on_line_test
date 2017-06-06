/**
 * Created by admin on 2017/5/26.
 */


var mySubmit = function () {
    var hide = document.getElementById("hide");
    var form = document.getElementById("form");
    var nameValue = document.getElementById("name").value;
    var pwdValue = document.getElementById("pwd").value;
    var flag = true;
    if ((nameValue === "") || (pwdValue === "")){
        flag = false;
        $('#message_empty').modal('show');
    }

    else if (($('#pwd').val().length < 6)){
        flag = false;
        $('#password_wrong').modal('show');
    }

    if (flag){
        if (hide.value === "student"){
            form.setAttribute("action", "LoginDo.jsp");
        }
        else {
            form.setAttribute("action", "LoginTDo.jsp");
        }
        form.submit();
    }
};

var studentEntrance = function () {
    var hide = document.getElementById("hide");
    hide.value = "student";
    $("#entrance").fadeOut();
    $("#bothLogin").fadeIn();
};

var teacherEntrance = function () {
    var hide = document.getElementById("hide");
    hide.value = "teacher";
    $("#entrance").fadeOut();
    $("#bothLogin").fadeIn();
};

var back = function () {
    $("#entrance").fadeIn();
    $("#bothLogin").fadeOut();
};

var signUpStudent = function () {
    $("#bothLogin").fadeOut();
    $("#signUpDiv").fadeIn();
};

var signUpBack = function () {
    $("#bothLogin").fadeIn();
    $("#signUpDiv").fadeOut();
};