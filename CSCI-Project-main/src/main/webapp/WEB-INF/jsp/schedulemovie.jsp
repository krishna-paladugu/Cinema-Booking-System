<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ include file="admin-navbar.jsp" %>
<head>
    <title>Schedule Movie</title>
    <style>
        <%@include file="/WEB-INF/css/adminportal.css" %>
        <%@include file="/WEB-INF/css/addmovies.css" %>
    </style>
</head>
<div class="container py-5">
    <div class="row">
        <div class="col-lg-7 mx-auto">
            <div class="bg-white rounded-lg shadow-lg rounded-3 p-5">
                <div class="tab-content">
                    <div id="nav-tab-card" class="tab-pane fade show active">
                        <form:form method="POST" modelAttribute="scheduleMovieForm">
                            <h3 class="display-4 text-center">Schedule Movie</h3>
                            <br>
                            <p class="h6"><span>*</span> indicates required fields</p>
                            <div class="add-movie-error">${message}</div>
                            <div class="add-movie-success">${message2}</div>
                            <div class="mb-3">
                                <label for="movieid" class="h5"><span>*</span> Movie ID</label>
                                <form:input type="text" id="movieid" required="true"
                                            class="form-control" path="movieID"/>
                            </div>
                            <div class="mb-3">
                                <label for="date" class="h5"><span>*</span> Date</label>
                                <form:input type="date" id="date" required="true"
                                            class="form-control" path="date"/>
                            </div>
                            <div class="mb-3">
                                <label for="time" class="h5"><span>*</span> Time</label>
                                <form:input type="time" id="time" required="true"
                                            class="form-control" path="time"/>
                            </div>
                            <div class="mb-3">
                                <label for="cinemahall" class="h5"><span>*</span> Cinema Hall</label>
                                <form:select class="form-select" id="cinemahall" aria-label="Default select example" path="cinemahallName">
                                    <form:option value="Hall 1">Hall 1</form:option>
                                    <form:option value="Hall 2">Hall 2</form:option>
                                    <form:option value="Hall 3">Hall 3</form:option>
                                </form:select>
                            </div>
                            <br>
                            <div class="d-grid">
                                <input class="btn btn-success btn-login fw-bold" type="submit" value="Save">
                            </div>
                        </form:form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
