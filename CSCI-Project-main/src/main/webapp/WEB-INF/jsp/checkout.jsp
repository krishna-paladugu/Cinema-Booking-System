<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- Adapted from https://bbbootstrap.com/snippets/bootstrap-payment-form-floating-labels-and-order-details-59901544 -->
<head>
    <title>Login</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
            crossorigin="anonymous"></script>
    <style>
        body {
            background: #eee linear-gradient(to bottom, #F8F4FF 0%, #E9E5F0 100%)
        }

        .container {
            height: 100vh
        }

        .card {
            border: none
        }

        .form-control {
            border-bottom: 2px solid #eee !important;
            border: none;
            font-weight: 600
        }

        .form-control:focus {
            color: #495057;
            background-color: #fff;
            border-color: #8bbafe;
            outline: 0;
            box-shadow: none;
            border-radius: 0;
            border-bottom: 2px solid blue !important
        }

        .input {
            position: relative;
            margin-bottom: 20px;
            width: 100%
        }

        .input span {
            position: absolute;
            top: 7px;
            left: 11px;
            transition: 0.5s
        }

        .input i {
            position: absolute;
            top: 13px;
            right: 8px;
            transition: 0.5s;
            color: #3F51B5
        }

        input::-webkit-outer-spin-button,
        input::-webkit-inner-spin-button {
            -webkit-appearance: none;
            margin: 0
        }

        .input input:focus ~ span {
            transform: translateX(-0px) translateY(-15px);
            font-size: 12px
        }

        .input input:valid ~ span {
            transform: translateX(-0px) translateY(-15px);
            font-size: 12px
        }

    </style>
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
<div class="container mt-5 px-5">
    <div class="mb-4">
        <h2>Checkout</h2>
    </div>
    <div class="row">
        <div class="col-md-8">
            <div class="card p-3">
                <form method="post" action="#">
                    <h6 class="text-uppercase">Personal information</h6>
                    <div class="row mt-3">
                        <div class="col-md-6">
                            <div class="input mt-3 mr-2"><input type="text" name="name" class="form-control"
                                                                required="required"> <span>*First Name</span></div>
                        </div>
                        <div class="col-md-6">
                            <div class="input mt-3 mr-2"><input type="text" name="name" class="form-control"
                                                                required="required"> <span>*Last Name</span></div>
                        </div>
                    </div>
                    <div class="row mt-2">
                        <div class="col-md-6">
                            <div class="input mt-3 mr-2"><input type="text" name="name" class="form-control"
                                                                required="required"> <span>*Email Address</span></div>
                        </div>
                        <div class="col-md-6">
                            <div class="input mt-3 mr-2"><input type="text" name="name" class="form-control"
                                                                required="required"> <span>*Phone Number</span></div>
                        </div>
                    </div>
                    <div class="mt-4 mb-4">
                        <h6 class="text-uppercase">Billing Address</h6>
                        <div class="row mt-3">
                            <div class="col-md-6">
                                <div class="input mt-3 mr-2"><input type="text" name="name" class="form-control"
                                                                    required="required"> <span>*Street Address</span>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="input mt-3 mr-2"><input type="text" name="name" class="form-control"
                                                                    required="required"> <span>*City</span></div>
                            </div>
                        </div>
                        <div class="row mt-2">
                            <div class="col-md-6">
                                <div class="input mt-3 mr-2"><input type="text" name="name" class="form-control"
                                                                    required="required"> <span>*State/Province</span>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="input mt-3 mr-2"><input type="text" name="name" class="form-control"
                                                                    required="required"> <span>*Zip code</span></div>
                            </div>
                        </div>
                    </div>
                    <div class="mt-4 mb-4">
                        <h6 class="text-uppercase">Payment details</h6>
                        <div class="input mt-3"><input type="text" name="name" class="form-control"
                                                       required="required"> <span>*Name on card</span></div>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="input mt-3 mr-2"><input type="text" name="name" class="form-control"
                                                                    required="required"> <i
                                        class="fa fa-credit-card"></i> <span>*Card Number</span></div>
                            </div>
                            <div class="col-md-6">
                                <div class="d-flex flex-row">
                                    <div class="input mt-3 mr-2"><input type="text" name="name" class="form-control"
                                                                        required="required"> <span>*Expiration</span>
                                    </div>
                                    <div class="input mt-3 mr-2"><input type="text" name="name" class="form-control"
                                                                        required="required"> <span>*CVV</span></div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="mt-4 mb-4 d-flex justify-content-between">
                        <button class="btn btn-success px-3"
                                onclick="location.href = '${pageContext.request.contextPath}/ordersummary';"
                                type="button">Previous
                        </button>
                        <button class="btn btn-success px-3"
                                onclick="location.href = '${pageContext.request.contextPath}/orderconfirmation';"
                                type="button">Submit Order
                        </button>
                    </div>
                </form>
            </div>
        </div>
        <div class="col-md-4">
            <div class="card card-blue p-3 text-black mb-3">
                <p>Your order</p>
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
    </div>
</div>
</body>