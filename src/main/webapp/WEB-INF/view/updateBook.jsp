<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <link rel="stylesheet" href="/resources/css/body.css">
    <link rel="stylesheet" href="/resources/css/rooter.css">
    <link href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.bootcss.com/bootstrap-select/1.12.4/css/bootstrap-select.min.css" rel="stylesheet">
    <script src="https://cdn.staticfile.org/jquery/1.10.2/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="https://cdn.bootcss.com/bootstrap-select/1.12.4/js/bootstrap-select.min.js"></script>

</head>
<body>
<div id="body">
    <jsp:include page="rooter_head.jsp"></jsp:include>
    <div id="title">当前位置：修改图书信息 >>></div>
    <div id="tablediv">
        <table id="info" class="table table-striped">
            <caption>图书管理</caption>
            <thead>
            <tr>
                <td>图书编号</td>
                <td>图书名称</td>
                <td>图书类型</td>
                <td>出版社</td>
                <td>作者</td>
                <td>数量</td>
                <td>操作</td>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${books}" var="book">
                <tr>
                    <td>${book.book_id}</td>
                    <td>${book.book_name}</td>
                    <td>${book.type}</td>
                    <td>${book.press}</td>
                    <td>${book.author}</td>
                    <td>${book.number}</td>
                    <td><button name="update">修改</button></td>
                </tr>
                <tr style="display: none">
                    <td><input name="book_id" value="${book.book_id}" class="form-control"/></td>
                    <td><input name="book_name" value="${book.book_name}" class="form-control"/></td>
                    <td>
                        <select name="type" id="type" class="selectpicker show-tick form-control" data-width="100px" data-live-search="true">
                            <option value="技术" selected="true">技术</option>
                            <option value="文学">文学</option>
                        </select></td>
                    <td><input name="press" value="${book.press}" class="form-control"/></td>
                    <td><input name="author" value="${book.author}"class="form-control"/></td>
                    <td><input name="number" value="${book.number}"class="form-control"/></td>
                    <td><button name="submit" class="btn btn-primary">确认</button></td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>
<script type="application/javascript">
    $("#info tbody tr td button").click(function() {
        var pre_tr = $(this).parent("td").parent("tr").prev();
        var next_tr = $(this).parent("td").parent("tr").next();
        var cur_tr = $(this).parent("td").parent("tr");
        var td = cur_tr.find("td");
        var button = td.eq(6).find("button").attr("name");
        if(button == "update"){
            cur_tr.css('display','none');
            next_tr.css('display','block');
        }else{
            var book_id = td.eq(0).find("input").val();
            var book_name = td.eq(1).find("input").val();
            var book_type = td.eq(2).find("select").find("option:selected").val();
            var book_press = td.eq(3).find("input").val();
            var book_author = td.eq(4).find("input").val();
            var book_number = td.eq(5).find("input").val();

            $.ajax({
                data:{book_id:book_id,book_name:book_name,type:book_type,press:book_press,author:book_author,number:book_number},
                type:"post",
                url:"/rooter/updateBook",
                dataType:"json",
                success:function (data) {
                    alert("修改成功！");
                    pre_tr.find('td').eq(0).text(book_id);
                    pre_tr.find('td').eq(1).text(book_name);
                    pre_tr.find('td').eq(2).text(book_type);
                    pre_tr.find('td').eq(3).text(book_press);
                    pre_tr.find('td').eq(4).text(book_author);
                    pre_tr.find('td').eq(5).text(book_number);
                    cur_tr.css('display','none');
                    pre_tr.css('display','block');
                }
            });
        }
    });
</script>
</body>
</html>
