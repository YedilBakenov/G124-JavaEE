<%@ page import="java.util.ArrayList" %>
<%@ page import="db.City" %>
<%@ page import="db.News" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <%@include file="/links/links.jsp" %>
</head>
<body>
<%@include file="navbar.jsp" %>

<% if (user != null) {%>

<button type="button" class="btn btn-sm btn-success mt-3" data-bs-toggle="modal" data-bs-target="#addNews">
    + ADD NEWS
</button>

<%
    }
%>
<div class="modal fade" id="addNews" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
     aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">

            <form action="/add-news" method="post">

                <% if (user != null) {%>
                <input type="hidden" name="user_id" value="<%=user.getId()%>">
                <%} %>
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="staticBackdropLabel">ADD NEWS</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-12 mt-3">
                            <label>TITLE</label>
                        </div>
                        <div class="col-12 mt-3">
                            <input type="text" name="title" class="form-control">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-12 mt-3">
                            <label>CONTENT</label>
                        </div>
                        <div class="col-12 mt-3">
                            <textarea class="form-control" name="content" cols="10"></textarea>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-sm btn-secondary" data-bs-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-sm btn-success">ADD NEWS</button>
                </div>
            </form>
        </div>
    </div>
</div>

<% ArrayList<News> newsList = (ArrayList<News>) request.getAttribute("novosti");
    for (News n : newsList) {
%>
<div class="mt-3 p-5" style="background-color: rgba(141,141,156,0.88)">
    <a class="text-decoration-none text-dark" href="/details-news?id=<%=n.getId()%>"><h1><%=n.getTitle()%>
    </h1></a>
    <p class="text-light"><%=n.getContent()%>
    </p>
    <strong>Created at </strong> <%=n.getDate()%> <strong> Author by </strong> <%=n.getUser().getFull_name()%>
</div>
<%
    }
%>

</body>
</html>
