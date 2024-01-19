<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Order Confirmation</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"
            integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p"
            crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"
            integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF"
            crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
            integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
            crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx"
            crossorigin="anonymous"></script>
    <style>
        <%@include file="/WEB-INF/css/orderconfirmation.css" %>
    </style>
    <script>
        const today = new Date();
        let time = today.getHours() + today.getMinutes() + today.getSeconds();
        time = time.toString();
    </script>
</head>
<sql:setDataSource var="cinemabooking" driver="com.mysql.cj.jdbc.Driver"
                   url="jdbc:mysql://localhost/cinemabookingsystem"
                   user="root" password="password"/>
<sql:query dataSource="${cinemabooking}" var="result">
    <jsp:useBean id="AuthenticatedUser" class="com.example.cinemabooking.entities.AuthenticatedUser" scope="session"/>
    SELECT * from cart WHERE customerID = (SELECT customerID FROM customers WHERE userID = (SELECT userID FROM users WHERE username = '${AuthenticatedUser.username}'));
</sql:query>
<sql:query dataSource="${cinemabooking}" var="result2">
    SELECT movietitle, trailerpicture, movieprice from movies WHERE movieID = (SELECT movieID FROM cart WHERE customerID = (SELECT customerID FROM customers WHERE userID = (SELECT userID FROM users WHERE username = '${AuthenticatedUser.username}')) LIMIT 1);
</sql:query>
<body>
<center>
    <div class="container">
        <h5>Order number
            <script>document.write(time)</script>
        </h5>
        <h1>Thank you ${AuthenticatedUser.username}!</h1>
        <div class="card">
            <h3>
                Your order is received!
            </h3>
            <h4>
                Please check your email for your order confirmation.
            </h4>
        </div>
    </div>
    <section class="container">
        <article class="card center">
            <section class="date">
            </section>
            <section class="card-cont">
                <c:forEach var="row" items="${result2.rows}">
                    <h3>${row.movietitle}</h3>
                </c:forEach>
                <div class="even-date">
                    <i class="fa fa-calendar"></i>
                    <time>
                        <c:forEach var="row" items="${result.rows}">
                            <span>${row.date}</span>
                            <span>${row.time}</span>
                        </c:forEach>
                    </time>
                </div>
                <div class="even-info">
                    <i class="fa fa-map-marker"></i>
                    <div class="seats">
                        <c:forEach var="row" items="${result.rows}">
                            <p>Seats: ${row.seats}</p>
                        </c:forEach>
                    </div>
                    <div class="venue">
                        Hall 1
                    </div>
                </div>
            </section>
        </article>
    </section>
    <p class="lead" style="margin-top: 1%;">
        <a class="btn btn-primary btn-lg"
           href="<%=request.getRequestURL().toString().substring(0, request.getRequestURL().toString().length() - request.getRequestURI().length()) + request.getContextPath()%>"
           role="button">Return home</a>
    </p>
</center>
</body>
</html>
