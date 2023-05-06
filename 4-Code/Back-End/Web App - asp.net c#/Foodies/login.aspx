<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="Foodies.login" %>

<!DOCTYPE html>
<html>
<head>
	<title>Food Web App - Login</title>
	<link rel="stylesheet" type="text/css" href="assets/css/css.css">
</head>
<body>
	<div class="bg-image"></div>
	<form id="loginForm" runat="server">
		<h2>Login</h2>
		<div class="input-container">
			<div class="input-container">
			<label for="email">Email:</label>
			<input type="email" id="email" name="email" required>
		</div>
		</div>

		<div class="input-container">
			<label for="password">Password:</label>
			<input type="password" id="password" name="password" required>
		</div>

		<div class="forgot-password">
			<a href="forgotpassword.aspx">Forgot Password?</a> <br> <br> 
		</div>

		
		<asp:Button ID="loginBtn" runat="server" Text="Login" OnClick="loginBtnClicked" Width="139px"/>
		  	
	</form>
	<script src="assets/js/js.js"></script>
</body>
</html>
