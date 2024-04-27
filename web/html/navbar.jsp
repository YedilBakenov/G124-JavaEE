<%@ page import="db.User" %><%
  User user = (User) request.getSession().getAttribute("currentUser");
%>

<nav class="navbar navbar-expand-lg" style="background-color: rgba(70,156,103,0.88)">
  <div class="container-fluid">
    <a class="navbar-brand text-light" href="/">MAIN PAGE</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
      <div class="navbar-nav">
        <a class="nav-link text-light" href="/">ALL CARS</a>
        <a class="nav-link text-light" href="/all-cities">ALL CITIES</a>

        <% if(user!=null) {%>

        <a class="nav-link text-light" href="/add-car">ADD CAR</a>

        <%
          }
        %>
        <a class="nav-link text-light" href="/all-news">ALL NEWS</a>
        <a class="nav-link text-light" href="/login">LOGIN</a>
        <%
          if (user != null) {
        %>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle text-light" href="#" role="button" data-bs-toggle="dropdown"
             aria-expanded="false">
            <%=user.getFull_name()%>
          </a>
          <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="/register">PROFILE</a></li>
            <li><a class="dropdown-item" href="/">Settings</a></li>
            <li>
              <hr class="dropdown-divider">
            </li>
            <li><a class="dropdown-item" href="/logout">LOG OUT</a></li>
          </ul>
        </li>

        <%
          }
        %>
      </div>
    </div>
  </div>
</nav>