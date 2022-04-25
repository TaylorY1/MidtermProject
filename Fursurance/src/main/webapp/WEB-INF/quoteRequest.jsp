<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Get Quote</title>

<jsp:include page="/WEB-INF/nav.jsp" />

</head>
<body>
<jsp:include page="/WEB-INF/nav.jsp" />

<jsp:useBean id="date" class="java.util.Date"/>
Today is: <fmt:formatDate value="${date}" type="date" pattern="dd-MMM-yyyy"/>

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
        
        
		
		<div class="form-floating mb-3">
          	<input type="date" name="pet.birthdate" />
            <label for="birthday">Birthday</label>
        </div>
<!--         <div class="mb-3">
            <label class="form-label d-block">Pet&#x27;s Gender</label>
            <div class="form-check form-check-inline">
                <input class="form-check-input" id="male" type="radio" name="petsGender" data-sb-validations="" />
                <label class="form-check-label" for="male">Male</label>
            </div>
            <div class="form-check form-check-inline">
                <input class="form-check-input" id="female" type="radio" name="petsGender" data-sb-validations="" />
                <label class="form-check-label" for="female">Female</label>
            </div>
        </div> -->
        <div class="form-floating mb-3">
            <select class="form-select" name="pet.breed.id" id="breed" aria-label="Pet&#x27;s Breed">
                <option value="1">Chihuahua</option>
                <option value="2">Golden Retriever</option>
            </select>
            <label for="breed">Pet&#x27;s Breed</label>
        </div>
<!--         <div class="form-floating mb-3">
            <select class="form-select" id="petSize" aria-label="Pet Size">
                <option value="1-15 lbs (Small)">1-15 lbs (Small)</option>
                <option value="16-75 lbs (Medium)">16-75 lbs (Medium)</option>
                <option value="76+ lbs (Large)">76+ lbs (Large)</option>
            </select>
            <label for="petSize">Pet Size</label>
        </div> -->
        <!-- <div class="mb-3">
            <label class="form-label d-block">Conditions</label>
            <div class="form-check form-check-inline">
                <input class="form-check-input" id="optionA" type="checkbox" name="conditions" data-sb-validations="" />
                <label class="form-check-label" for="optionA">option A</label>
            </div>
            <div class="form-check form-check-inline">
                <input class="form-check-input" id="optionB" type="checkbox" name="conditions" data-sb-validations="" />
                <label class="form-check-label" for="optionB">option B</label>
            </div>
            <div class="form-check form-check-inline">
                <input class="form-check-input" id="optionC" type="checkbox" name="conditions" data-sb-validations="" />
                <label class="form-check-label" for="optionC">option C</label>
            </div>
            <div class="form-check form-check-inline">
                <input class="form-check-input" id="optionD" type="checkbox" name="conditions" data-sb-validations="" />
                <label class="form-check-label" for="optionD">option D</label>
            </div>
            <div class="form-check form-check-inline">
                <input class="form-check-input" id="optionE" type="checkbox" name="conditions" data-sb-validations="" />
                <label class="form-check-label" for="optionE">option E</label>
            </div>
            <div class="form-check form-check-inline">
                <input class="form-check-input" id="optionF" type="checkbox" name="conditions" data-sb-validations="" />
                <label class="form-check-label" for="optionF">option F</label>
            </div>
            <div class="form-check form-check-inline">
                <input class="form-check-input" id="optionG" type="checkbox" name="conditions" data-sb-validations="" />
                <label class="form-check-label" for="optionG">option G</label>
            </div>
            <div class="form-check form-check-inline">
                <input class="form-check-input" id="optionH" type="checkbox" name="conditions" data-sb-validations="" />
                <label class="form-check-label" for="optionH">option H</label>
            </div>
            <div class="form-check form-check-inline">
                <input class="form-check-input" id="optionI" type="checkbox" name="conditions" data-sb-validations="" />
                <label class="form-check-label" for="optionI">option I</label>
            </div>
            <div class="form-check form-check-inline">
                <input class="form-check-input" id="optionJ" type="checkbox" name="conditions" data-sb-validations="" />
                <label class="form-check-label" for="optionJ">option J</label>
            </div>
            <div class="form-check form-check-inline">
                <input class="form-check-input" id="optionK" type="checkbox" name="conditions" data-sb-validations="" />
                <label class="form-check-label" for="optionK">option K</label>
            </div>
            <div class="form-check form-check-inline">
                <input class="form-check-input" id="optionL" type="checkbox" name="conditions" data-sb-validations="" />
                <label class="form-check-label" for="optionL">option L</label>
            </div> 
        </div> -->
        
        <div class="d-grid">
            <button class="btn btn-primary btn-lg " id="submitButton" type="submit" value= "createQuote">Submit</button>
        </div>
    </form>
</div>

</div>
<jsp:include page="/WEB-INF/bootstrap-js.jsp" />
</body>
</html>