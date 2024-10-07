<%@page import="com.conn.DBConnect"%>
<%@page import="com.dao.DAO"%>
<%@page import="com.entity.values"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>edit telephone</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
</head>
<body style="background-color: #DCDCDC;">

	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"></script>
	<br>
	<br>
	<div class="container p-4">
		<div class="row">
			<div class="col-md-6 offset-md-3">
				<div class="card">
					<div class="card-body">
						<p class="f-3 text-center fs-3">Edit telephone</p>


						<%
						int id = Integer.parseInt(request.getParameter("id"));
						DAO dao = new DAO(DBConnect.getconn());
						values val = dao.getTelephoneById(id);
						%>

						<form action="update" method="post">
							<div class="mb-3">
								<label class="form-label">Full Name: </label> <input type="text"
									value="<%=val.getName()%>" name="name" class="form-control">
							</div>

							<div class="mb-3">
								<label class="form-label">Address: </label> <input type="text"
									value="<%=val.getAddress()%>" name="address"
									class="form-control">
							</div>

							<div class="mb-3">
								<label class="form-label">Email: </label> <input type="email"
									value="<%=val.getEmail()%>" name="email" class="form-control">
							</div>

							<div class="mb-3">
								<label class="form-label">Date of Birth: </label> <input
									value="<%=val.getDob()%>" type="date" name="dob"
									class="form-control">
							</div>

							<div class="mb-3">
								<label class="form-label">Phone: </label> <input type="text"
									value="<%=val.getPhone()%>" name="phone" class="form-control">
							</div>

							<input type="hidden" name="id" value="<%=val.getId()%>">

							<button type="submit" class="btn btn-primary col-md-12">Update</button>
						</form>


					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
