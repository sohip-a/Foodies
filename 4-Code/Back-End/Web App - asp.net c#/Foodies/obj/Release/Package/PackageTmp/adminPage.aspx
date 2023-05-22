<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="adminPage.aspx.cs" Inherits="Foodies.adminPage" %>

<!DOCTYPE html>
<html>

<head>
    <title>Admin Page</title>
    <style>
        body {
            background-color: #f5f5f5;
            font-family: Arial, sans-serif;
        }

        /* Navigation Bar */
        nav {
            background-color: #333;
            height: 50px;
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 0 20px;
        }

        nav ul {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        nav ul li {
            margin: 0;
        }


        nav a {
            color: #fff;
            text-decoration: none;
            font-size: 18px;
            margin: 0 10px;
        }

        nav a:hover {
            text-decoration: underline;
        }

        /* Body */
        .container {
            display: flex;
            flex-wrap: wrap;
            align-items: center;
            justify-content: center;
            margin: 50px auto;
            max-width: 800px;
        }

        .container a {
            background-color: #000;
            color: #fff;
            padding: 10px 20px;
            border-radius: 5px;
            text-align: center;
            text-decoration: none;
            font-size: 16px;
            margin: 10px;
            width: 200px;
        }

        .container a:nth-child(even) {
            margin-right: 0;
        }
    </style>
</head>

<body>
    <form id="adminPanelForm" runat="server">
    <!-- Navigation Bar -->
    <nav>
        <li><a href="homepage.aspx">Home</a></li>
          <!-- <li>Admin Panel</li> -->
          <li><a href="login.aspx">Logout</a></li>
    </nav>

    <!-- Body -->
    <div class="container">
        <a href="DeleteUser.aspx">Delete User</a>
        <a href="AddResturants.aspx">Add Restaurant</a>
        <a href="DeleteResturant.aspx">Delete Restaurant</a>
        <a href="addOffer.aspx">Add Offer</a>
        <a href="DeleteOffer.aspx">Delete Offer</a>
        <a href="addmenuitem.aspx">Add Menu Item</a>
        <a href="DeletemenueItem.aspx">Delete Menu Item</a>
    </div>
    </form>
</body>

</html>
