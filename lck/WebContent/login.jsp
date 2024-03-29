<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page errorPage="500.jsp" %>
<!DOCTYPE html>
<html lang="ko">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<title>Login</title>

<!-- Custom fonts for this template-->
 <link href="assets/lib/font-awesome/css/font-awesome.min.css" rel="stylesheet" />
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

<!-- Custom styles for this template-->
<link href="assets/css/sb-admin-2.css" rel="stylesheet">

</head>


<body class="bg-gradient-primary">

	<div class="container">
		<!-- Outer Row -->
		<div class="row justify-content-center">
			<div class="col-xl-10 col-lg-12 col-md-9">
				<div class="card o-hidden border-0 shadow-lg my-5">
					<div class="card-body p-0">
						<!-- Nested Row within Card Body -->
						<div class="row">
							<div class="col-lg-8 d-none d-lg-block bg-login-image"></div>
							<div class="col-lg-4">
								<div class="p-4">
									<div class="text-center">
										<h1 class="h4 text-gray-900 mb-4">Welcome Back!</h1>
									</div>
									<form class="user" action="user" method="post" autocomplete="off" >
										<input type="hidden" name="action" value="login"/>
										<div class="form-group">
											<input type="text" class="form-control form-control-user" id="InputId" name="name">
										</div>
										<div class="form-group">
											<input type="password" class="form-control form-control-user" id="InputPassword" name="password">
										</div>

										<input type="submit" class="btn btn-primary btn-user btn-block" value="Sign In">
										<!-- <div class="row">
											<div class="col-xs-5 mx-auto mt-4">
												<p style="color: red"></p>
											</div>
										</div> -->
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Bootstrap core JavaScript-->
	
        <script src="assets/lib/jquery/jquery.min.js"></script>
	<script src="assets/lib/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script src="assets/lib/easing/easing.min.js"></script>
	<!-- Custom scripts for all pages-->
	<script src="js/sb-admin-2.min.js"></script>


</body>

</html>