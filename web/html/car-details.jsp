<%@ page import="db.Car" %>
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
        <%
            Car car =(Car)request.getAttribute("mashina");

            if(car!=null){

        %>
            <div class="row">
                <div class="col-12 mt-3">
                    <label>MODEL</label>
                </div>
                <div class="col-12 mt-3">
                    <input type="text" name="carModel" value="<%=car.getModel()%>"  class="form-control" readonly>
                </div>
            </div>
            <div class="row">
                <div class="col-12 mt-3">
                    <label>COUNTRY</label>
                </div>
                <div class="col-12 mt-3">
                    <input type="text" name="carCountry"  value="<%=car.getCountry()%>" class="form-control" readonly>
                </div>
            </div>
            <div class="row">
                <div class="col-12 mt-3">
                    <label>VOLUME</label>
                </div>
                <div class="col-12 mt-3">
                    <input type="text" name="carVolume"  value="<%=car.getVolume()%>" readonly class="form-control">
                </div>
            </div>
            <div class="row">
                <div class="col-12 mt-3">
                    <label>COLOR</label>
                </div>
                <div class="col-12 mt-3">
                    <input type="text" name="carColor"  value="<%=car.getColor()%>" readonly class="form-control">
                </div>
            </div>
            <div class="row">
                <div class="col-12 mt-3">
                    <label>PRICE</label>
                </div>
                <div class="col-12 mt-3">
                    <input type="number" name="carPrice"  value="<%=car.getPrice()%>" readonly class="form-control">
                </div>
            </div>
            <div class="row">
                <div class="col-12 mt-3">
                    <button class="btn bnt-sm btn-success">UPDATE</button>
                </div>
            </div>
        <%
            }
        %>
    </div>
</div>

</body>
</html>
