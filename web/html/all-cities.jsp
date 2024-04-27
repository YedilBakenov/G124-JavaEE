<%@ page import="java.util.ArrayList" %>
<%@ page import="db.City" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <%@include file="/links/links.jsp" %>
</head>
<body>
<%@include file="navbar.jsp" %>

<% if(user!=null){%>

<button type="button" class="btn btn-sm btn-success mt-3" data-bs-toggle="modal" data-bs-target="#addCity">
    + ADD CITY
</button>


<%
    }
%>
<div class="modal fade" id="addCity" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
     aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <form action="/add-city" method="post">
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="staticBackdropLabel">ADD CITY</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-12 mt-3">
                            <label>NAME</label>
                        </div>
                        <div class="col-12 mt-3">
                            <input type="text" name="cityName" class="form-control">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-12 mt-3">
                            <label>REGION</label>
                        </div>
                        <div class="col-12 mt-3">
                            <input type="text" name="cityRegion" class="form-control">
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-sm btn-secondary" data-bs-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-sm btn-success">ADD CITY</button>
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
            NAME
        </th>
        <th>
           REGION
        </th>
        <th style="width: 7%;">
            DETAILS
        </th>
    </tr>
    </thead>
    <tbody>
    <%
        ArrayList<City> cities = (ArrayList<City>) request.getAttribute("goroda");
        if (cities != null) {
            for (City city : cities) {
    %>
    <tr>
        <td><%=city.getId()%>
        </td>
        <td><%=city.getCity_name()%>
        </td>
        <td><%=city.getRegion()%>
        </td>
        <td><a href="/city-details?id=<%=city.getId()%>" class="btn btn-sm btn-success">DETAILS</a></td>
    </tr>
    <%
            }
        }
    %>
    </tbody>
</table>
</body>
</html>
