<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>

<nav class="navbar navbar-expand-lg bg-success navbar-dark">
	<div class="container-fluid">
		<a class="navbar-brand" href="index.jsp"><i
			class="fa-solid fa-house-medical"></i>MEDI HOME</a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav ms-auto mb-2 mb-lg-0">
				<c:if test="${empty userobj }">
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="admin_login.jsp"><i
							class="fa-solid fa-arrow-right-to-bracket"></i>ADMIN</a></li>
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="doctor_login.jsp">DOCTOR</a></li>
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="user_appointment.jsp">APPOINTMENT</a></li>
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="user_login.jsp">USER</a></li>
				</c:if>

				<c:if test="${not empty userobj }">
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="user_appointment.jsp">APPOINTMENT</a></li>
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="view_appointment.jsp">VIEW APPOINTMENT</a></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle active" href="#" role="button"
						data-bs-toggle="dropdown" aria-expanded="false">
							<i class="fa-solid fa-user"></i> ${userobj.getFullName()} </a>
						<ul class="dropdown-menu dropdown-menu-end" aria-labelledby="dropdownMenuButton1">
							<li><a class="dropdown-item" href="changepassword.jsp">Change Passward</a></li>
							<li><a class="dropdown-item" href="callinguserlogoutservlet">Logout</a></li>
						</ul></li>
				</c:if>


			</ul>

		</div>
	</div>
</nav>