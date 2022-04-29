<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ummmm...</title>
<jsp:include page="/WEB-INF/bootstraphead.jsp" />
<link rel="stylesheet" href="css/error.css">
</head>
<body>
	<div class="wrapper">
		<div class="box">
			<h1>Something went wrong</h1>
			<div class="d-flex justify-content-center">
			<img alt="" src="media/puppyTrouble.jpeg">
			</div>
			<p>Sorry, it's me, not you.</p>
			<p>
				<a href="home.do">Let me try again!</a>
			</p>
		</div>
	</div>
	<jsp:include page="/WEB-INF/bootstrap-js.jsp" />
</body>
</html>