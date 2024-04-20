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
<form action="/city-update" method="post">
    <div class="row justify-content-center">
        <div class="col-6">
            <%
                City city = (City) request.getAttribute("gorod");
                if (city != null) {
            %>
            <div class="row">
                <div class="col-12 mt-3">
                    <label>NAME</label>
                </div>
                <div class="col-12 mt-3">
                    <input type="text" name="cityName" value="<%=city.getCity_name()%>" class="form-control">
                </div>
            </div>
            <div class="row">
                <div class="col-12 mt-3">
                    <label>REGION</label>
                </div>
                <div class="col-12 mt-3">
                    <input type="text" name="cityRegion" value="<%=city.getRegion()%>" class="form-control">
                </div>
            </div>
            <input type="hidden" value="<%=city.getId()%>" name="id">
            <div class="row">
                <div class="col-12 mt-3">
                    <button class="btn btn-sm btn-success">UPDATE</button>
                </div>
            </div>
            <%
                }
            %>
        </div>
    </div>
</form>
<form action="/city-delete" method="post">
    <input type="hidden" name="carId" value="<%=city.getId()%>">
    <button class="btn btn-danger btn-sm" style="margin-left: 260px">DELETE</button>
</form>
</body>
</html>
