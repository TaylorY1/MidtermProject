<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Fursurance</title>
<jsp:include page="/WEB-INF/bootstraphead.jsp" />
<link rel="stylesheet" href="css/index.css"/>
</head>



<body style="background-color: #cccccc">
	<jsp:include page="/WEB-INF/nav.jsp" />
	<div style="background-color: #cccccc">
		<div class="px-4 pt-5 my-5 text-center border-bottom"
			style="background-color: #cccccc; margin-top: 0px;">
			<h1 class="display-4 fw-bold">
				Pet Insurance<br />FurSure!
			</h1>
			<div class="col-lg-6 mx-auto">
				<p class="lead mb-4">At Fursurance, you know you are "fur" sure getting the best deal. We pride ourselves on our service. We are here when you needs us, Twenty-fur Seven!</p>
				<div class="d-grid gap-2 d-sm-flex justify-content-sm-center mb-5">
					<a href="getQuote.do"><button type="button"
							class="btn btn-primary btn-lg px-4 me-sm-3">Get Quote!</button></a>
				</div>
			</div>
			<div><!-- class="overflow-hidden" style="max-height: 30vh;" -->
				<div class="container px-5">
					<img src="../media/pet-hero.png" class="img-fluid  rounded-3 mb-4"
						alt="Example image" width="700" height="500" loading="fast as fuck boiiiiii">
				</div>
			</div>
		<div class="px-4 pt-5 my-5 text-center border-bottom"
			style="background-color: #cccccc; margin-top: 0px;">
			<p></p>
			<h2>Meet The Fursurance Team</h2>
			<a href="anthonybio.jsp">CEO: Anthony Butler</a>
			<br><br>
			<a href="chasebio.jsp">COO: Chase Schwatka</a>
			<br><br>
			<a href="taylorbio.jsp">Lead Insurance Broker: Taylor Yockey</a>
			<br><br>
			<a href="danielbio.jsp">Head of Marketing: Daniel Kregstein</a>
			<br><br>
			<h3>Contact Information</h3>
			
			<p>Phone: 1-800-FURSURANCE</p>
			<p>Email: Support_SmileyPups@Fursurance.com</p>
		
			
			
			
			</div>
		</div>
			

	</div>




	<jsp:include page="/WEB-INF/bootstrap-js.jsp" />
</body>
</html>