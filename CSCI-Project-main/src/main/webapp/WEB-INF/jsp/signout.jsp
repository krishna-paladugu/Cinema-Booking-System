<%@ include file="navbar.jsp" %>
<html lang="en">
<head>
    <title>Registration confirmation</title>
    <style>
        <%@include file="/WEB-INF/css/signupsignin.css" %>
    </style>
</head>
<body style="margin-top: 10%;">
<div class="jumbotron text-center">
    <h1 class="display-3 text-white">You have been successfully logged out</h1>
    <h3 class="display-6 text-white" style="margin-top: 1%;">We recommend exiting the browser to end your session</h3>
    <p class="lead" style="margin-top: 5%;">
        <a class="btn btn-warning btn-lg"
           href="<%=request.getRequestURL().toString().substring(0, request.getRequestURL().toString().length() - request.getRequestURI().length()) + request.getContextPath()%>"
           role="button">Return home</a>
    </p>
</div>
</body>
</html>