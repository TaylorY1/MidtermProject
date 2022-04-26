<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Account</title>
<jsp:include page="/WEB-INF/bootstraphead.jsp" />
</head>
<body>
	<jsp:include page="/WEB-INF/nav.jsp" />
	<c:if test="${sessionScope.user.username != 'admin' }">
		<div class="container-fluid">
			<div class="container p-5">
				<div class="row">
					<c:forEach items="${quotes}" var="quote">
						<div class="col-lg-4 col-md-12 mb-4">
							<div class="card card1 h-100">
								<div class="card-body">

									<h5 class="card-title">${quote.tier.name}</h5>
									<small class='text-muted'>Individual</small> <br> <br>
									<span class="h2">$${quote.premium}</span>/month <br> <br>
									<div class="d-grid my-3">
										<button class="btn btn-outline-dark btn-block">Select</button>
									</div>
									<ul>
										<li>Deductible: $${quote.deductible}</li>
										<li>Risk Score: ${quote.riskScore}</li>

									</ul>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</c:if>

	<c:if test="${sessionScope.user.username == 'admin' }">
		<div class="container-fluid">
			<div class="container p-5">
				<div class="row">
					<c:forEach items="${allUsers}" var="user">
						<h1>${user.username}</h1>
						<c:forEach items="${allQuotes}" var="quote">
							<div class="col-lg-4 col-md-12 mb-4">
								<div class="card card1 h-100">
									<div class="card-body">

										<h5 class="card-title">${quote.tier.name}</h5>
										<small class='text-muted'>Individual</small> <br> <br>
										<span class="h2">$${quote.premium}</span>/month <br> <br>
										<div class="d-grid my-3">
											<button class="btn btn-outline-dark btn-block">Select</button>
										</div>
										<ul>
											<li>Deductible: $${quote.deductible}</li>
											<li>Risk Score: ${quote.riskScore}</li>

										</ul>
											<a href="update.do?quoteId=${quote.id}"><button type="button" class="btn btn-warning">Update</button></a>
											<a href="delete.do?quoteId=${quote.id}"><button type="button" class="btn btn-danger">Delete</button></a>
									</div>
								</div>
							</div>
						</c:forEach>
					</c:forEach>
				</div>
			</div>
		</div>
	</c:if>


	<jsp:include page="/WEB-INF/bootstrap-js.jsp" />
</body>
</html>