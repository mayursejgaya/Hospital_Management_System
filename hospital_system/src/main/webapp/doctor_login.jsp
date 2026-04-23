<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>doctor login page</title>
<%@include file="component/allcss.jsp"%>
<style type="text/css">
.paint-card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
}
</style>
</head>
<body>
	<%@include file="component/navbar.jsp"%>
	<div class="container p-5">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card paint-card">
					<div class="card-body">
						<p class="fs-4 text-center">Doctor Login</p>

						<c:if test="${not empty succmsg}">
							<p class="text-center text-success fs-8">${succmsg}</p>
							<c:remove var="succmsg" />
						</c:if>
						<c:if test="${not empty errormsg}">
							<p class="text-center text-danger fs-8">${errormsg}</p>
							<c:remove var="errormsg" />
						</c:if>

						<form action="loginDocter" method="post">
							<div class="mb-3">
								<label class="form-label">Email address</label> <input
									type="email" required name="email" class="form-control"
									placeholder="Enter your email">
							</div>
							<div class="mb-3">
								<label class="form-label">Password</label> <input
									type="password" required name="password" class="form-control"
									placeholder="Enter your password">
							</div>
							<button type="submit" class="btn bg-success text-white col-md-12">Login</button>
						</form>

					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>