<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ include file="navbar.jsp" %>
<head>
    <title>Profile</title>
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
    SELECT * from users WHERE username = '${AuthenticatedUser.username}';
</sql:query>
<sql:query dataSource="${cinemabooking}" var="result2">
    SELECT * FROM customers WHERE userID = (SELECT userID FROM users WHERE username = '${AuthenticatedUser.username}');
</sql:query>
<div class="container py-5">
    <div class="row">
        <div class="col-lg-7 mx-auto">
            <div class="bg-white rounded-lg shadow-lg rounded-3 p-5">
                <div class="tab-content">
                    <div id="nav-tab-card" class="tab-pane fade show active">
                        <form role="form">
                            <h3 class="display-4 text-center">Profile</h3>
                            <br>
                            <div class="form-group">
                                <c:forEach var="row" items="${result.rows}">
                                    <label for="fname">First name:</label><br>
                                    <input type="text" class="form-control" id="fname" name="fname" disabled value="${row.firstname}"><br>
                                </c:forEach>
                            </div>
                            <div class="form-group">
                                <c:forEach var="row" items="${result.rows}">
                                    <label for="lname">Last name:</label><br>
                                    <input type="text" class="form-control" id="lname" name="lname" disabled value="${row.lastname}"><br>
                                </c:forEach>
                            </div>
                            <div class="form-group">
                                <c:forEach var="row" items="${result.rows}">
                                    <label for="uname">User name:</label><br>
                                    <input type="text" class="form-control" id="uname" name="uname" disabled value="${row.username}"><br>
                                </c:forEach>
                            </div>
                            <div class="form-group">
                                <c:forEach var="row" items="${result.rows}">
                                    <label for="email">Email:</label><br>
                                    <input type="text" class="form-control" id="email" name="email" disabled value="${row.email}"><br>
                                </c:forEach>
                            </div>
                            <div class="form-group">
                                <c:forEach var="row" items="${result.rows}">
                                    <label for="phone">Phone:</label><br>
                                    <input type="text" class="form-control" id="phone" name="phone" disabled value="${row.phone}"><br>
                                </c:forEach>
                            </div>
                            <div class="form-group">
                                <c:forEach var="row" items="${result2.rows}">
                                    <label for="address">Address:</label><br>
                                    <input type="text" class="form-control" id="address" name="address" disabled value="${row.address}"><br>
                                </c:forEach>
                            </div>
                            <div class="form-group">
                                <c:forEach var="row" items="${result2.rows}">
                                    <label for="city">City:</label><br>
                                    <input type="text" class="form-control" id="city" name="city" disabled value="${row.city}"><br>
                                </c:forEach>
                            </div>
                            <div class="form-group">
                                <c:forEach var="row" items="${result2.rows}">
                                    <label for="state">State:</label><br>
                                    <input type="text" class="form-control" id="state" name="state" disabled value="${row.state}"><br>
                                </c:forEach>
                            </div>
                            <div class="form-group">
                                <c:forEach var="row" items="${result2.rows}">
                                    <label for="zipcode">Zip Code:</label><br>
                                    <input type="text" class="form-control" id="zipcode" name="zipcode" disabled value="${row.zipcode}"><br>
                                </c:forEach>
                            </div>
                            <br>
                            <div class="d-grid">
                                <a class="btn btn-primary" href="${pageContext.request.contextPath}/profile/editprofile" role="button">Edit Profile</a>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>