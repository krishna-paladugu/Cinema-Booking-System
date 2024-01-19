<%@ include file="navbar.jsp" %>

<div class="row no-gutters">
    <c:forEach items="${movies}" var="movies">
        <div class="col-sm-2">
            <div class="card-group">
                <div class="card">
                    <div class="card-header" style="background-color: dodgerblue;">Movie</div>
                    <img class="card-img"
                         src="https://lumiere-a.akamaihd.net/v1/images/star-wars-the-rise-of-skywalker-theatrical-poster-1000_ebc74357.jpeg?region=0%2C0%2C891%2C1372&width=200"
                         alt="Oscar">
                    <div class="card-body">
                        <h5 class="card-title">${movies.title}</h5>
                        <h5 class="card-subtitle">Price : ${movies.price}</h5>
                        <p>Seller : ${movies.seller} </p>
                    </div>
                    <div class="card-footer">
                        <div class="panel-footer">
                            <button type="button" class="btn btn-primary btn-md"
                                    onClick="location.href='/movies/${movies.imdbID} ' ">Browse
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </c:forEach>
</div>