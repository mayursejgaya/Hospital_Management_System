<%@page import="com.entity.Appointment"%>
<%@page import="com.db.DBconnect"%>
<%@page import="com.dao.AppointmentDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<%@include file="../component/allcss.jsp"%>
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

	<c:if test="${empty docterobj }">
		<c:redirect url="../doctor_login.jsp"></c:redirect>
	</c:if>

	<%@include file="navbar.jsp"%>
	<div class="container-fulid backImg p-5">
		<p class="text-center fs-2 text-white"></p>
	</div>
	<div class="container p-3">
		<div class="row">
			<div class="col-md-6 offset-md-3">
				<div class="card paint-card">
					<div class="card-body">
						<p class="text-center fs-4">Patient Comment</p>

						<%
						int id = Integer.parseInt(request.getParameter("id"));
						AppointmentDao dao = new AppointmentDao(DBconnect.getconn());
						Appointment ap = dao.getAppointmentbyId(id);
						%>

						<form action="../commentupdate" method="post">
							<div class="row">
								<div class="col-md-6">
									<label>Patient Name</label> <input type="text" readonly
										class="form-control" value="<%=ap.getFullname()%>">
								</div>

								<div class="col-md-6">
									<label>Age</label> <input type="text" readonly
										class="form-control" value="<%=ap.getAge()%>">
								</div>
							</div>

							<div class="row">
								<div class="col-md-6">
									<label>mo.no</label> <input type="text" readonly
										class="form-control" value="<%=ap.getPhone()%>">
								</div>

								<div class="col-md-6">
									<label>Diseases</label> <input type="text" readonly
										class="form-control" value="<%=ap.getDiseases()%>">
								</div>
							</div>

							<div class="col-md-12">
								<br> <label>comment</label>
								<textarea required name="comm" class="form-control" rows="3"></textarea>
							</div>

							<input type="hidden" name="id" value="<%=ap.getId()%>">
							<input type="hidden" name="did" value="<%=ap.getDocterId()%>">

							<button type="submit"
								class="mt-3 btn btn-success col-md-6 offset-md-3">
								Submit</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>



</body>
</html>