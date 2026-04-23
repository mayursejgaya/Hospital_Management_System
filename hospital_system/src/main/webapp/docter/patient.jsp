<%@page import="com.entity.Appointment"%>
<%@page import="java.util.List"%>
<%@page import="com.db.DBconnect"%>
<%@page import="com.dao.AppointmentDao"%>
<%@page import="com.entity.Docter"%>
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

	<c:if test="${empty docterobj }">
		<c:redirect url="../doctor_login.jsp"></c:redirect>
	</c:if>

	<%@include file="navbar.jsp"%>
	<div class="container">
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
									<th scope="col">Status</th>
									<th scope="col">Action</th>

								</tr>
							</thead>
							<tbody>
								<%
								Docter doc = (Docter) session.getAttribute("docterobj");
								AppointmentDao dao1 = new AppointmentDao(DBconnect.getconn());
								List<Appointment> list = dao1.getAllAppointmentByDocterId(doc.getId());
								for (Appointment ap : list) {
								%>
								<tr>

									<td><%=ap.getFullname()%></td>
									<td><%=ap.getGender()%></td>
									<td><%=ap.getAge()%></td>
									<td><%=ap.getAppointmentDate()%></td>
									<td><%=ap.getEmail()%></td>
									<td><%=ap.getPhone()%></td>
									<td><%=ap.getDiseases()%></td>
									<td><%=ap.getStatus()%></td>
									<%
									if ("pending".equals(ap.getStatus())) {
									%>
										<td><a href="comment.jsp?id=<%=ap.getId()%>"
										class="btn btn-sm btn-success">Comment</a></td>
									<%
									} else {
									%>
									<td><a href="comment.jsp?id=<%=ap.getId()%>"
										class="btn btn-sm btn-success disabled">Comment</a></td>
									<%
									}
									%>
									
									
									<th></th>
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