<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DeleteOffer.aspx.cs" Inherits="Foodies.DeleteOffer" %>

<!DOCTYPE html>
<html>
<head>
	<title>Delete Offer</title>
	<!-- <link rel="stylesheet" type="text/css" href="css.css"> -->
	<style>
		/* Nav bar styling */
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
	
		/* Body styling */
		main {
		  max-width: 800px;
		  margin: 50px auto;
		}
	
		form {
      display: flex;
      flex-direction: column;
      align-items: center;
    }

    select {
      border: 1px solid black;
      padding: 5px;
      margin: 10px;
    }
	
		label {
		  font-size: 18px;
		  font-weight: bold;
		  margin-top: 20px;
		  margin-bottom: 5px;
		}
	
		input[type="text"],
		input[type="file"],
		input[type="submit"] {
		  padding: 10px;
		  font-size: 16px;
		  border:  2px solid black;
		  border-radius: 5px;
		  margin-bottom: 20px;
		  /* width: 100%; */
		  max-width: 400px;
		}
	
		input[type="submit"] {
		  background-color: #333;
		  color: white;
		  cursor: pointer;
		  transition: background-color 0.2s ease-in-out;
		}
	
		input[type="submit"]:hover {
		  background-color: #444;
		}
	  </style>
</head>
<header>
	<nav>
		<ul>
			<li><a href="homepage.aspx">Home</a></li>
		  <li><a href="adminPage.aspx">Admin Panel</a></li>
		  <li><a href="login.aspx">Logout</a></li>
		</ul>
	</nav>
</header>
<body>
	

	<main>
		<h1>Delete Offer</h1>
		<form id="deleteOfferForm" runat="server">

			<asp:DropDownList ID="ResturantSelect" runat="server" AutoPostBack="True" onselectedindexchanged="afterRestSelection"></asp:DropDownList>
			
			<asp:DropDownList ID="offerList" runat="server" AutoPostBack="True"></asp:DropDownList>
			

				
				
<br>
			<input type="submit" value="Delete" id="deleteOfferBtn" runat="server" onserverclick="deleteOfferBtnClick">
		</form>
	</main>
</body>
</html>

