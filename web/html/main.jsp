<%@ page import="java.util.ArrayList" %>
<%@ page import="db.Car" %>
<%@ page import="db.City" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <%@include file="/links/links.jsp" %>
</head>
<body>
<%@include file="navbar.jsp" %>

<button type="button" class="btn btn-sm btn-success mt-3" data-bs-toggle="modal" data-bs-target="#addCar">
    + ADD CAR
</button>

<div class="modal fade" id="addCar" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
     aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <form action="/add-car" method="post">
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="staticBackdropLabel">ADD CAR</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
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
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-sm btn-secondary" data-bs-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-sm btn-success">ADD CAR</button>
                </div>
            </form>
        </div>
    </div>
</div>


<table class="table table-striped table-dark table-hover mt-3">
    <thead>
    <tr>
        <th>
            ID
        </th>
        <th>
            MODEL
        </th>
        <th>
            PRODUCED IN COUNTRY
        </th>
        <th>
            LOCATED IN CITY
        </th>
        <th>
            COLOR
        </th>
        <th>
            VOLUME
        </th>
        <th>
            PRICE
        </th>
        <th style="width: 7%;">
            DETAILS
        </th>
    </tr>
    </thead>
    <tbody>
    <%
        ArrayList<Car> cars = (ArrayList<Car>) request.getAttribute("mashinki");
        if (cars != null) {
            for (Car car : cars) {
    %>
    <tr>
        <td><%=car.getId()%>
        </td>
        <td><%=car.getModel()%>
        </td>
        <td><%=car.getCountry()%>
        </td>
        <td><%=car.getCity().getCity_name()%>/<%=car.getCity().getRegion()%>
        </td>
        <td><%=car.getColor()%>
        </td>
        <td><%=car.getVolume()%>
        </td>
        <td><%=car.getPrice()%>
        </td>
        <td><a href="/car-details?id=<%=car.getId()%>" class="btn btn-sm btn-success">DETAILS</a></td>
    </tr>
    <%
            }
        }
    %>
    </tbody>
</table>
</body>
</html>
