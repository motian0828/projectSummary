﻿<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en" class="no-js">
<head>
    <meta http-equiv="Content-Type" content="text/html" ;charset="utf-8">
    <title>login</title>
    <style>
        #toolTip {
            position: absolute; /*绝对定位*/
            left: 345px;
            top: 31px;
            width: 98px;
            height: 48px;
            padding-top: 45px;
            padding-top: 25px;
            padding-top: 25px;
            z-index: 1;
            display: none; /*默认不显示*/
            color: red;
        }
    </style>
    <script>
        window.onload = function () {
            var state = "${sessionScope.login}";
            if (state != null) {
                if (state == 40) {
                    alert("密码错误");
                } else if (state == 80) {
                    alert("不存在该用户");
                }
                <%request.getSession().removeAttribute("login");%>
            }
        }
    </script>
</head>

<body>
<form action="/TTMS/LoginServlet" name="login" method="post" onsubmit="">
    <div align="center">
        <br><br><br><br>
        <input id="username" name="username" maxlength="20" type="text" onblur="check()" onFocus="clr()"
               placeholder="请输入用户名" required oninvalid="setCustomValidity('请输入用户名')" oninput="setCustomValidity('')"
               autofocus style="width:200px;height:30px">
        <br>
        <input id="userpass" name="userpass" maxlength="16" type="password" placeholder="请输入密码"
               required autofocus oninvalid="setCustomValidity('请输入密码')" oninput="setCustomValidity('')"
               style="width:200px;height:30px"><br><br><br>
        <input name="Submit" type="submit" value="登录">
        <div id="toolTip"></div>

    </div>

    <script type="text/javascript">
        var http_request;

        function clr() {
            document.getElementById("toolTip").style.display = "none";//显示提示框
        }

        function check() {
            if (document.login.username.value == "") {

            } else {
                createRequest(document.login.username.value);
            }
        }

        function createRequest(username) {
            http_request = false;
            var url = "/TTMS/RegisterServlet";
            if (window.XMLHttpRequest) {//非IE
                http_request = new XMLHttpRequest();
            } else if (window.ActiveXObject) {//IE
                http_request = new ActiveXObject("Microsoft.XMLHTTP");//创建XMLHttpRequest对象
            }

            if (!http_request) {
                alert("不能创建XMLHttpRequest对象");
                return false;
            }
            //采用POST方式，异步传输
            http_request.open("post", url, true);
            //POST方式，必须加入如下头信息设定
            http_request.setRequestHeader("Content-Type", "application/x-www-form-urlencoded;charset=UTF-8");
            http_request.onreadystatechange = complete;//调用返回结果处理函数
            http_request.send("username=" + username);
        }

        function complete() {
            if (http_request.readyState == 4) {//判断请求状态
                if (http_request.status == 200) {//请求成功,开始处理返回结果
                    document.getElementById("toolTip").innerText = http_request.responseText;
                    document.getElementById("toolTip").style.display = "block";//显示提示框
                } else {
                    alert("你请求的页面有错误" + http_request.status);
                }
            }
        }
    </script>
</form>
</body>
</html>