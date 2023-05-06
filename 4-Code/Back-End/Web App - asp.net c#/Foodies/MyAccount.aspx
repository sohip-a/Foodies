<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MyAccount.aspx.cs" Inherits="Foodies.MyAccount" %>

<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="UTF-8">
	<title>My Account</title>
	<!-- <link rel="stylesheet" href="css.css"> -->
	<script src="js.js"></script>
	<style>
		header {
			background-color: #333;
			color: white;
			height: 60px;
			display: flex;
			justify-content: space-between;
			align-items: center;
		}

		nav ul {
			list-style: none;
			margin: 0;
			padding: 0;
			display: flex;
		}

		nav li {
			margin: 0 10px;
		}

		nav a {
			color: white;
			text-decoration: none;
			font-size: 18px;
			font-weight: bold;
			padding: 10px;
		}

		nav a:hover {
			background-color: white;
			color: #333;
		}

		main {
			display: flex;
			justify-content: center;
			align-items: center;
			height: 100vh;
		}

		fieldset {
			display: flex;
			flex-direction: column;
			align-items: center;
		}

		label {
			margin: 10px 0;
		}

		button {
			margin: 5px;
		}

		label,
		input,
		button {
			display: block;
			margin-bottom: 10px;
		}

		label,
		input,
		button {
			display: block;
			margin-bottom: 10px;
		}
	</style>
</head>
<header>
	<nav>
		<ul>
			<li><a runat="server" onserverclick="homeNavClick">Home</a></li>
			<li><a runat="server" onserverclick="loyaltyNavClick">Loyalty Points</a></li>
			<li><a href="login.aspx">Logout</a></li>
		</ul>
	</nav>
</header>

<body>

	<main>
		<form id="myAccForm" runat="server">
		<fieldset>
			<legend>My Account Information</legend>
			<div>
				<label for="user_id">Username:</label>
				<input type="text" id="user_id" name="user_id" value="example_id" runat="server"  onkeypress ="userNameChanged"  disabled>
				<button type="button" id="edit_id">Edit</button>

				<label for="email">Email:</label>
				<input type="email" id="email" name="email" value="example@example.com" runat="server" disabled>
				<button type="button" id="edit_email">Edit</button>

				<label for="phone">Phone:</label>
				<input type="tel" id="phone" name="phone" value="1234567890" runat="server" disabled>
				<button type="button" id="edit_phone">Edit</button>

				<label for="password">Password:</label>
				<input type="text" id="password" name="password" runat="server" disabled>
				<button type="button" id="edit_password">Edit</button>
				<br>
			</div>
		</fieldset>
		<button type="submit" runat="server" onserverclick="saveBtnClicked">Save Changes</button>
		</form>
	</main>

</body>

<script>
	// disable all text fields
	const textFields = document.querySelectorAll('input[type="text"], input[type="email"], input[type="tel"], input[type="password"]');
	textFields.forEach(textField => {
		textField.disabled = true;
		textField.style.opacity = '0.5'; // dim the text fields
	});

	// add event listener to each edit button
	const editButtons = document.querySelectorAll('button[id^="edit_"]');
	editButtons.forEach(editButton => {
		const inputId = editButton.previousElementSibling.getAttribute('id');
		const inputField = document.getElementById(inputId);
		editButton.addEventListener('click', () => {
			inputField.disabled = false;
			inputField.style.opacity = '1'; // enable the text field and restore its opacity
		});
	});

</script>

</html>
