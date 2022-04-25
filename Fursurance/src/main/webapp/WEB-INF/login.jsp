<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<jsp:include page="/WEB-INF/bootstraphead.jsp" />
</head>
<body>
	<jsp:include page="/WEB-INF/nav.jsp" />
	<!-- Pills navs -->
	<ul class="nav nav-pills nav-justified mb-3" id="ex1" role="tablist">
		<li class="nav-item" role="presentation"><a
			class="nav-link active" id="tab-login" data-mdb-toggle="pill"
			href="#pills-login" role="tab" aria-controls="pills-login"
			aria-selected="true">Login</a></li>
		<li class="nav-item" role="presentation"><a class="nav-link"
			id="tab-register" data-mdb-toggle="pill" href="#pills-register"
			role="tab" aria-controls="pills-register" aria-selected="false">Register</a>
		</li>
	</ul>
	<!-- Pills navs -->

	<!-- Pills content -->
	<div class="tab-content">
		<div class="tab-pane fade show active" id="pills-login"
			role="tabpanel" aria-labelledby="tab-login">
			<form action="login.do" method="post">


				
				<!-- Email input -->
				<div class="form-outline mb-4">
					<input type="text" name= "username" id="username" class="form-control" /> <label
						class="form-label" for="username">Email or username</label>
				</div>

				<!-- Password input -->
				<div class="form-outline mb-4">
					<input type="password" name="password" id="password" class="form-control" /> <label
						class="form-label" for="password">Password</label>
				</div>




				<!-- Submit button -->
				<button type="submit" class="btn btn-primary btn-block mb-4">Sign
					in</button>

				<!-- Register buttons -->

			</form>
		</div>
		<div class="tab-pane fade" id="pills-register" role="tabpanel"
			aria-labelledby="tab-register">
			<form action="register.do" method="post">


				<p class="text-center">or:</p>

				<!-- Name input -->
				<div class="form-outline mb-4">
					<input type="text" name="firstName" id="firstName" class="form-control" /> <label
						class="form-label" for="firstName">First Name</label>
				</div>
				<div class="form-outline mb-4">
					<input type="text" name="lastName" id="lastName" class="form-control" /> <label
						class="form-label" for="lastName">Last Name</label>
				</div>

				<!-- Username input -->
				<div class="form-outline mb-4">
					<input type="text" name="username" id="username" class="form-control" /> <label
						class="form-label" for="username">Username</label>
				</div>

				<!-- Email input -->
				<div class="form-outline mb-4">
<<<<<<< HEAD:Fursurance/src/main/webapp/WEB-INF/logIn.jsp
					<input type="email" name = "email" id="email" class="form-control" /> <label
=======
					<input type="email" name="email" id="email" class="form-control" /> <label
>>>>>>> b9af675d09a2ebbc7662d25127b9de0bbb64102c:Fursurance/src/main/webapp/WEB-INF/login.jsp
						class="form-label" for="email">Email</label>
				</div>

				<!-- Password input -->
				<div class="form-outline mb-4">
<<<<<<< HEAD:Fursurance/src/main/webapp/WEB-INF/logIn.jsp
					<input type="password"  name="password" id="password" class="form-control" /> <label
						class="form-label" for="password">Password</label>
				</div>
				<div class="form-outline mb-4">
					<input type="text" name="street"  id="street" class="form-control" /> <label
						class="form-label" for="street">street</label>
				</div>
				<div class="form-outline mb-4">
					<input type="text" name="city" id="city" class="form-control" /> <label
						class="form-label" for="city">City</label>
				</div>
				<div class="form-outline mb-4">
					<input type="text" name="state" id="state" class="form-control" /> <label
=======
					<input type="password" name= "password" id="password" class="form-control" /> <label
						class="form-label" for="password">Password</label>
				</div>
				<div class="form-outline mb-4">
					<input type="text" name= "street" id="street" class="form-control" /> <label
						class="form-label" for="street">Street</label>
				</div>
				<div class="form-outline mb-4">
					<input type="text" name= "city" id="city" class="form-control" /> <label
						class="form-label" for="city">City</label>
				</div>
				<div class="form-outline mb-4">
					<input type="text" name= "state" id="state" class="form-control" /> <label
>>>>>>> b9af675d09a2ebbc7662d25127b9de0bbb64102c:Fursurance/src/main/webapp/WEB-INF/login.jsp
						class="form-label" for="state">State</label>
				</div>
				<div class="form-outline mb-4">
					<input type="text" name="postalCode" id="postalCode" class="form-control" /> <label
						class="form-label" for="postalCode">Postal Code</label>
				</div>
				<div class="form-outline mb-4">
					<input type="text" name="country" id="country" class="form-control" /> <label
						class="form-label" for="country">Country</label>
				</div>



				<!-- Submit button -->
				<button type="submit" class="btn btn-primary btn-block mb-3">Sign
					in</button>
			</form>
		</div>
	</div>
	<!-- Pills content -->


	<jsp:include page="/WEB-INF/bootstrap-js.jsp" />
</body>
</html>