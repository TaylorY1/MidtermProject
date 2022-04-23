<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html>
<html>
<head>

<jsp:include page="/WEB-INF/nav.jsp" />

<meta charset="UTF-8">
<title>Fursurance</title>
</head>



<body style="background-color: #cccccc">
<div style="background-color: #cccccc">
<div class="px-4 pt-5 my-5 text-center border-bottom" style="background-color: #cccccc; margin-top: 0px;">
    <h1 class="display-4 fw-bold">Pet Insurance<br />ForSure!</h1>
    <div class="col-lg-6 mx-auto">
      <p class="lead mb-4">Quickly design and customize responsive mobile-first sites with Bootstrap, the world’s most popular front-end open source toolkit, featuring Sass variables and mixins, responsive grid system, extensive prebuilt components, and powerful JavaScript plugins.</p>
      <div class="d-grid gap-2 d-sm-flex justify-content-sm-center mb-5">
        <a href="getQuote.do"><button type="button" class="btn btn-primary btn-lg px-4 me-sm-3">Get Quote!</button></a>
        <!-- <button type="button" class="btn btn-outline-secondary btn-lg px-4">Secondary</button> -->
      </div>
    </div>
    <div class="overflow-hidden" style="max-height: 30vh;">
      <div class="container px-5">
        <img src="../media/pet-hero.png" class="img-fluid  rounded-3 mb-4" alt="Example image" width="700" height="500" loading="lazy">
      </div>
    </div>
  </div>

</div>

${DEBUG}



</body>
</html>