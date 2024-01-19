<%@ page import="com.example.cinemabooking.entities.Film" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="admin-navbar.jsp" %>
<%
    Film movie = new Film("&t=" + request.getParameter("search").replaceAll("\\s+", "+"));
%>
<html>
<head>
    <title>Search Movie</title>
    <style>
        <%@include file="/WEB-INF/css/adminportal.css" %>
    </style>
</head>
<body>
<form action="search-movie" method="GET" role="form">
    <div class="input-group" style="max-width: 50%; margin-left: 25%; margin-top: 5%;">
        <input type="text" class="form-control rounded" name="search" placeholder="Search" aria-label="Search"
               aria-describedby="search-addon"/>
        <button type="submit" class="btn btn-primary">search</button>
    </div>
</form>
<br>
<div class="card mb-3" style="max-width: 50%; margin-left: 25%;">
    <form action="${pageContext.request.contextPath}/admin/add-movie" method="GET">
        <div class="row no-gutters">
            <div class="col-md-4" style="margin-top: 2%;">
                <img src="<%out.println(movie.getPoster());%>" class="card-img" alt="...">
            </div>
            <div class="col-md-8">
                <div class="card-body">
                    <label for="movie-title">Movie Title
                        <input id="movie-title" name="movie-title" value="<%out.println(movie.getTitle());%>"
                               class="form-control">
                    </label>
                    <label for="MPAA-rating">Rated
                        <input id="MPAA-rating" name="MPAA-rating" value="<%out.println(movie.getRated());%>"
                               class="form-control">
                    </label>
                    <label for="imdbRating">IMDb Rating
                        <input id="imdbRating" name="imdb-rating" value="<%out.println(movie.getImdbRating());%> / 10"
                               class="form-control">
                    </label>
                    <label for="genre">Genre
                        <input id="genre" name="genre" value="<%out.println(movie.getGenre());%>"
                               class="form-control">
                    </label>
                    <label for="actors">Actors
                        <input id="actors" name="actors" value="<%out.println(movie.getActors());%>"
                               class="form-control">
                    </label>
                    <label for="directors">Directors
                        <input id="directors" name="directors" value="<%out.println(movie.getDirectors());%>"
                               class="form-control">
                    </label>
                    <label for="writers">Writers
                        <input id="writers" name="writers" value="<%out.println(movie.getWriter());%>"
                               class="form-control">
                    </label>
                    <label for="plot">Plot
                        <input id="plot" name="plot" value="<%out.println(movie.getPlot());%>"
                               class="form-control">
                    </label>
                    <label for="trailerpicture">Trailer Picture
                        <input id="trailerpicture" name="trailerpicture" value="<%out.println(movie.getPoster());%>"
                               class="form-control">
                    </label>
                    <input class="btn btn-success" type="submit" value="Add Movie"
                           style="margin-left: 30%; margin-top: 15%;">
                </div>
            </div>
        </div>
    </form>
</div>
</body>
</html>