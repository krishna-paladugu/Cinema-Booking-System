<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ include file="admin-navbar.jsp" %>
<head>
    <title>Add Promotion</title>
    <style>
        <%@include file="/WEB-INF/css/adminportal.css" %>
        <%@include file="/WEB-INF/css/addmovies.css" %>
        .row {
            margin-top: 5%;
        }
    </style>
</head>
<div class="container py-5">
    <div class="row">
        <div class="col-lg-7 mx-auto">
            <div class="bg-white rounded-lg shadow-lg rounded-3 p-5">
                <div class="tab-content">
                    <div id="nav-tab-card" class="tab-pane fade show active">
                        <form:form method="POST" modelAttribute="promotionForm">
                            <h3 class="display-4 text-center">Add Promotion</h3>
                            <br>
                            <p class="h6"><span>*</span> indicates required fields</p>
                            <div class="add-movie-success">${message}</div>
                            <div class="add-movie-error">${message2}</div>
                            <div class="mb-3">
                                <label for="promocode" class="h5"><span>*</span> Promotion code</label>
                                <form:input type="text" id="promocode" placeholder="123456" required="true"
                                            class="form-control" path="promoCode"/>
                            </div>
                            <div class="mb-3">
                                <label for="discountvalue" class="h5"><span>*</span> Discount Value</label>
                                <form:input type="text" id="discountvalue" placeholder="0.10" required="true"
                                            class="form-control" path="discountValue"/>
                            </div>
                            <div class="mb-3">
                                <label for="startdate" class="h5"><span>*</span> Start Date</label>
                                <form:input type="date" id="startdate" placeholder="09/09/2021" required="true"
                                            class="form-control" path="startDate"/>
                            </div>
                            <div class="mb-3">
                                <label for="enddate" class="h5"><span>*</span> End Date</label>
                                <form:input type="date" id="enddate" placeholder="09/10/2021" required="true"
                                            class="form-control" path="endDate"/>
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
