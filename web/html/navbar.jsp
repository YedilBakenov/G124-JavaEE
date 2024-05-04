<%@ page import="db.User" %><%
  User user = (User) request.getSession().getAttribute("currentUser");
%>

<nav class="navbar navbar-expand-lg" style="background-color: rgba(70,156,103,0.88)">
  <div class="container-fluid">
    <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
      <div class="navbar-nav">
        <a class="nav-link text-light" href="/">MAIN PAGE</a>
        <a class="nav-link text-light" href="/">ALL CARS</a>
        <a class="nav-link text-light" href="/all-cities">ALL CITIES</a>

        <% if(user!=null && user.getRole_id()==1) {%>

        <a class="nav-link text-light" href="/add-car">ADD CAR</a>

        <%
          }
        %>
        <a class="nav-link text-light" href="/all-news">ALL NEWS</a>

        <% if(user==null) {%>

        <a class="nav-link text-light" href="/login">LOGIN</a>

        <% }%>

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
        <div class="" style="margin-left: 250px">
        <form class="d-flex" role="search" action="/main" method="get">
          <input class="form-control me-2" name="key" type="search" placeholder="Search" aria-label="Search">
          <button class="btn btn-outline-success" type="submit">Search</button>
        </form>
        </div>
      </div>
    </div>
  </div>
</nav>