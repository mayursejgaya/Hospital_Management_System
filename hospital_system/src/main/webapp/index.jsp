
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index page123</title>
<%@include file="component/allcss.jsp"%>

<style type="text/css">
.paint-card{
	box-shadow: 0 0 10px 0 rgba(0,0,0,0.3);
}
.team-card {
            border: none;
            border-radius: 10px;
            transition: 0.3s;
        }

        .team-card:hover {
            transform: translateY(-8px);
        }

        .team-card img {
            height: 250px;
            object-fit: cover;
            border-radius: 10px;
        }

        .team-title span {
            background: #0d6efd;
            color: white;
            padding: 5px 10px;
            border-radius: 4px;
        }
</style>


</head>
<body>
<%@include file="component/navbar.jsp" %>




<div id="carouselExampleIndicators" class="carousel slide">
  <div class="carousel-indicators">
    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
  </div>
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="img/main_1.jpg" class="d-block w-100" alt="..." height="600px">
    </div>
    <div class="carousel-item">
      <img src="img/main_2.jpg" class="d-block w-100" alt="..." height="600px">
    </div>
    <div class="carousel-item">
      <img src="img/main_3.jpg" class="d-block w-100" alt="..." height="600px">
    </div>
  </div>
  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Previous</span>
  </button>
  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Next</span>
  </button>
</div>
 
 <div class="container p-3">
    <p class="text-center fs-2">Key Features of our Hospital</p>
    <div class="row">
        <div class="col-md-8 p-5">
            <div class="row">
                <div class="col-md-6">
                    <div class="card paint-card">
                        <div class="card-body">
                            <p class="fs-5">100% Safety</p>
                            <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Ipsum, excepturi repellendus alias in amet reiciendis.</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="card paint-card">
                        <div class="card-body">
                            <p class="fs-5"> Clean Enviroment</p>
                            <p>Lorem ipsum dolor sit, amet consectetur adipisicing elit. Iste, doloremque hic. Hic est eveniet impedit?</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 mt-2">
                    <div class="card paint-card">
                        <div class="card-body">
                            <p class="fs-5">Friendly Doctors</p>
                            <p>Lorem ipsum dolor sit, amet consectetur adipisicing elit. Iste, doloremque hic. Hic est eveniet impedit?</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 mt-2">
                    <div class="card paint-card">
                        <div class="card-body">
                            <p class="fs-5">Medical Research</p>
                            <p>Lorem ipsum dolor sit, amet consectetur adipisicing elit. Iste, doloremque hic. Hic est eveniet impedit?</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-4 d-flex align-items-center">
            <img src="img/doc2.jpg" class="img-fluid rounded" alt="doctor">
        </div>
    </div>
</div>
<hr>
<div class="container pb-2">
    
    <!-- Title -->
    <h2 class="text-center mb-4 team-title">Our Team</h2>

    <!-- Team Cards -->
    <div class="row justify-content-center">

        <div class="col-md-3">
            <div class="card team-card shadow text-center p-3">
                <img src="img/doc4.jpg" class="img-fluid" alt="">
                <h5 class="mt-3">Samuani Simi</h5>
                <p class="text-muted">(CEO & Chairman)</p>
            </div>
        </div>

        <div class="col-md-3">
            <div class="card team-card shadow text-center p-3">
                <img src="img/doc1.jpg" class="img-fluid" alt="">
                <h5 class="mt-3">Dr. Siva Kumar</h5>
                <p class="text-muted">(Chief Doctor)</p>
            </div>
        </div>

        <div class="col-md-3">
            <div class="card team-card shadow text-center p-3">
                <img src="img/doc2.jpg" class="img-fluid" alt="">
                <h5 class="mt-3">Dr. Niuise Paule</h5>
                <p class="text-muted">(Chief Doctor)</p>
            </div>
        </div>

        <div class="col-md-3">
            <div class="card team-card shadow text-center p-3">
                <img src="img/doc3.jpg" class="img-fluid" alt="">
                <h5 class="mt-3">Dr. jack Samuel</h5>
                <p class="text-muted">(Chief Doctor)</p>
            </div>
        </div>

    </div>

</div>

<%@include file="component/footer.jsp" %>



	
</body>
</html>
