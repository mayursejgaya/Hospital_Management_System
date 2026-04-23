<%@page import="com.db.DBconnect"%>
<%@page import="com.dao.DocterDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>admin</title>
<%@include file="../component/allcss.jsp"%>
<style type="text/css">
.paint-card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
}
</style>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>



</head>
<body>
	<%@include file="navbar.jsp"%>
	
	<c:if test="${empty adminobj }">
			<c:redirect url="../admin_login.jsp"></c:redirect>
		</c:if>
		
	<div class="container p-5">

		<p class="text-center fs-2">Admin Dashboard</p>
		<c:if test="${not empty succmsg}">
			<p class="text-center text-success fs-10">${succmsg}</p>
			<c:remove var="succmsg" />
		</c:if>
		<c:if test="${not empty errormsg}">
			<p class="text-center text-danger fs-10">${errormsg}</p>
			<c:remove var="errormsg" />
		</c:if>
		<%
		DocterDao dao1 = new DocterDao(DBconnect.getconn());
		int doc = dao1.countDocter();
		int use = dao1.countUser();
		int appo = dao1.countAppointment();
		int spec = dao1.countSpecialist();
		%>

		<div class="row">
			<div class="col-md-4">
				<div class="card paint-card">
					<div class="card-body text-center text-success">
						<i class="fa-solid fa-user-doctor fa-3x"></i><br>
						<p class="fs-4 text-center">
							Doctor <br><%= doc %>
						</p>
					</div>
				</div>
			</div>
			<div class="col-md-4">
				<div class="card paint-card">
					<div class="card-body text-center text-success">
						<i class="fa-solid fa-user fa-3x"></i><br>
						<p class="fs-4 text-center">
							User <br><%= use %>
						</p>
					</div>
				</div>
			</div>
			<div class="col-md-4">
				<div class="card paint-card">
					<div class="card-body text-center text-success">
						<i class="far fa-calendar-check fa-3x"></i><br>
						<p class="fs-4 text-center">
							Total Appointment <br><%= appo %>
						</p>
					</div>
				</div>
			</div>
			<div class="col-md-4 mt-4">
				<div class="card paint-card" data-bs-toggle="modal"
					data-bs-target="#staticBackdrop">
					<div class="card-body text-center text-success">
						<i class="far fa-calendar-check fa-3x"></i><br>
						<p class="fs-4 text-center">
							Specialist <br><%= spec %>
						</p>
					</div>
				</div>
			</div>

		</div>
	</div>




	<!-- Modal -->
	<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static"
		data-bs-keyboard="false" tabindex="-1"
		aria-labelledby="staticBackdropLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="staticBackdropLabel">Modal title</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<form action="../AddSpecialist" method="post">
						<div class="form-group">
							<label>Enter Specialist name</label> <input type="text"
								name="specName" required class="form-control" >
						</div>
						<div class="text-center mt-2">
							<button type="submit" class="btn btn-primary">Add</button>
						</div>
					</form>

				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">Close</button>

				</div>
			</div>
		</div>
	</div>

</body>
</html>