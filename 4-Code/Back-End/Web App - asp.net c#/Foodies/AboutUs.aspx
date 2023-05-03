<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AboutUs.aspx.cs" Inherits="Foodies.AboutUs" %>

<!DOCTYPE html>
<html>

<head>
	<title>About Us - Food Web App</title>
	<style type="text/css">
		body {
			margin: 0;
			padding: 0;
			font-family: Arial, sans-serif;
		}

		header {
			background-color: #333;
			color: #fff;
			padding: 10px;
			display: flex;
			justify-content: space-between;
			align-items: center;
			position: fixed;
			top: 0;
			left: 0;
			width: 100%;
			z-index: 1;
		}

		header img {
			height: 50px;
			margin-left: 20px;
		}

		header nav {
			margin-right: 20px;
		}

		header a {
			color: #fff;
			text-decoration: none;
			padding: 10px;
			margin-right: 10px;
		}

		header a:hover {
			background-color: #fff;
			color: #333;
		}

		main {
			margin-top: 100px;
			padding: 20px;
		}

		h1 {
			margin-top: 0;
			text-align: center;
			color: #333;
		}

		p {
			font-size: 1.2em;
			line-height: 1.5;
			color: #555;
			margin-bottom: 20px;
		}
	</style>
</head>

<body>
	<header>
		<a href="homepage.aspx">
			<img src="https://via.placeholder.com/50x50?text=Logo" alt="Food Web App Logo">
		</a>
		<nav>
			<li><a href="homepage.aspx">Home</a></li>
			<li><a href="Myaccount.aspx">My Account</a></li>
			<li><a href="loyaltypoints.aspx">Loyalty Points</a></li>
			<li><a href="login.aspx">Logout</a></li>
		</nav>
	</header>
	<main>
		<h1>About Us</h1>
		<p>Food Web App is a platform for finding and ordering food from local restaurants. We aim to provide a simple
			and convenient experience for our customers while supporting local businesses.</p>
	</main>
	
		
</body>

</html>
