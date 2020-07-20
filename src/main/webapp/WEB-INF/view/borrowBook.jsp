<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <link rel="stylesheet" href="/resources/css/body.css">
    <link rel="stylesheet" href="/resources/css/user.css">
    <link href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.bootcss.com/bootstrap-select/1.12.4/css/bootstrap-select.min.css" rel="stylesheet">
    <script src="https://cdn.staticfile.org/jquery/1.10.2/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="https://cdn.bootcss.com/bootstrap-select/1.12.4/js/bootstrap-select.min.js"></script>
</head>
<body>
    <div id="body">
        <jsp:include page="user_head.jsp"></jsp:include>
        <div id="title">当前位置：图书借阅 >>></div>
        <div id="image"></div>
        <div id="tablediv">
            <div id="borrowAction">
                <form action="/book/findBook" method="post">
                    <span>请选择您需要查询的方式</span>

                    <select name="type" id="searchType" class="selectpicker show-tick form-control" data-width="100px" data-live-search="true" onchange="changeStyle()">
                        <option value="all" selected="true">请选择</option>
                        <option value="book_id">图书编号</option>
                        <option value="book_name">图书名称</option>
                        <option value="book_type" >图书类型</option>
                    </select>
                    <div id="searchSelect" style="display: none" class="form-group">
                        <select name="searchContent1" class="selectpicker show-tick form-control" data-width="100px" data-live-search="true">
                            <option value="技术" selected="true">技术</option>
                            <option value="文学">文学</option>
                        </select>
                    </div>
                    <div id="searchContent" style="display:inline" class="form-group">
                        <input name="searchContent2" type="text" class="form-control" style="width: 250px;display: inline">
                    </div>
                    <input type="submit" value="提交" class="btn btn-primary">
                </form>
            </div>
            <table id="info" class="table table-striped">
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
                        <td><button onclick="borrowBook(${book.book_id})" class="btn btn-primary">借阅</button><button class="btn btn-primary" onclick="reserveBook(${book.book_id})">预约</button></td>
                    </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
    <script type="application/javascript">
        function borrowBook(book_id) {
            $.ajax({
                type:"post",
                url:"/book/borrowing",
                data:{book_id:book_id},
                dataType:"json",
                success:function (data) {
                    if(data == 0)alert("借阅成功!");
                    else if(data == 1){
                        alert("不可重复借阅!");
                    }else{
                        alert("借阅失败");
                    }
                }
            })
        }
        function reserveBook(book_id) {
            $.ajax({
                type:"post",
                url:"/book/reserve",
                data:{book_id:book_id},
                dataType:"json",
                success:function (data) {
                    if(data == 0)alert("预约成功!");
                    else if(data == 1){
                        alert("不可重复预约或者您已借阅!");
                    }else{
                        alert("预约失败");
                    }
                }
            })
        }
        function changeStyle() {
            var types = document.getElementById("searchType");
            var index = types.selectedIndex;
            var type = types.options[index].value;
            if(type == "book_type"){
                document.getElementById("searchSelect").style.setProperty("display","inline");
                document.getElementById("searchContent").style.setProperty("display","none");
            }else{
                document.getElementById("searchContent").style.setProperty("display","inline");
                document.getElementById("searchSelect").style.setProperty("display","none");
            }
        }
        function findBook() {
            var content = document.getElementById("searchContent").value;
            var types = document.getElementsByName("type");
            var type;
            for(var i=0;i<types.length;i++){
                if(types[i].selected == true){
                    type = types[i].value;
                }
            }
            $.ajax({
                type:"get",
                data:{content:content},
                url:"/book/borrowBook/"+type,
                dataType:"json",
                success:function (data) {
                    console.log(data);
                }
            })
        }
    </script>
</body>
</html>
