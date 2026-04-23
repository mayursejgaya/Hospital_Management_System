<%@page import="com.entity.Docter"%>
<%@page import="com.dao.DocterDao"%>
<%@page import="com.entity.Specialist"%>
<%@page import="java.util.List"%>
<%@page import="com.db.DBconnect"%>
<%@page import="com.dao.SpecialistDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>

<%@include file="../component/allcss.jsp"%>
<style type="text/css">
.paint-card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
}
</style>


</head>
<body>
	<%@include file="navbar.jsp"%>

	<div class="container-fluid p-3">
		<div class="row">

			<div class="col-md-12">
				<div class="card paint-card">
					<div class="card-body">
						<p class="fs-3 text-center">Docter Details</p>

						<c:if test="${not empty errormsg }">
							<p class="fs-10 text-center text-danger">${errormsg}</p>
							<c:remove var="errormsg" scope="session" />
						</c:if>
						<c:if test="${not empty succmsg }">
							<p class="fs-10 text-center text-success">${succmsg}</p>
							<c:remove var="succmsg" scope="session" />
						</c:if>


						<table class="table">
							<thead>
								<tr>
									<th scope="col">Full Name</th>
									<th scope="col">DOB</th>
									<th scope="col">Qualification</th>
									<th scope="col">Specialist</th>
									<th scope="col">Email</th>
									<th scope="col">Mobile</th>
									<th scope="col">Action</th>
								</tr>
							</thead>
							<tbody>

								<%
								DocterDao dao2 = new DocterDao(DBconnect.getconn());
								List<Docter> list2 = dao2.getAllDocter();
								for (Docter d : list2) {
								%>
								<tr>
									<td><%=d.getFullname()%></td>
									<td><%=d.getDob()%></td>
									<td><%=d.getQualification()%></td>
									<td><%=d.getSpecialist()%></td>
									<td><%=d.getEmail()%></td>
									<td><%=d.getMobile()%></td>
									<td><a href="edit_docter.jsp?id=<%=d.getId()%>"><i
											class="fa-solid fa-pen" style="color: #3333ff"></i></a> <a><i
											class="fa-solid fa-trash" style="color: #ff5c33"
											data-bs-toggle="modal" data-bs-target="#exampleModal"
											onclick="setDeleteId(<%=d.getId()%>)"> </i></a></td>

								</tr>
								<%
								}
								%>



							</tbody>
						</table>
					</div>
				</div>
			</div>
			<!-- Modal -->
			<div class="modal fade" id="exampleModal" tabindex="-1"
				aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog modal-dialog-centered">
					<div class="modal-content">
						<div class="modal-header">
							<h1 class="modal-title fs-5" id="exampleModalLabel">Are you
								sure?</h1>
							<button type="button" class="btn-close" data-bs-dismiss="modal"
								aria-label="Close"></button>
						</div>
						<div class="modal-body">Do you really want to delete this
							record? this process cannot be undone.</div>
						<form action="../deleteDocter" method="get">
							<input type="hidden" name="id" id="deleteId">
							<div class="modal-footer">
								<button type="button" class="btn btn-secondary"
									data-bs-dismiss="modal">Close</button>
								<button type="submit" class="btn btn-danger">Delete</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>










	<script>
function setDeleteId(id) {
    document.getElementById("deleteId").value = id;
}
</script>
</body>
</html>