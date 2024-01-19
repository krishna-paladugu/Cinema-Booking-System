<%@ include file="admin-navbar.jsp" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Search Movies</title>
    <style>
        <%@include file="/WEB-INF/css/adminportal.css" %>
    </style>
</head>
<body>
<form action="search-movie" method="GET" role="form">
    <h3 class="display-4 text-center text-white" style="margin-top: 5%;">Search for Movie</h3>
    <div class="input-group" style="max-width: 50%; margin-left: 25%; margin-top: 2%;">
        <input type="text" class="form-control rounded" name="search" placeholder="Search" aria-label="Search"
               aria-describedby="search-addon"/>
        <button type="submit" class="btn btn-primary">search</button>
    </div>
</form>
</body>
</html>
