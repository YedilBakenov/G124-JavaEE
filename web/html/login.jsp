<%@ page import="db.Car" %>
<%@ page import="db.City" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <%@include file="/links/links.jsp" %>
</head>
<body>
<%@include file="navbar.jsp" %>
<form action="/authorization" method="get">
    <div class="row justify-content-center">
        <div class="col-6">
            <div class="row">
                <div class="col-12 mt-3">
                    <label>EMAIL</label>
                </div>
                <div class="col-12 mt-3">
                    <input type="email" name="email" required class="form-control">
                </div>
            </div>
            <div class="row">
                <div class="col-12 mt-3">
                    <label>PASSWORD</label>
                </div>
                <div class="col-12 mt-3">
                    <input type="password" name="password" class="form-control">
                </div>
            </div>
            <div class="row">
                <div class="col-12 mt-3">
                    <button class="btn btn-sm btn-success">SIGN IN</button>
                </div>
            </div>
        </div>
    </div>
</form>
</body>
</html>
