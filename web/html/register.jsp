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
    <div class="row justify-content-center">
        <div class="col-6">
            <div class="row">
                <div class="col-12 mt-3">
                   <h1><%=user.getFull_name()%></h1>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
