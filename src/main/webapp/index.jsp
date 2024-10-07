<%@page import="java.util.List"%>
<%@page import="com.conn.DBConnect"%>
<%@page import="com.dao.DAO"%>
<%@page import="com.entity.values"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Index page</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
</head>
<body class="bg-light">

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

	<br>
	<div class="container p-3">
		<div class="card">
			<div class="card-body">

				<p class="text-center fs-1">All Telephone Details</p>
				<c:if test="${not empty suc }">
					<p class="text-center text-success">${suc }</p>
					<c:remove var="suc" />
				</c:if>

				<c:if test="${not empty err }">
					<p class="text-center text-success">${err }</p>
					<c:remove var="err" />
				</c:if>
				<table class="table">
					<thead>
						<tr>
							<th scope="col">Full Name</th>
							<th scope="col">Address</th>
							<th scope="col">Email</th>
							<th scope="col">Date of Birth</th>
							<th scope="col">Phone</th>
							<th scope="col">Action</th>

						</tr>
					</thead>
					<tbody>

						<%
						DAO dao = new DAO(DBConnect.getconn());
						List<values> list = dao.showAllTelephone();

						for (values val : list) {
						%>

						<tr>
							<th scope="row"><%=val.getName()%></th>
							<td><%=val.getAddress()%></td>
							<td><%=val.getEmail()%></td>
							<td><%=val.getDob()%></td>
							<td><%=val.getPhone()%></td>
							<td><a href="edit_telephone.jsp?id=<%=val.getId()%>"
								class="btn btn-sm btn-primary">Edit</a> <a
								href="delete?id=<%=val.getId()%>"
								class="btn btn-sm btn-danger ms-1">Delete</a></td>

							<%
							}
							%>

						</tr>

					</tbody>
				</table>
			</div>
		</div>
	</div>

</body>
</html>
