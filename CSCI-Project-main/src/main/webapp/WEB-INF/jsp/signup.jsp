<%@ include file="navbar.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>Sign Up</title>
    <script>
        function passwordValidator(form) {
            const password = form.password.value;
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
                    <h3 class="card-title">Sign Up</h3>
                    <form:form method="POST" modelAttribute="userForm" onSubmit = "return passwordValidator(this)">
                        <div class="login-error">${message}</div>
                        <div class="form-floating mb-3">
                            <form:input type="text" class="form-control" id="firstname" placeholder="First Name"
                                        path="firstName" required="true"/>
                            <label for="firstname">First Name</label>
                            <div class="text-danger">
                                Required
                            </div>
                        </div>
                        <div class="form-floating mb-3">
                            <form:input type="text" class="form-control" id="lastname" placeholder="Last Name"
                                        path="lastName" required="true"/>
                            <label for="lastname">Last Name</label>
                            <div class="text-danger">
                                Required
                            </div>
                        </div>
                        <div class="form-floating mb-3">
                            <form:input type="email" class="form-control" id="email" placeholder="Email address"
                                        path="email" required="true"/>
                            <label for="email">Email address</label>
                            <div class="text-danger">
                                Required
                            </div>
                        </div>
                        <div class="form-floating mb-3">
                            <form:input type="text" class="form-control" id="phone"
                                        placeholder="Phone" path="phone" required="true"/>
                            <label for="state">Phone</label>
                            <div class="text-danger">
                                Required
                            </div>
                        </div>
                        <div class="form-floating mb-3">
                            <form:input type="text" class="form-control" id="username" placeholder="User Name"
                                        path="username" required="true"/>
                            <label for="username">User Name</label>
                            <div class="text-danger">
                                Required
                            </div>
                        </div>
                        <div class="form-floating mb-3">
                            <form:input type="password" class="form-control" id="password" placeholder="Password"
                                        path="password" required="true"/>
                            <label for="password">Password</label>
                            <div class="text-danger">
                                Required
                            </div>
                        </div>
                        <div class="form-floating mb-3">
                            <form:input type="password" class="form-control" id="confirmpassword"
                                        placeholder="Confirm Password" path="confirmPassword" required="true"/>
                            <label for="confirmpassword">Confirm Password</label>
                            <div class="text-danger">
                                Required
                            </div>
                        </div>
                        <div class="form-floating mb-3">
                            <form:input type="text" class="form-control" id="address"
                                        placeholder="Address" path="address"/>
                            <label for="state">Street Address</label>
                        </div>
                        <div class="form-floating mb-3">
                            <form:input type="text" class="form-control" id="city"
                                        placeholder="City" path="city"/>
                            <label for="state">City</label>
                        </div>
                        <div class="form-floating mb-3">
                            <form:input type="text" class="form-control" id="state"
                                        placeholder="State" path="state"/>
                            <label for="state">State</label>
                        </div>
                        <div class="form-floating mb-3">
                            <form:input type="text" class="form-control" id="zipcode"
                                        placeholder="Zip Code" path="zipCode"/>
                            <label for="state">Zip Code</label>
                        </div>
                        <div class="form-check">
                            <form:checkbox class="form-check-input" value="" id="flexCheckDefault" path="subscribed"/>
                            <label class="form-check-label" for="flexCheckDefault">
                                Subscribe to promotions
                            </label>
                        </div>
                        <br>
                        <div class="d-grid">
                            <button class="btn btn-primary btn-login text-uppercase fw-bold" type="submit">Sign Up
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