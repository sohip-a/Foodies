<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="reg.aspx.cs" Inherits="Foodies._1_reg" %>

<!DOCTYPE html>
<html>

<head>
	<title>Food Web App - Registration</title>
	<link rel="stylesheet" type="text/css" href="assets/css/css.css">	
</head>

<body>
	<form id="regForm" runat="server">
		<h2>Register</h2>
		<div class="input-container">
			<label for="username">Username:</label>
			<input type="text" id="username" name="username" required>
		</div>

		<div class="input-container">
			<label for="email">Email:</label>
			<input type="email" id="email" name="email" required>
		</div>

		<div class="input-container">
			<label for="phone">Phone number:</label>
			<input type="tel" id="phone" name="phone" required>
		</div>

		<div class="input-container">
			<label for="password">Password:</label>
			<input type="password" id="password" name="password" >
		</div>

		<div class="input-container">
			<label for="confirm_password">Confirm Password:</label>
			<input type="password" id="confirm_password" name="confirm_password" required>
		</div>

		<!--<button ID="regBtn2" runat="server" onserverclick="regBtnClicked" onclick="validateRegPage()">Register</button>-->
		<asp:Button ID="regBtn" runat="server" Text="Register" OnClick="regBtnClicked" OnClientClick="validateRegPage()" Width="102px" />
		
			<p class="login-link">Already have an account? <a
					href="login.aspx">Login</a></p>
	</form>

		<script src="assets/js/js.js"></script>

</body>

</html>
