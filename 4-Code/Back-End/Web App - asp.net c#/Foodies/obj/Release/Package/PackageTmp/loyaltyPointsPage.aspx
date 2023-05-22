<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="loyaltyPointsPage.aspx.cs" Inherits="Foodies.loyaltyPointsPage" %>

<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="UTF-8">
	<title>My Loyalty points</title>
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
			<li><a runat="server" onserverclick="accNavClick">My Account</a></li>
			<li><a href="login.aspx">Logout</a></li>
		</ul>
	</nav>
</header>

<body>
	<form id="Form1" runat="server">
		<main>	
			<p runat="server" id="showLoyalty"> Your loyalty points equal 0000</p>
		</main>
	</form>
</body>

<script>
</script>

</html>
