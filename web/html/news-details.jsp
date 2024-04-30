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
<div class="mt-3 p-5" style="background-color: rgba(156,66,119,0.88)">
    <h1><%=news.getTitle()%>
    </h1>
    <p class="text-light"><%=news.getContent()%>
    </p>
    <strong>Created at </strong> <%=news.getDate()%> <strong> Author by </strong> <%=news.getUser().getFull_name()%>

    <% if (user!=null && news.getUser().getId()==user.getId()) {%>
    <div class="mt-2">
        <button type="button" class="btn btn-sm btn-success mt-3" data-bs-toggle="modal" data-bs-target="#updateNews">
            UPDATE NEWS
        </button>
    </div>
    <div class="mt-2">
        <form action="/delete-news" method="post">
            <input type="hidden" name="newsId" value="<%=news.getId()%>">
            <button class="btn btn-danger btn-sm">DELETE NEWS</button>
        </form>
    </div>

    <% }%>
</div>

<div class="modal fade" id="updateNews" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
     aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <form action="/update-news" method="post">
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="staticBackdropLabel">UPDATE NEWS</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <input type="hidden" name="newsId" value="<%=news.getId()%>">
                    <div class="row">
                        <div class="col-12 mt-3">
                            <label>TITLE</label>
                        </div>
                        <div class="col-12 mt-3">
                            <input type="text" name="newsTitle" class="form-control">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-12 mt-3">
                            <label>CONTENT</label>
                        </div>
                        <div class="col-12 mt-3">
                            <input type="text" name="newsContent" class="form-control">
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-sm btn-secondary" data-bs-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-sm btn-success">UPDATE NEWS</button>
                </div>
            </form>
        </div>
    </div>
</div>


</body>
</html>
