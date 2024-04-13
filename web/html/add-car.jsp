<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <%@include file="/links/links.jsp" %>
</head>
<body>
<%@include file="navbar.jsp" %>
<div class="row">
    <div class="col-6">
        <form action="/add-car" method="post">
            <div class="row">
                <div class="col-12 mt-3">
                    <label>MODEL</label>
                </div>
                <div class="col-12 mt-3">
                    <input type="text" name="carModel" class="form-control">
                </div>
            </div>
            <div class="row">
                <div class="col-12 mt-3">
                    <label>COUNTRY</label>
                </div>
                <div class="col-12 mt-3">
                    <input type="text" name="carCountry" class="form-control">
                </div>
            </div>
            <div class="row">
                <div class="col-12 mt-3">
                    <label>VOLUME</label>
                </div>
                <div class="col-12 mt-3">
                    <input type="text" name="carVolume" class="form-control">
                </div>
            </div>
            <div class="row">
                <div class="col-12 mt-3">
                    <label>COLOR</label>
                </div>
                <div class="col-12 mt-3">
                    <input type="text" name="carColor" class="form-control">
                </div>
            </div>
            <div class="row">
                <div class="col-12 mt-3">
                    <label>PRICE</label>
                </div>
                <div class="col-12 mt-3">
                    <input type="number" name="carPrice" class="form-control">
                </div>
            </div>
            <div class="row">
                <div class="col-12 mt-3">
                    <button class="btn bnt-sm btn-success">ADD CAR</button>
                </div>
            </div>
        </form>
    </div>
</div>

</body>
</html>
