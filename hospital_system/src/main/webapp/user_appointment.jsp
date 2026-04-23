
<%@page import="com.entity.Docter"%>
<%@page import="java.util.List"%>
<%@page import="com.db.DBconnect"%>
<%@page import="com.dao.DocterDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>user appointment</title>

<%@include file="component/allcss.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>


<style type="text/css">
.paint-card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
}

.backImg {
	background: linear-gradient(rgba(0, 0, 0, .4), rgba(0, 0, 0, .4)),
		url("img/hos_1.jpg");
	height: 20vh;
	width: 100%;
	background-size: cover;
	background-repeat: no-repeat;
}
</style>

</head>
<body>

	<%@include file="component/navbar.jsp"%>

	<div class="container-fulid backImg p-5">
		<p class="text-center fs-2 text-white"></p>
	</div>
	<div class="container p-3">
		<div class="row">
			<!-- <div class="col-md-6 p-5">
				<img src="img/doc1.jpg" alt="">
			</div> -->

			<div class="col-md-6 p-5">
				<img src="img/doc5.jpg" class="rounded" style="width: 70% ;height: 80%" alt="doctor">
			</div>

			<div class="col-md-6">
				<div class="card paint-card">
					<div class="card-body">
						<p class="text-center fs-3">User Appointment</p>
						<c:if test="${not empty succmsg}">
							<p class="text-center text-success fs-8">${succmsg}</p>
							<c:remove var="succmsg" />
						</c:if>
						<c:if test="${not empty errormsg}">
							<p class="text-center text-danger fs-8">${errormsg}</p>
							<c:remove var="errormsg" />
						</c:if>
						<form action="adduserappointment" method="post" class="row g-3">
							<input type="hidden" name="userid" value="${userobj.getId()}">

							<div class="col-md-6">
								<label for="inputemail" class="form-label">Full Name</label> <input
									type="text" required class="form-control" name="fullname">
							</div>

							<div class="col-md-6">
								<label for="inputemail" class="form-label">Gender</label> <select  class="form-control"
								name="gender" required>
									<option value="">Select....</option>
									<option value="male">Male</option>
									<option value="female">Female</option>
								</select>
							</div>

							<div class="col-md-6">
								<label for="inputemail" class="form-label">Age</label> <input
									type="number" required class="form-control" name="age">
							</div>

							<div class="col-md-6">
								<label for="inputemail" class="form-label">Appointment
									date</label> <input type="date" required class="form-control"
									name="appoint_date">
							</div>

							<div class="col-md-6">
								<label for="inputemail" class="form-label">Email</label> <input
									type="email" required class="form-control" name="email">
							</div>

							<div class="col-md-6">
								<label for="inputemail" class="form-label">Phone No</label> <input
									type="number" maxlength="10" required class="form-control"
									name="phone">
							</div>

							<div class="col-md-6">
								<label for="inputemail" class="form-label">Diseases</label> <input
									type="text" required class="form-control" name="diseases">
							</div>

							<div class="col-md-6">
								<label for="inputemail" class="form-label">Docter</label> <select
									required class="form-control" name="doct">
									<option value="">Select....</option>
									<%
									DocterDao dao = new DocterDao(DBconnect.getconn());
									List<Docter> d =dao.getAllDocter();
										for(Docter dc:d)
										{%>
											<option value="<%= dc.getId() %>"><%= dc.getFullname() %> (<%= dc.getSpecialist() %>)</option>
										<%} 
									%>
									
									
									
								</select>
							</div>

							<div class="col-md-12">
								<label for="inputemail" class="form-label">Full Address</label>
								<textarea required name="address" class="form-control" rows="3"
									cols=""></textarea>
							</div>

							<c:if test="${empty userobj}">
								<a href="user_login.jsp"
									class="col-md-6 offset-md-3 btn btn-success">Submit</a>
							</c:if>
							<c:if test="${not empty userobj}">
								<button class="col-md-6 offset-md-3 btn btn-success">Submit</button>
							</c:if>

							<input type="hidden" name="status" value="pending">

						</form>
					</div>
				</div>
			</div>
		</div>
	</div>


</body>
</html>
