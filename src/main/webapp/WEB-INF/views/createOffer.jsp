<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Create Offer</title>

<!-- Bootstrap core CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/main.css">

</head>
<body>

	<div class="container-wrapper">
		<div class="container">
			<h1>Create Offer</h1>
			<p class="lead">Fill the below information to create a offer:</p>
			
			<sf:form method="post"
				action="${pageContext.request.contextPath}/doCreate"
				modelAttribute="offer">
				
				<div class="form-group">
					<label>Name</label>
					<sf:input class="form-control" type="text" placeholder="Enter name" path="name"/>
					<span style="color:#ff0000;"><sf:errors path="name"/></span>			
				</div>
				
				<div class="form-group">
					<label>Email</label>
					<sf:input class="form-control" type="text" placeholder="Enter email" path="email"/>
					<span style="color:#ff0000;"><sf:errors path="email"/></span>
				</div>
				
				<div class="form-group">
					<label>Offer</label>
					<sf:textarea class="form-control" placeholder="Enter offer" path="text"/>
					<span style="color:#ff0000;"><sf:errors path="text"/></span>
				</div>
				
				<button type="submit" class="btn btn-primary">Submit</button>
			</sf:form>
			
		</div>
	</div>

</body>
</html>