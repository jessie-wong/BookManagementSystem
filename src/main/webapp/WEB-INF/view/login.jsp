<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <link rel="stylesheet" href="/resources/css/body.css">
    <link href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.staticfile.org/jquery/1.10.2/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
    <div id="body">
        <div id="header"></div>
        <div style="margin: 50px auto;width: 300px">
            <h4 class="form-title text-center">系统登录</h4>
            <div class="form-group" >
                <label style="display: inline;" class="col-sm-4" >用户：</label>
                <input name="uname" id="uname" value = "admin" class="form-control" style="display: inline;width: 200px;">
            </div>
            <div class="form-group">
                <label style="display: inline;" class="col-sm-4">密码：</label>
                <input type = "password" name="pwd" id="pwd" value = "admin" class="form-control" style="display: inline;width: 200px;">
            </div>
            <div class="radio">
                <label>
                    <input name="type" type="radio" value="user" checked="true">用户
                </label>
                <label>
                    <input name="type" type="radio" value="rooter">管理员
                </label>
            </div>
            <div class="text-right">
                <button onclick="clickJson()" class="btn btn-primary">确定</button>
            </div>
        </div>
    </div>
    <script type="application/javascript">
        function clickJson() {
            var name = document.getElementById("uname").value;
            var password = document.getElementById("pwd").value;
            var types = document.getElementsByName("type");
            var type;
            for(var i=0;i<types.length;i++){
                if(types[i].checked == true){
                    type = types[i].value;
                }
            }
            $.ajax({
                type:"post",
                url:"login",
                data:{name:name,password:password,type:type},
                dataType: "json",
                success:function (data) {
                    if(data == 0){
                        window.location.href = "/user";
                    }else if(data == 1){
                        window.location.href = "/rooter";
                    }else{
                        alert("账号或密码错误，请重新输入");
                        window.location.href = "/login";
                    }
                }
            });
        }
    </script>
</body>
</html>
