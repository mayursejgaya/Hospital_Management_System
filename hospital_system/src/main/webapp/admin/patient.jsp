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
<title>Insert title here</title>

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

	<div class="container py-5">
		<div class="row">
			<div class="col-md-12">
				<div class="card paint-card">
					<div class="card-body">
						<p class="text-center fs-3 text-success">Patient Details</p>
						<c:if test="${not empty succmsg}">
							<p class="text-center text-success fs-10">${succmsg}</p>
							<c:remove var="succmsg" scope="session" />
						</c:if>
						<c:if test="${not empty errormsg}">
							<p class="text-center text-danger fs-10">${errormsg}</p>
							<c:remove var="errormsg" scope="session" />
						</c:if>

						<table class="table">
							<thead>
								<tr>
									<th scope="col">Full Name</th>
									<th scope="col">Gender</th>
									<th scope="col">Age</th>
									<th scope="col">Appointment Date</th>
									<th scope="col">Email</th>
									<th scope="col">Mob. no.</th>
									<th scope="col">Diseases</th>
									<th scope="col">Docter Name</th>
									<th scope="col">Address</th>
									<th scope="col">Status</th>


								</tr>
							</thead>
							<tbody>
								<%
								AppointmentDao dao1 = new AppointmentDao(DBconnect.getconn());
								List<Appointment> list = dao1.getAllAppointment();
								for (Appointment ap : list) {
									DocterDao da = new DocterDao(DBconnect.getconn());
									Docter doc =da.getDocterById(ap.getDocterId());
								%>
								<tr>

									<td><%=ap.getFullname()%></td>
									<td><%=ap.getGender()%></td>
									<td><%=ap.getAge()%></td>
									<td><%=ap.getAppointmentDate()%></td>
									<td><%=ap.getEmail()%></td>
									<td><%=ap.getPhone()%></td>
									<td><%=ap.getDiseases()%></td>
									<td><%=doc.getFullname()%></td>
									<td><%=ap.getAddress()%></td>
									<td><%=ap.getStatus()%></td>
									
								</tr>
								<%
								}
								%> 

							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>




</body>
</html>