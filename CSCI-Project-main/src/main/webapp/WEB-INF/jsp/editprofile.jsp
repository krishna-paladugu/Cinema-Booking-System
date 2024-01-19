<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ include file="navbar.jsp" %>
<head>
    <title>Edit Profile</title>
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
                        <form:form role="form" method="POST" modelAttribute="editprofile">
                            <h3 class="display-4 text-center">Edit Profile</h3>
                            <br>
                            <div class="mb-3">
                                <c:forEach var="row" items="${result.rows}">
                                    <label for="firstname">First Name</label><br>
                                    <form:input type="text" class="form-control" id="firstname" name="firstname"
                                                value="${row.firstname}" path="firstName"/>
                                </c:forEach>
                            </div>
                            <div class="mb-3">
                                <c:forEach var="row" items="${result.rows}">
                                    <label for="lastname">First Name</label><br>
                                    <form:input type="text" class="form-control" id="lastname" name="lastname"
                                                value="${row.lastname}" path="lastName"/>
                                </c:forEach>
                            </div>
                            <div class="mb-3">
                                <c:forEach var="row" items="${result.rows}">
                                    <label for="username">User Name</label><br>
                                    <form:input type="text" class="form-control" id="username" name="username"
                                                value="${row.username}" path="username"/>
                                </c:forEach>
                            </div>
                            <div class="mb-3">
                                <c:forEach var="row" items="${result.rows}">
                                    <label for="email">Email</label><br>
                                    <form:input type="text" class="form-control" id="email" name="email" readonly="true"
                                                value="${row.email}" path="email"/>
                                </c:forEach>
                            </div>
                            <div class="mb-3">
                                <label for="newpassword">New Password</label>
                                <form:input type="text" id="newpassword"
                                            class="form-control" path="password"/>
                            </div>
                            <div class="mb-3">
                                <label for="confirmpassword">Confirm Password</label>
                                <input type="text" id="confirmpassword"
                                       class="form-control">
                            </div>
                            <div class="mb-3">
                                <c:forEach var="row" items="${result.rows}">
                                    <label for="phone">Phone</label><br>
                                    <form:input type="text" class="form-control" id="phone" name="phone"
                                                value="${row.phone}" path="phone"/>
                                </c:forEach>
                            </div>
                            <div class="mb-3">
                                <c:forEach var="row" items="${result2.rows}">
                                    <label for="address">Address</label><br>
                                    <form:input type="text" class="form-control" id="address" name="address"
                                                value="${row.address}" path="address"/>
                                </c:forEach>
                            </div>
                            <div class="mb-3">
                                <c:forEach var="row" items="${result2.rows}">
                                    <label for="city">City</label><br>
                                    <form:input type="text" class="form-control" id="city" name="city"
                                                value="${row.city}" path="city"/>
                                </c:forEach>
                            </div>
                            <div class="mb-3">
                                <c:forEach var="row" items="${result2.rows}">
                                    <label for="state">State</label><br>
                                    <form:input type="text" class="form-control" id="state" name="state"
                                                value="${row.state}" path="state"/>
                                </c:forEach>
                            </div>
                            <div class="mb-3">
                                <c:forEach var="row" items="${result2.rows}">
                                    <label for="zipcode">Zip Code</label><br>
                                    <form:input type="text" class="form-control" id="zipcode" name="zipcode"
                                                value="${row.zipcode}" path="zipCode"/>
                                </c:forEach>
                            </div>
                            <div class="form-check">
                                <c:forEach var="row" items="${result2.rows}">
                                    <form:checkbox class="form-check-input" value="true" disabled="${row.subscribed}"
                                                   id="flexCheckDefault" path="subscribed"/>
                                    <label class="form-check-label" for="flexCheckDefault">
                                        Subscribe to promotions
                                    </label>
                                </c:forEach>
                            </div>
                            <div class="form-check">
                                <c:forEach var="row" items="${result2.rows}">
                                    <form:checkbox class="form-check-input" value="false" disabled="${!row.subscribed}"
                                                   id="flexCheckDefault2"
                                                   path="unsubscribed"/>
                                    <label class="form-check-label" for="flexCheckDefault2">
                                        Unsubscribe from promotions
                                    </label>
                                </c:forEach>
                            </div>
                            <br>
                            <div class="d-grid">
                                <button class="btn btn-success btn-login fw-bold" type="submit">Save
                                </button>
                            </div>
                        </form:form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>