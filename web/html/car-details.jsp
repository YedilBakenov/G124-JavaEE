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
<form action="/car-update" method="post">
    <div class="row justify-content-center">
        <div class="col-6">
            <%
                Car car = (Car) request.getAttribute("mashina");
                if (car != null) {
            %>
            <div class="row">
                <div class="col-12 mt-3">
                    <label>MODEL</label>
                </div>
                <div class="col-12 mt-3">
                    <input type="text" name="carModel" value="<%=car.getModel()%>" class="form-control">
                </div>
            </div>
            <div class="row">
                <div class="col-12 mt-3">
                    <label>COUNTRY</label>
                </div>
                <div class="col-12 mt-3">
                    <input type="text" name="carCountry" value="<%=car.getCountry()%>" class="form-control">
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
                    <input type="text" name="carVolume" value="<%=car.getVolume()%>" class="form-control">
                </div>
            </div>
            <div class="row">
                <div class="col-12 mt-3">
                    <label>COLOR</label>
                </div>
                <div class="col-12 mt-3">
                    <input type="text" name="carColor" value="<%=car.getColor()%>" class="form-control">
                </div>
            </div>
            <div class="row">
                <div class="col-12 mt-3">
                    <label>PRICE</label>
                </div>
                <div class="col-12 mt-3">
                    <input type="number" name="carPrice" value="<%=car.getPrice()%>" class="form-control">
                </div>
            </div>
            <input type="hidden" value="<%=car.getId()%>" name="id">

            <% if(user!=null){%>
            <div class="row">
                <div class="col-12 mt-3">
                    <button class="btn btn-sm btn-success">UPDATE</button>
                </div>
            </div>
            <%
                }                                             }
            %>
        </div>
    </div>
</form>

<% if(user!=null){%>

<form action="/car-delete" method="post">
    <input type="hidden" name="carId" value="<%=car.getId()%>">
    <button class="btn btn-danger btn-sm" style="margin-left: 260px">DELETE</button>
</form>

<%
    }
%>
</body>
</html>
