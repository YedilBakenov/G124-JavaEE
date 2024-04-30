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
<form action="/add-car" method="post">
<div class="row justify-content-center">
    <div class="col-6">
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
                    <label>CITY</label>
                </div>
                <div class="col-12 mt-3">
                    <select class="form-control" name="car_city_id">

                        <% ArrayList<City> cities = (ArrayList<City>) request.getAttribute("goroda");
                            if (cities != null) {
                                for (City city : cities) {
                        %>
                        <option value="<%=city.getId()%>"><%=city.getCity_name()%></option>
                        <%
                                }
                            }
                        %>
                    </select>
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
    </div>
</div>
</form>

</body>
</html>
