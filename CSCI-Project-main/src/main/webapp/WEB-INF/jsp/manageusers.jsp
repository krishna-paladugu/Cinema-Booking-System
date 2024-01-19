<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="admin-navbar.jsp" %>
<html>
<head>
    <title>Manage Users</title>
    <style>
        <%@include file="/WEB-INF/css/adminportal.css" %>
    </style>
</head>
<sql:setDataSource var="cinemabooking" driver="com.mysql.cj.jdbc.Driver"
                   url="jdbc:mysql://localhost/cinemabookingsystem"
                   user="root" password="password"/>
<sql:query dataSource="${cinemabooking}" var="result">
    SELECT * from users;
</sql:query>
<body>
<table class="table table-striped table-dark" style="margin-top: 5%">
    <thead style="text-align: center">
    <tr>
        <th scope="col">User ID</th>
        <th scope="col">First Name</th>
        <th scope="col">Last Name</th>
        <th scope="col">User Name</th>
        <th scope="col">Email Address</th>
        <th scope="col">User Status</th>
        <th scope="col">Modify Status</th>
    </tr>
    </thead>
    <c:forEach var="row" items="${result.rows}">
        <tbody>
        <tr style="text-align: center;">
            <th scope="row">${row.userID}</th>
            <td>${row.firstname}</td>
            <td>${row.lastname}</td>
            <td>${row.username}</td>
            <td>${row.email}</td>
            <td>${row.accountstatus}</td>
            <td><input class="btn btn-danger" type="submit" value="Suspend"></td>
        </tr>
        </tbody>
    </c:forEach>
</table>
</body>
</html>