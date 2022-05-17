<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Login</title>
<link rel="stylesheet" href="css/login_form.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"
	integrity="sha512-9usAa10IRO0HhonpyAIVpjrylPvoDwiPUiKdWk5t3PyolY1cOd4DSE0Ga+ri4AuTroPR5aQvXU9xC6qOPnzFeg=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<style type="text/css">
.login-customer {
	text-align: center;
}

.login-customer a {
	text-decoration: none;
	color: black;
	font-size: 15px;
}

</style>
</head>
<body>
	<div class="center">
		<input type="checkbox" name="" id="show"> <label for="show"
			class="show-tbn">Login</label>
		<div class="container">
			<label for="show" class="close-btn"><i class="fa fa-times"></i></label>
			<div class="text">LOGIN</div>
			<form method="post" action="home">
				<div class="data">
					<label for="">UserName</label> <input type="text" name="username"
						placeholder="">
				</div>
				<div class="data">
					<label for="" name="">Password</label> <input type="password"
						name="password" placeholder="">
				</div>
				<div class="forgot-pass">
					<a href="">Forgot Password?</a>
				</div>
				<div class="btn">
					<div class="inner">
						<input type="submit" value="Login">
					</div>
				</div>
			</form>
			<div class="login-customer">
				<a href="home">Login as customer</a>
			</div>
		</div>
	</div>
</body>

</html>