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
    <div id="title">当前位置：用户管理 >>></div>
    <div id="tablediv">
        <table id="info" class="table table-striped">
            <caption>用户管理</caption>
            <thead>
            <tr>
                <td>用户姓名</td>
                <td>用户密码</td>
                <td>电话号码</td>
                <td>可借阅时间</td>
                <td>逾期操作次数</td>
                <td>修改借阅期限</td>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${users}" var="user">
                <tr>
                    <td>${user.user_name}</td>
                    <td>${user.user_password}</td>
                    <td>${user.phone_number}</td>
                    <td>${user.day}</td>
                    <td>${user.overdue}</td>
                    <td><button class="btn btn-primary">修改</button></td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>
<script type="application/javascript">
    $("#info tbody tr td button").click(function() {
        var td = $(this).parent("td").parent("tr").find("td");
        var username = td.eq(0).text();
        var old_day = td.eq(3).text();
        var new_day = prompt(username+"：请输入修改后的借阅期限",old_day);
        $.ajax({
            data:{username:username,newDay:new_day},
            type:"post",
            url:"/rooter/updateUser",
            dataType:"json",
            success:function (data) {
                td.eq(3).text(new_day);
                alert("修改成功！");
            }
        });
    });

</script>
</body>
</html>
