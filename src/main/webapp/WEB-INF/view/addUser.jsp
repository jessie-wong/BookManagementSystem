<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <link rel="stylesheet" href="/resources/css/body.css">
    <link rel="stylesheet" href="/resources/css/rooter.css">
    <link href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.staticfile.org/jquery/1.10.2/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
    <div id="body">
        <jsp:include page="rooter_head.jsp"></jsp:include>
        <div id="title">当前位置：添加用户 >>></div>
        <div class="addForm">
            <form action="/rooter/addUser" method="post" onsubmit='return checkForm()'>
                <h4 class="form-title text-center">添加用户</h4>
                <div style="text-align: center;color: red">${error}</div>
                <div class="form-group" >
                    <label style="display: inline;" class="col-sm-4" >用户：</label>
                    <input name="user_name" id="user_name"class="form-control" style="display: inline;width: 200px;">
                </div>
                <div class="form-group">
                    <label style="display: inline;" class="col-sm-4">密码：</label>
                    <input type = "password" name="user_password" id="password" class="form-control" style="display: inline;width: 200px;">
                </div>
                <div class="form-group">
                    <label style="display: inline;" class="col-sm-4">可借期限：</label>
                    <input name="day" id="day" class="form-control" style="display: inline;width: 200px;">
                </div>
                <div class="form-group">
                    <label style="display: inline;" class="col-sm-4">电话：</label>
                    <input name="user_password" id="" class="form-control" style="display: inline;width: 200px;">
                </div>
                <div class="text-right">
                    <input type="submit" class="btn btn-primary" value="提交">
                </div>
            </form>
        </div>
    </div>
<script type="application/javascript">
    function checkForm(){
        var user_name= document.getElementById('user_name');
        var pwd= document.getElementById('password');
        var day = document.getElementById("day");
        var reg = new RegExp("^[0-9]*$");
        if(user_name.value == "" || pwd.value == ""){alert("请输入用户名和密码！");return false;}
        if(day.value == ""){alert("请输入可借期限！");return false;}
        if(!reg.test(day.value)) {alert("可借期限输入不合法!"); return false;}
        //进行下一步
        return true;
    }
</script>
</body>
</html>
