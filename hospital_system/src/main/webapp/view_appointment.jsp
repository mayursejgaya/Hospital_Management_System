

<%@page import="com.entity.User"%>
<%@page import="com.entity.Docter"%>
<%@page import="com.dao.DocterDao"%>
<%@page import="com.entity.Appointment"%>
<%@page import="java.util.List"%>
<%@page import="com.db.DBconnect"%>
<%@page import="com.dao.AppointmentDao"%>
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

			<div class="col-md-9">
				<div class="card paint-card">
					<div class="card-body">
						<p class="fs-4 fw-bold text-center text-success">Appointment
							List</p>
						<table class="table">
							<thead>
								<tr>
									<th scope="col">Full Name</th>
									<th scope="col">Gender</th>
									<th scope="col">Age</th>
									<th scope="col">Appointment Date</th>
									<th scope="col">Diseases</th>
									<th scope="col">Docter Name</th>
									<th scope="col">Status</th>
								</tr>
							</thead>
							<tbody>

								<%
								User user = (User) session.getAttribute("userobj");
								AppointmentDao dao1 = new AppointmentDao(DBconnect.getconn());
								List<Appointment> list1 = dao1.getAllAppointmentByLoginuser(user.getId());
								for (Appointment ap : list1) {
								%>
								<tr>
									<td><%=ap.getFullname()%></td>
									<td><%=ap.getGender()%></td>
									<td><%=ap.getAge()%></td>
									<td><%=ap.getAppointmentDate()%></td>
									<td><%=ap.getDiseases()%></td>
									<%
									DocterDao dao2 = new DocterDao(DBconnect.getconn());
									Docter doc = dao2.getDocterById(ap.getDocterId());
									%>
									<td><%=doc.getFullname()%></td>
									<td>
										<%
										if ("pending".equals(ap.getStatus())) {
										%> <a href="#" class="btn btn-sm btn-warning">Pending</a> <%
 										} else {
 										%> <%=ap.getStatus()%> <%
										}
 										%>
									</td>
									<%
									}
									%>
								
							</tbody>
						</table>
					</div>
				</div>
			</div>


			<div class="col-md-3 p-3">
				<img src="img/doc5.jpg" class="rounded"
					style="width: 100%; height: 100%" alt="doctor">
			</div>


		</div>
	</div>


</body>
</html>
