<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
            crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/css/all.min.css">
    <style>
        body {
            background: linear-gradient(to right, #2c3e50, #4ca1af);
        }

        section {
            margin-top: 4%;
        }
    </style>
    <title>Your Order</title>
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
<section class="pt-5 pb-5 text-black">
    <div class="container">
        <div class="row w-100 shadow-lg p-3 mb-5 bg-white rounded">
            <div class="col-lg-12 col-md-12 col-12">
                <h3 class="display-5 mb-2 text-center">Your Order</h3>
                <br>
                <table id="shoppingCart" class="table table-condensed table-responsive text-black">
                    <thead>
                    <tr>
                        <th style="width:60%"><h4>Movie</h4></th>
                        <th style="width:12%"><h4>Price</h4></th>
                        <th style="width:5%;"><h4>Quantity</h4></th>
                        <th style="width:16%"></th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td data-th="Product">
                            <div class="row">
                                <div class="col-md-3 text-left">
                                    <c:forEach var="row" items="${result2.rows}">
                                        <img src="${row.trailerpicture}"
                                             alt=""
                                             class="img-fluid d-none d-md-block rounded mb-2 shadow ">
                                    </c:forEach>
                                </div>
                                <div class="col-md-9 text-left mt-sm-2">
                                    <c:forEach var="row" items="${result2.rows}">
                                        <h4>Movie: ${row.movietitle}</h4>
                                    </c:forEach>
                                    <c:forEach var="row" items="${result.rows}">
                                        <h5>Ticket type: ${row.tickettype}</h5>
                                        <h5>Seats: ${row.seats}</h5>
                                        <h5>Time: ${row.time}</h5>
                                    </c:forEach>
                                </div>
                            </div>
                        </td>
                        <c:forEach var="row" items="${result2.rows}">
                            <td data-th="Price"><h4>12.99</h4></td>
                        </c:forEach>
                        <td data-th="Quantity">
                            <label>
                                <input type="number" class="form-control form-control-md text-center" value="1">
                            </label>
                        </td>
                        <td class="actions" data-th="">
                            <div class="text-right">
                                <button class="btn btn-white border-secondary bg-white btn-lg mb-2">
                                    <i class="fas fa-sync"></i>
                                </button>
                                <button class="btn btn-white border-secondary bg-white btn-lg mb-2">
                                    <i class="fas fa-trash"></i>
                                </button>
                            </div>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>
            <h4 style="text-align: right;">Total: $12.99</h4>
            <br>
            <br>
            <div>
                <button type="button" onclick="location.href = '${pageContext.request.contextPath}/moviegallery';"
                        class="btn btn-success mb-4 btn-lg pl-5 pr-5 float-start">Previous
                </button>
                <button type="button" onclick="location.href = '${pageContext.request.contextPath}/checkout';"
                        class="btn btn-primary mb-4 btn-lg pl-5 pr-5 float-end">Checkout
                </button>
            </div>
        </div>
    </div>
</section>
</body>