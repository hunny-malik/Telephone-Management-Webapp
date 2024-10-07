<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
</head>
<body>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"></script>
	<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
		<div class="container-fluid">
			<a class="navbar-brand" href="#">Telephone Management System</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="index.jsp">Home</a></li>
					<li class="nav-item"><a class="nav-link"
						href="add_telephone.jsp">Add telephone</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<div class="container p-4">
		<div class="row">
			<div class="col-md-6 offset-md-3">
				<div class="card">
					<div class="card-body">
						<p class="f-3 text-center fs-3">Add telephone</p>

						<c:if test="${not empty suc }">
							<p class="text-center text-success">${suc }</p>
							<c:remove var="suc" />
						</c:if>

						<c:if test="${not empty err }">
							<p class="text-center text-success">${err }</p>
							<c:remove var="err" />
						</c:if>

						<form action="register" method="post">
							<div class="mb-3">
								<label class="form-label">Full Name: </label> <input type="text"
									name="name" class="form-control">
							</div>

							<div class="mb-3">
								<label class="form-label">Address: </label> <input type="text"
									name="address" class="form-control">
							</div>

							<div class="mb-3">
								<label class="form-label">Email: </label> <input type="email"
									name="email" class="form-control">
							</div>

							<div class="mb-3">
								<label class="form-label">Date of Birth: </label> <input
									type="date" name="dob" class="form-control">
							</div>

							<div class="mb-3">
								<label class="form-label">Phone: </label> <input type="text"
									name="phone" class="form-control">
							</div>

							<button type="submit" class="btn btn-primary col-md-12">Submit</button>
						</form>


					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
