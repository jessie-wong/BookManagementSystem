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
    <div id="title">当前位置：图书归还 >>></div>
    <div id="image"></div>
    <div id="tablediv">
        <table id="info" class="table table-striped">
            <thead>
            <tr>
                <td>图书名称</td>
                <td>图书类型</td>
                <td>出版社</td>
                <td>作者</td>
                <td>借阅时间</td>
                <td>状态</td>
                <td>操作</td>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${books}" var="book">
                <tr>
                    <td>${book.bookInfo.book_name}</td>
                    <td>${book.bookInfo.type}</td>
                    <td>${book.bookInfo.press}</td>
                    <td>${book.bookInfo.author}</td>
                    <td>${book.appoint_time}</td>
                    <td>${book.book_state}</td>
                    <td><button onclick="returnBook(${book.book_id})" class="btn btn-primary">归还</button></td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>
<script type="application/javascript">
    function returnBook(book_id) {
        $.ajax({
            type:"post",
            url:"/book/returnBook",
            data:{book_id:book_id},
            dataType:"json",
            success:function (data) {
                if(data == 0)alert("还书或者取消预约成功!");
                else{
                    alert("还书失败！");
                }
            }
        })
    }
</script>
</body>
</html>
