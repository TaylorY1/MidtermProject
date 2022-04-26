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


<form action="updatequote.do">


<label for="quoteId">Quote ID:</label>
  <input type="text" id="disabledInput" name="quoteId" value="${quoteToUpdate.id}"><br><br>
  
<label for="deductible">Deductible:</label>
  <input type="text" id="deductible" name="deductible" value="${quoteToUpdate.deductible}"><br><br>
  
  <label for="riskScore">Risk Score:</label>
  <input type="text" id="riskScore" name="riskScore" value="${quoteToUpdate.riskScore }"><br><br>
  
  <label for="premium">Premium:</label>
  <input type="text" id="premium" name="premium" value="${quoteToUpdate.premium }"><br><br>
  
 <%--  <label for="coverage">Coverage:</label>
  <input type="text" id="coverage" name="coverage" value="${quoteToUpdate.coverage }"><br><br>
   --%>
  <input type="submit" value="Submit">

</form>














<jsp:include page="/WEB-INF/bootstrap-js.jsp" />
</body>
</html>






