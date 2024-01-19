<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ include file="navbar.jsp" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>Login</title>
    <style>
        <%@include file="/WEB-INF/css/signupsignin.css" %>
    </style>
</head>
<body>
<c:url var="loginURL" value="/signin"/>
<div class="container">
    <div class="row">
        <div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
            <div class="card border-0 shadow rounded-3 my-5">
                <div class="card-body p-4 p-sm-5">
                    <h3 class="card-title">Sign In</h3>
                    <form method="post" action="${loginURL}">
                        <div class="form-floating mb-3">
                            <input type="text" class="form-control" id="username" name="username"
                                   placeholder="User Name" required>
                            <label for="username">User Name</label>
                            <div class="text-danger">
                                Required
                            </div>
                        </div>
                        <div class="form-floating mb-3">
                            <input type="password" class="form-control" id="password" name="password"
                                   placeholder="Password" required>
                            <label for="password">Password</label>
                            <div class="text-danger">
                                Required
                            </div>
                        </div>
                        <div style="padding-bottom: 10px;">
                            <a href="${pageContext.request.contextPath}/changepassword" class="link-primary">Forgot Password</a>
                        </div>
                        <c:if test="${param.error != null}">
                            <div class="login-error">Incorrect username or password</div>
                        </c:if>
                        <div class="d-grid">
                            <button class="btn btn-primary btn-login text-uppercase fw-bold" type="submit">Sign
                                in
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>