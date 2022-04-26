<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Get Quote</title>

<jsp:include page="/WEB-INF/bootstraphead.jsp" />

</head>
<body>
<jsp:include page="/WEB-INF/nav.jsp" />

<jsp:useBean id="date" class="java.util.Date"/>
Today is: <fmt:formatDate value="${date}" type="date" pattern="dd-MMM-yyyy"/><br />
You are logged in as: ${user.username}

<div class="container-sm">

<div class="container px-5 my-5">
    <form action="createQuote.do" id="createQuote" method="POST">
        <div class="form-floating mb-3">
            <select class="form-select" name="pet.species.id" id="species" aria-label="Pet Type">
                <option value="1">Dog</option>
                <option value="2">Cat</option>
                <option value="3">Other</option>
            </select>
            <label for="species">Pet Type</label>
        </div>
        
        
        
        <label for="date" class="col-1 col-form-label">Date</label>
    <div class="col-5">
      <div class="input-group date" id="datepicker">
        <input type="date" name="pet.birthdate" class="form-control" id="date"/>
        <span class="input-group-append">
          <span class="input-group-text bg-light d-block">
            <i class="fa fa-calendar"></i>
          </span>
        </span>
      </div>
    </div>
        
        
        
        
        
		
<!-- 		<div class="form-floating mb-3">
          	<input type="date" name="pet.birthdate" />
            <label for="birthday">Birthday</label>
        </div> -->
        
        <br />
         <div class="mb-3">
            <label class="form-label d-block">Pet&#x27;s Gender</label>
            <div class="form-check form-check-inline">
            
                <input class="form-check-input" value="male" type="radio" name="pet.gender"  />
                <label class="form-check-label" for="male">Male</label>
            </div>
            <div class="form-check form-check-inline">
                <input class="form-check-input" value="female" type="radio" name="pet.gender"  />
                <label class="form-check-label" for="female">Female</label>
            </div>
        </div> 
        <div class="form-floating mb-3">
            <select class="form-select" name="pet.breed.id" id="breed" aria-label="Pet&#x27;s Breed">
                <option value="1">Chihuahua</option>
                <option value="2">Golden Retriever</option>
            </select>
            <label for="breed">Pet&#x27;s Breed</label>
        </div>

        <div class="mb-3">
            <label class="form-label d-block">Conditions</label>
            <div class="form-check form-check-inline">
            	<c:forEach items="${conditions}" var="condition">
                <input class="form-check-input" value="${condition.id}" type="checkbox" name="conditions" />
                <label class="form-check-label" for="worms">Worms</label>
                </c:forEach>
            </div>
        </div> 
        
        <div class="mb-3">
            <label class="form-label d-block">Vaccinations</label>
            <div class="form-check form-check-inline">
            	<c:forEach items="${vaccinations}" var="vaccination">
                <input class="form-check-input" value="${vaccination.id}" type="checkbox" name="vaccinations" />
                <label class="form-check-label" for="bordetella">Bordetella</label>
                </c:forEach>
            </div>
        </div> 
        
        
        <div class="d-grid">
            <button class="btn btn-primary btn-lg " id="submitButton" type="submit" value= "createQuote">Submit</button>
        </div>
    </form>
</div>

</div>
<jsp:include page="/WEB-INF/bootstrap-js.jsp" />
</body>
</html>