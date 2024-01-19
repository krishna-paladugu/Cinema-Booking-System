<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ include file="navbar.jsp" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>Change Password</title>
    <script>
        function passwordValidator(form) {
            const password = form.newpassword.value;
            const confirmpassword = form.confirmpassword.value;
            if (password !== confirmpassword) {
                alert ("\nPasswords do not match. Try again.")
                return false;
            }
        }
    </script>
    <style>
        <%@include file="/WEB-INF/css/signupsignin.css" %>
    </style>
</head>
<body>
<div class="container">
    <div class="row">
        <div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
            <div class="card border-0 shadow rounded-3 my-5">
                <div class="card-body p-4 p-sm-5">
                    <h3 class="card-title">Change Password</h3>
                    <form:form method="POST" modelAttribute="changePassword" onSubmit = "return passwordValidator(this)">
                        <div class="form-floating mb-3">
                            <form:input type="text" class="form-control" id="username" name="username"
                                   placeholder="User Name" required="true" path="username"/>
                            <label for="username">User Name</label>
                        </div>
                        <div class="form-floating mb-3">
                            <input type="text" class="form-control" id="currentpassword" name="currentpassword"
                                   placeholder="Current Password">
                            <label for="currentpassword">Current Password</label>
                        </div>
                        <div class="form-floating mb-3">
                            <form:input type="password" class="form-control" id="newpassword" name="newpassword"
                                   placeholder="New Password" required="true" path="password"/>
                            <label for="newpassword">New Password</label>
                        </div>
                        <div class="form-floating mb-3">
                            <input type="password" class="form-control" id="confirmpassword" name="confirmpassword"
                                   placeholder="Confirm Password" required>
                            <label for="confirmpassword">Confirm Password</label>
                        </div>
                        <div class="d-grid">
                            <button class="btn btn-primary btn-login text-uppercase fw-bold" type="submit">Save
                            </button>
                        </div>
                    </form:form>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>