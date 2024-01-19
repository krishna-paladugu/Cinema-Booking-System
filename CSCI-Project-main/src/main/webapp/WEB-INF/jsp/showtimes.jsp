<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ include file="navbar.jsp" %>
<head>
    <title>Add Promotion</title>
    <style>
        <%@include file="/WEB-INF/css/signupsignin.css" %>
        .row {
            margin-top: 5%;
        }
    </style>
</head>
<sql:setDataSource var="cinemabooking" driver="com.mysql.cj.jdbc.Driver"
                   url="jdbc:mysql://localhost/cinemabookingsystem"
                   user="root" password="password"/>
<sql:query dataSource="${cinemabooking}" var="result">
    SELECT * from shows WHERE movieID = (SELECT movieID FROM cart ORDER BY cartID DESC LIMIT 1);
</sql:query>
<sql:query dataSource="${cinemabooking}" var="result2">
    SELECT movietitle from movies WHERE movieID = (SELECT movieID FROM cart ORDER BY cartID DESC LIMIT 1);
</sql:query>
<div class="container py-5">
    <div class="row">
        <div class="col-lg-7 mx-auto">
            <div class="bg-white rounded-lg shadow-lg rounded-3 p-5">
                <div class="tab-content">
                    <div id="nav-tab-card" class="tab-pane fade show active">
                        <form:form method="post" modelAttribute="bookingForm">
                            <h3 class="display-4 text-center">Show times</h3><br>
                            <c:forEach var="row" items="${result2.rows}">
                                <p class="h3 text-center">Movie: ${row.movietitle}</p>
                                <form:input type="hidden" id="${row.movietitle}" name="movietitle" value="${row.movietitle}"
                                            class="form-control" path="ticketType"/>
                            </c:forEach>
                            <br>
                            <table class="table table-striped">
                                <thead>
                                <tr style="text-align: center;">
                                    <th scope="col">Date</th>
                                    <th scope="col">Time</th>
                                    <th scope="col">Hall</th>
                                </tr>
                                </thead>
                                <c:forEach var="row" items="${result.rows}">
                                    <tbody>
                                    <tr style="text-align: center;">
                                        <th scope="row">${row.date}</th>
                                        <form:input type="hidden" id="${row.date}" name="movietitle" value="${row.date}"
                                                    class="form-control" path="date"/>
                                        <td>
                                            <form:radiobutton class="btn-check" name="time" id="${row.showID}"
                                                   value="${row.time}" autocomplete="off" path="time"/>
                                            <label class="btn btn-outline-warning text-dark"
                                                   for="${row.showID}">${row.time}</label>
                                        </td>
                                        <td>${row.cinemahallname}</td>
                                    </tr>
                                    </tbody>
                                </c:forEach>
                            </table>
                            <input class="btn btn-primary" type="submit" value="Select seats"
                                   style="margin-left: 43%; margin-top: 10px;">
                        </form:form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
