<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Quotes</title>
<jsp:include page="/WEB-INF/bootstraphead.jsp" />
</head>
<body>
<jsp:include page="/WEB-INF/nav.jsp" />
<h1>Please select which quote you would like: </h1>

Quotes:
<c:choose>
		<c:when test="${!empty quotes}">
			 <div class="container-fluid">
    <div class="container p-5">
      <div class="row">
						<c:forEach items="${quotes}" var="q">
							<div class="col-lg-4 col-md-12 mb-4">
								<div class="card card1 h-100">
									<div class="card-body">

										<h5 class="card-title">${q.plan.name }</h5>
										<small class='text-muted'>${q.plan.description }</small> <br> <br>
										<span class="h2"><fmt:formatNumber value = "${q.premium}" type = "currency"/></span>/month <br> <br>
										
										<ul>
											<li>Annual Deductible: <fmt:formatNumber value = "${q.deductible}" type = "currency"/></li>
											<li>Annual Coverage: <fmt:formatNumber value = "${q.plan.baseCoverage}" type = "currency"/></li>
											<li>Date of Eligibility: ${q.quoteDate} </li>

										</ul>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>

            
          </div>
        </div>
		</c:when>

</c:choose>



<jsp:include page="/WEB-INF/bootstrap-js.jsp" />
</body>
</html>