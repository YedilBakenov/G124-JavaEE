
<%@ page import="db.News" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <%@include file="/links/links.jsp" %>
</head>
<body>
<%@include file="navbar.jsp" %>

<% News news = (News) request.getAttribute("news");%>
<div class="mt-3" style="background-color: rgba(141,141,156,0.88)">
    <h1><%=news.getTitle()%></h1>
    <p class="text-light"><%=news.getContent()%>
    </p>
    <strong>Created at </strong> <%=news.getDate()%> <strong> Author by </strong> <%=news.getUser().getFull_name()%>
</div>

</body>
</html>
