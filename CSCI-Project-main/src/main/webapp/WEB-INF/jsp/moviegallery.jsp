<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="navbar2.jsp" %>
<style>
    <%@include file="/WEB-INF/css/moviegallery.css" %>
</style>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Movie Gallery</title>
</head>
<sql:setDataSource var="cinemabooking" driver="com.mysql.cj.jdbc.Driver"
                   url="jdbc:mysql://localhost/cinemabookingsystem"
                   user="root" password="password"/>
<sql:query dataSource="${cinemabooking}" var="result">
    SELECT * from movies WHERE movietitle LIKE '%<%= request.getParameter("search")%>%' OR movieID = (SELECT movieID FROM moviecategory WHERE LOWER(category) LIKE '%<%= request.getParameter("search")%>%');
</sql:query>
<sql:query dataSource="${cinemabooking}" var="result2">
    SELECT customerID from customers WHERE userID = (SELECT userID FROM users WHERE username = '${AuthenticatedUser.username}');
</sql:query>
<body>
<form action="/moviegallery" method="GET" role="form">
    <h3 class="display-4 text-center text-black" style="margin-top: 5%;">Search for Movies</h3>
    <div class="input-group" style="max-width: 50%; margin-left: 25%; margin-top: 3%;">
        <input type="text" class="form-control rounded" name="search" placeholder="Search" aria-label="Search"
               aria-describedby="search-addon"/>
        <button type="submit" class="btn btn-primary">search</button>
    </div>
</form>
<div class="container">
    <c:if test="${param.search != null && result.getRowCount() == 0}">
        <p>There are no results for '<%= request.getParameter("search")%>'</p>
    </c:if>
    <c:if test="${param.search == null && result.getRowCount() == 0}">
    </c:if>
    <c:forEach var="row" items="${result.rows}">
        <div class="movie-card" id="${row.movieID}">
            <div class="movie-header"
                 style="background: url(${row.trailerpicture}); background-size: cover; background-position: 100% 10%;">
                <div class="header-icon-container">
                    <a href=${row.trailervideo}>
                        <i class="material-icons header-icon"></i>
                    </a>
                </div>
            </div>
            <div class="movie-content" id="${row.movieID}">
                <div class="movie-content-header">
                    <a href=${row.trailervideo}>
                        <h3 class="movie-title">${row.movietitle}</h3>
                    </a>
                    <br>
                    <div class="rating" style="margin-right: 40%;">${row.MPAArating}</div>
                </div>
                <div class="accordion accordion-flush" id="accordionFlushExample" style="margin-top: 10px;">
                    <div class="accordion-item" id="${row.movieID}">
                        <h2 class="accordion-header" id="flush-headingOne">
                            <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                                    data-bs-target="#flush-collapse${row.movieID}" aria-expanded="false"
                                    aria-controls="flush-collapse${row.movieID}">
                                Additional Movie Details
                            </button>
                        </h2>
                        <div id="flush-collapse${row.movieID}" class="accordion-collapse collapse"
                             aria-labelledby="flush-headingOne" data-bs-parent="#accordionFlushExample">
                            <div class="accordion-body">
                                <p class="h6">Movie Title: ${row.movietitle}</p><br>
                                <p class="h6">Cast: ${row.cast}</p><br>
                                <p class="h6">Director: ${row.director}</p><br>
                                <p class="h6">Producer: ${row.producer}</p><br>
                                <p class="h6">Synopsis: ${row.synopsis}</p><br>
                                <p class="h6">Reviews: ${row.review}</p><br>
                                <p class="h6"><a href="${row.trailervideo}">Trailer Link</a></p><br>
                                <p class="h6">MPAA Rating: ${row.MPAArating}</p><br>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="movie-info">
                    <div class="info-section">
                        <form:form method="post" modelAttribute="bookingForm">
                            <div class="selectors">
                                <form:select name="ticketcategory" class="ticketcategory" required="true" path="ticketType">
                                    <option selected disabled>Ticket Category</option>
                                    <option value="Child">Child</option>
                                    <option value="Adult">Adult</option>
                                    <option value="Senior">Senior</option>
                                </form:select>
                                <form:select name="ticketamount" class="ticketamount" required="true" path="ticketAmount">
                                    <option selected disabled>Ticket Amount</option>
                                    <option value="1">1</option>
                                    <option value="2">2</option>
                                    <option value="3">3</option>
                                    <option value="4">4</option>
                                    <option value="5">5</option>
                                    <option value="6">6</option>
                                    <option value="7">7</option>
                                    <option value="8">8</option>
                                    <option value="9">9</option>
                                    <option value="10">10</option>
                                </form:select>
                            </div>
                            <label for="${row.movieID}">
                                <form:input id="${row.movieID}" name="movieid" value="${row.movieID}"
                                            class="form-control" hidden="true"
                                            style="width: 70px; margin-left: 40%; text-align: center;" path="movieID"/>
                            </label>
                            <div class="times">
                                <c:forEach var="row" items="${result2.rows}">
                                    <form:input type="hidden" id="custId" name="custId" value="${row.customerID}"
                                                path="customerID"/>
                                </c:forEach>
                                <input class="btn btn-primary" type="submit" value="Book movie"
                                       style="margin-right: 25%; margin-top: 10px;">
                            </div>
                        </form:form>
                    </div>
                </div>
            </div>
        </div>
    </c:forEach>
</div>
</body>
</html>