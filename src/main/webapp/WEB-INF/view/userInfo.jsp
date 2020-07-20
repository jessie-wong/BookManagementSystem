<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <link rel="stylesheet" href="/resources/css/body.css">
    <link rel="stylesheet" href="/resources/css/user.css">
    <link href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.staticfile.org/jquery/1.10.2/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<div id="body">
    <jsp:include page="user_head.jsp"></jsp:include>
    <div id="title">当前位置：用户信息>>></div>
    <div id="image"></div>
    <div id="tablediv">
        <div style="font-style: normal;font-size: 30px">用户名：${user}&nbsp;&nbsp;逾期操作次数：${userinfo.overdue}&nbsp;&nbsp;可借阅天数：${userinfo.day}</div>
        <table id="info" class="table table-striped">
            <thead>
            <tr>
                <td>图书名称</td>
                <td>图书类型</td>
                <td>出版社</td>
                <td>作者</td>
                <td>借阅时间</td>
                <td>数量</td>
                <td>状态</td>

            </tr>
            </thead>
            <tbody>
            <c:forEach items="${userinfo.bookList}" var="book">
                <tr>
                    <td>${book.bookInfo.book_name}</td>
                    <td>${book.bookInfo.type}</td>
                    <td>${book.bookInfo.press}</td>
                    <td>${book.bookInfo.author}</td>
                    <td>${book.appoint_time}</td>
                    <td>${book.bookInfo.number}</td>
                    <td>${book.book_state}</td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>
</body>
</html>
