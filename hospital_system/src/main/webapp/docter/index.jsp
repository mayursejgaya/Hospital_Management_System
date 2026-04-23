<%@page import="com.entity.Docter"%>
<%@page import="com.db.DBconnect"%>
<%@page import="com.dao.DocterDao"%>
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

	<c:if test="${not empty succmsg}">
		<p class="text-center text-success fs-10">${succmsg}</p>
		<c:remove var="succmsg" />
	</c:if>
	<c:if test="${not empty errormsg}">
		<p class="text-center text-danger fs-10">${errormsg}</p>
		<c:remove var="errormsg" />
	</c:if>
	<%
	DocterDao dao = new DocterDao(DBconnect.getconn());
	Docter doc=(Docter)session.getAttribute("docterobj"); 
	%>

	<p class="text-center fs-3">Docter Dashbaord</p>

	<div class="container p-5">
		<div class="row">
			<div class="col-md-4 offset-md-2">
				<div class="card paint-card">
					<div class="card-body text-center text-success">
						<i class="fa-solid fa-user fa-3x"></i><br>
						<p class="text-center fs-4">
							Docter <br><%= dao.countDocter() %>
						</p>
					</div>
				</div>
			</div>
			<div class="col-md-4">
				<div class="card paint-card">
					<div class="card-body text-center text-success">
						<p class="text-center fs-4">
							<i class="fa-regular fa-calendar fa-2x"></i><br> Total
							Appointment <br><%= dao.countAppointmentBydocterId(doc.getId()) %>
						</p>
					</div>
				</div>
			</div>

		</div>
	</div>

</body>
</html>