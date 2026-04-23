
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Signup page</title>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@include file="component/allcss.jsp"%>
<%@page isELIgnored="false" %>
<style type="text/css">
.paint-card{
	box-shadow: 0 0 10px 0 rgba(0,0,0,0.3);
}
</style>

</head>
<body>
<%@include file="component/navbar.jsp" %>


<div class="container p-5">
    <div class="row">
        <div class="col-md-4 offset-md-4">
            <div class="card paint-card">
                <div class="card-body">
                    <p class="fs-4 text-center">User Registration</p>
                    
                    <c:if test="${not empty succmsg}" >
                    <p class="text-center text-success fs-3">${succmsg}</p>
                    <c:remove var="succmsg"/>
                    </c:if>
                     <c:if test="${not empty errormsg}" >
                    <p class="text-center text-danger fs-3">${errormsg}</p>
                    <c:remove var="errormsg"/>
                    </c:if>
                   
                    <form action="user_register" method="post">
                    	<div class="mb-3">
                            <label class="form-label">Full Name</label>
                            <input type="text" required name="fullname" class="form-control" placeholder="Enter your name">
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Email address</label>
                            <input type="email" required name="email" class="form-control" placeholder="Enter your email">
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Password</label>
                            <input type="password" required name="password" class="form-control" placeholder="Enter your password">
                        </div>
                        <button type="submit" class="btn bg-success text-white col-md-12">Submit</button>
                    </form>
					
					<br>
					don't have an account?<a href="#" class="text-decoration-none"> Create one</a> 
					
                </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>