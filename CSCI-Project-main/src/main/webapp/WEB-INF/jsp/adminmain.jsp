<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ include file="admin-navbar.jsp" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Admin Main</title>
    <style>
        <%@include file="/WEB-INF/css/adminportal.css" %>
        .card {
            width: 60%;
            margin-top: 5%;
            border: 2px solid black;
        }
        .card-deck {
            margin-left: 33%;
            margin-right: 10%;
            margin-top: 10%;
        }
        .card-header {
            background-color: black;
        }
        .card-body {
            background: #44a08d;
        }
        a {
            color: black;
        }
        a:hover {
            color: black;
        }
    </style>
</head>
<sql:setDataSource var="cinemabooking" driver="com.mysql.cj.jdbc.Driver"
                   url="jdbc:mysql://localhost/cinemabookingsystem"
                   user="root" password="password"/>
<sql:query dataSource="${cinemabooking}" var="result">
    SELECT COUNT(*) AS count from users;
</sql:query>
<sql:query dataSource="${cinemabooking}" var="result2">
    SELECT COUNT(*) AS count from users WHERE accountstatus = 'Active';
</sql:query>
<body>
<div class="card-deck">
    <div class="card">
        <div class="card-header"></div>
        <div class="card-body text-black">
            <h5 class="card-title">Manage Movies</h5>
            <p class="card-text">This component enables the management of all movies in the system.</p>
            <a href="${pageContext.request.contextPath}/admin/manage-movies">Add movie</a> <br>
            <a href="${pageContext.request.contextPath}/admin/schedule-movie">Add schedule</a>
        </div>
    </div>
    <div class="card">
        <div class="card-header"></div>
        <div class="card-body">
            <h5 class="card-title">Manage Promotions</h5>
            <p class="card-text">This component enables the management of promotions in the system.</p>
            <a href="${pageContext.request.contextPath}/admin/promotion">Add promotion</a>
        </div>
    </div>
    <div class="card">
        <div class="card-header"></div>
        <div class="card-body">
            <h5 class="card-title">Manage Users</h5>
            <p class="card-text">This component enables the management of all users in the system. <br><br>
                <strong> Summary of users: </strong><br>
                Number of users in system:
                <c:forEach var="row" items="${result.rows}">
                    ${row.count}
                </c:forEach> <br>
                Number of active users:
                <c:forEach var="row" items="${result2.rows}">
                    ${row.count}
                </c:forEach> <br>
            </p>
        </div>
    </div>
</div>
</body>
</html>
