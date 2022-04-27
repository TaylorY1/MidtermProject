<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
			<c:forEach items="${quotes}" var ="q">
			<ul>
				<li>Quote ID: ${q.id}</li>
			</ul>
			</c:forEach>
		</c:when>

</c:choose>



<jsp:include page="/WEB-INF/bootstrap-js.jsp" />
</body>
</html>