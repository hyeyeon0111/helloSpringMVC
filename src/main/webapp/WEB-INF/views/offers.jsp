<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Show Offers</title>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/main.css">

</head>
<body>

	<table>
		<tr>
			<th>Id</th>
			<th>Name</th>
			<th>Email</th>
			<th>Offer</th>
		</tr>
		<c:forEach var="offer" items="${offers}">
			<tr>
				<td>${offer.id}</td>
				<td>${offer.name}</td>
				<td>${offer.email}</td>
				<td>${offer.text}</td>
			<tr>
		</c:forEach>
	</table>

</body>
</html>