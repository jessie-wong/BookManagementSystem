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
        <div id="title">当前位置：图书录入 >>></div>
        <div class="addForm">
            <form action="/rooter/addBook" method="post" onsubmit='return checkForm()'>
                <h4 class="form-title text-center">图书录入</h4>
                <div style="text-align: center;color: red">${error}</div>
                <div class="form-group" >
                    <label style="display: inline;" class="col-sm-4" >书名：</label>
                    <input name="book_name" id="book_name"class="form-control" style="display: inline;width: 200px;">
                </div>
                <div class="form-group">
                    <label style="display: inline;" class="col-sm-4">数量：</label>
                    <input name="number" id="number" class="form-control" style="display: inline;width: 200px;">
                </div>
                <div class="form-group">
                    <label style="display: inline;" class="col-sm-4">类型：</label>
                    <select name="type" id="type" class="selectpicker show-tick form-control" data-width="100px" data-live-search="true">
                        <option value="技术" selected="true">技术</option>
                        <option value="文学">文学</option>
                    </select>
                </div>
                <div class="form-group">
                    <label style="display: inline;" class="col-sm-4">出版社：</label>
                    <input name="press" id="press" class="form-control" style="display: inline;width: 200px;">
                </div>
                <div class="form-group">
                    <label style="display: inline;" class="col-sm-4">作者：</label>
                    <input name="author" id="author" class="form-control" style="display: inline;width: 200px;">
                </div>
                <div class="text-right">
                    <input type="submit" class="btn btn-primary" value="提交">
                </div>
            </form>
        </div>
    </div>
<script type="application/javascript">
    function checkForm(){
        var book_name= document.getElementById('book_name');
        var number= document.getElementById('number');
        var reg = new RegExp("^[0-9]*$");
        if(book_name.value == ""){alert("请输入书名！");return false;}
        if(number.value == ""){alert("请输入数量！");return false;}
        if(!reg.test(number.value)) {alert("数量输入不合法!"); return false;}
        //进行下一步
        return true;
    }
</script>
</body>
</html>
