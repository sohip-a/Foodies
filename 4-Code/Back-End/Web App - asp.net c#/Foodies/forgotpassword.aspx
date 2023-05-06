<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="forgotpassword.aspx.cs" Inherits="Foodies.forgotpassword" %>

<!DOCTYPE html>
<html>
<head>
	<title>Food Web App - Forgot Password</title>
	<link rel="stylesheet" type="text/css" href="assets/css/css.css">
</head>
<body>
	<div class="bg-image"></div>
	<form id="resetForm" runat="server">
		<h2>Forgot Password</h2>
		<p>Enter your email address and new password below to reset your password.</p>
		<div class="input-container">
			<label for="email">Email:</label>
			<input type="email" id="email" name="email" required>
		</div>
		<div class="input-container">
			<label for="new-password">New Password:</label>
			<input type="password" id="new-password" name="new-password" required>
		</div>
		<div class="input-container">
			<label for="confirm-password">Confirm New Password:</label>
			<input type="password" id="confirm-password" name="confirm-password" required>
		</div>
		<asp:Button ID="resetBtn" runat="server" Text="Reset Password" OnClick="resetBtnClicked" Width="202px"/>
	</form>
	<!--<script src="script.js"></script>-->
</body>
</html>

