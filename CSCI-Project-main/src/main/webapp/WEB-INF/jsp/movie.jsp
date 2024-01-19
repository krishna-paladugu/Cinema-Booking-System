<%@ include file="navbar.jsp" %>

<div class="container">    
  <div class="row">
  
    <div class="col-sm-4">
      <div class="panel panel-primary">
        <div class="panel-heading"> ${movie.title} </div>
        <div class="panel-body">
        <p>Description : ${movie.plot}  </p>
        <p>Price : ${movie.price}  </p>
		<p>Seller :  ${movie.seller} </p>
        </div>
        <div class="panel-footer"> <button type="button" class="btn btn-primary btn-md"
           onClick="location.href=' ' ">Buy</button></div>
      </div>
    </div>
   
  </div>
</div><br>