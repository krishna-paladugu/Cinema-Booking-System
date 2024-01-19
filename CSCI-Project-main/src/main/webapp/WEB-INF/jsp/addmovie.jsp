<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ include file="admin-navbar.jsp" %>
<head>
    <title>Add Movie</title>
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
                        <form:form id="addmovie" method="POST" modelAttribute="movieForm">
                            <h3 class="display-4 text-center">Add Movie</h3>
                            <br>
                            <p class="h6"><span>*</span> indicates required fields</p>
                            <div class="add-movie-success">${message}</div>
                            <div class="mb-3">
                                <label for="movietitle" class="h5"><span>*</span> Movie Title</label>
                                <form:input type="text" id="movietitle"
                                            value='<%= request.getParameter("movie-title")%>'
                                            required="true"
                                            class="form-control" path="movieTitle"/>
                            </div>
                            <div class="mb-3">
                                <label for="category" class="h5"><span>*</span> Category</label>
                                <form:input type="text" id="category" value='<%= request.getParameter("genre")%>'
                                            required="true"
                                            class="form-control" path="category"/>
                            </div>
                            <div class="mb-3">
                                <label for="cast" class="h5"><span>*</span> Cast</label>
                                <form:input type="text" id="cast" value='<%= request.getParameter("actors")%>'
                                            required="true"
                                            class="form-control" path="cast"/>
                            </div>
                            <div class="mb-3">
                                <label for="director" class="h5"><span>*</span> Director</label>
                                <form:input type="text" id="director" value='<%= request.getParameter("directors")%>'
                                            required="true"
                                            class="form-control" path="director"/>
                            </div>
                            <div class="mb-3">
                                <label for="producer" class="h5"><span>*</span> Producer</label>
                                <form:input type="text" id="producer" required="true"
                                            class="form-control" path="producer"/>
                            </div>
                            <div class="mb-3">
                                <label for="synopsis" class="h5"><span>*</span> Synopsis</label>
                                <form:input type="text" id="synopsis" value='<%= request.getParameter("plot")%>'
                                            required="true"
                                            class="form-control" path="synopsis"/>
                            </div>
                            <div class="mb-3">
                                <label for="review" class="h5"><span>*</span> Review</label>
                                <form:input type="text" id="review" value='<%= request.getParameter("imdb-rating")%>'
                                            required="true"
                                            class="form-control" path="review"/>
                            </div>
                            <div class="mb-3">
                                <label for="trailerpic" class="h5"><span>*</span> Trailer picture</label>
                                <form:input type="text" id="trailerpic"
                                            value='<%= request.getParameter("trailerpicture")%>' required="true"
                                            class="form-control" path="trailerPicture"/>
                            </div>
                            <div class="mb-3">
                                <label for="trailervid" class="h5"><span>*</span> Trailer video</label>
                                <form:input type="text" id="trailervid" required="true"
                                            class="form-control" path="trailerVideo"/>
                            </div>
                            <div class="mb-3">
                                <label for="filmrating" class="h5"><span>*</span> MPAA-US film rating code</label>
                                <form:input type="text" id="filmrating"
                                            value='<%= request.getParameter("MPAA-rating")%>'
                                            required="true"
                                            class="form-control" path="MPAArating"/>
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
