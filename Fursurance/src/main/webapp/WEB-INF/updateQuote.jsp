<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="/WEB-INF/bootstraphead.jsp" />
</head>
<body>
	<jsp:include page="/WEB-INF/nav.jsp" />

	<div class="container-fluid">
		<div class="container p-5">
			<div class="row">
				<form action="updatequote.do" method="post">

					<label for="quoteId">Quote ID:</label> <input type="text"
						id="quoteId" name="quoteId" value="${quoteToUpdate.id}" readonly><br>
					<br> <label for="deductible">Deductible:</label> <input
						type="text" id="deductible" name="deductible"
						value="${quoteToUpdate.deductible}"><br> <br> <label
						for="riskScore">Risk Score:</label> <input type="text"
						id="riskScore" name="riskScore"
						value="${quoteToUpdate.riskScore }"><br> <br> <label
						for="premium">Premium:</label> <input type="text" id="premium"
						name="premium" value="${quoteToUpdate.premium }"><br>
					<br> <label for="coverage">Coverage:</label> <input
						type="text" id="coverage" name="coverage" value="${1}"><br>
					<br> <%-- <label for="plan">Plan:</label> <input type="text"
						id="plan" name="planid" value="${quoteToUpdate.plan.id}"><br>
					<br> <label for="teir">Tier:</label> <select name="tier"
						id="tier">
						<option value="${quoteToUpdate.tier.id}">${quoteToUpdate.tier.name}</option>
						<option value=1>Bronze</option>
						<option value=2>Silver</option>
						<option value=3>Gold</option>
					</select> --%>




					<%--  <label for="coverage">Coverage:</label>
  <input type="text" id="coverage" name="coverage" value="${quoteToUpdate.coverage }"><br><br>
   --%>

					<%--  <label for="coverage">Coverage:</label>
  <input type="text" id="coverage" name="coverage" value="${quoteToUpdate.coverage }"><br><br>
   --%>

					<%--  <label for="coverage">Coverage:</label>
  <input type="text" id="coverage" name="coverage" value="${quoteToUpdate.coverage }"><br><br>
   --%>



					<input type="submit" value="Submit">

				</form>

				
					<div class="col-lg-4 col-md-12 mb-4">
						<div class="card card1 h-100">
							<div class="card-body">
								<h5 class="card-title">User: ${quoteToUpdate.user.username}</h5>
								<small class='text-muted'>Pet: ${quoteToUpdate.pet.name}</small> <br> <br>
								<span class="h2">$${quoteToUpdate.premium}</span>/month <br>
								<br>
								<ul>
									<li>Deductible: $${quoteToUpdate.deductible}</li>
									<li>Risk Score: ${quoteToUpdate.riskScore}</li>
									<li>Description: ${quoteToUpdate.plan.description}</li>

								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
	</div>














	<jsp:include page="/WEB-INF/bootstrap-js.jsp" />
</body>
</html>






