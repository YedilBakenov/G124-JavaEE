<%@ page import="java.util.ArrayList" %>
<%@ page import="db.Car" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <%@include file="/links/links.jsp"%>
</head>
<body>
    <%@include file="navbar.jsp"%>
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
                    COUNTRY
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
                ArrayList<Car> cars = (ArrayList<Car>)request.getAttribute("mashinki");
                if(cars!=null){
                    for (Car car: cars){
            %>
            <tr>
                <td><%=car.getId()%></td>
                <td><%=car.getModel()%></td>
                <td><%=car.getCountry()%></td>
                <td><%=car.getColor()%></td>
                <td><%=car.getVolume()%></td>
                <td><%=car.getPrice()%></td>
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
