<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DeletemenueItem.aspx.cs" Inherits="Foodies.DeletemenueItem" %>

<!DOCTYPE html>
<html>

<head>
    <title>Delete Menu Item</title>
    <link rel="stylesheet" type="text/css" href="csws.css">
    <style>
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        body {
            font-family: Arial, sans-serif;
        }

        header {
            background-color: #333;
            color: #fff;
            padding: 10px;
        }

        nav ul {
            list-style: none;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        nav ul li {
            margin-right: 10px;
        }

        nav ul li a {
            color: #fff;
            text-decoration: none;
        }

        main {
            max-width: 800px;
            margin: 0 auto;
            text-align: center;
        }

        h1 {
            margin: 20px 0;
        }

        form {
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        label {
            margin-top: 20px;
            font-weight: bold;
        }

        select {
            margin: 10px 0;
            padding: 5px;
            font-size: 16px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        button[type="submit"] {
            margin-top: 20px;
            padding: 10px 20px;
            background-color: #333;
            color: #fff;
            font-size: 16px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        button[type="submit"]:hover {
            background-color: #555;
        }

        form {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            align-items: center;
            margin: 20px;
        }

        label {
            font-weight: bold;
            margin-right: 10px;
        }

        select,
        button {
            padding: 5px;
            margin: 10px;
            border-radius: 5px;
            border: none;
            background-color: #f2f2f2;
            font-size: 16px;
        }

        button {
            cursor: pointer;
            background-color: #4CAF50;
            color: #fff;
        }

        button:hover {
            background-color: #3e8e41;
        }
    </style>
</head>

<body>
    <header>
        <nav>
            <ul>
                <li><a href="homepage.aspx">Home</a></li>
                <li><a href="adminPage.aspx">Admin Panel</a></li>
                <li><a href="login.aspx">Logout</a></li>
            </ul>
        </nav>
    </header>
    <main>
        <h1>Delete Menu Item</h1>
        <form id="deleteItemForm" runat="server">
            <label for="resturant">Resturant Name:</label>
            
            <asp:DropDownList ID="resturantSelect" runat="server" AutoPostBack="True" onselectedindexchanged="afterRestSelection"></asp:DropDownList>

            <label for="menu-item">Menu Item:</label>

            <asp:DropDownList ID="itemList" runat="server" AutoPostBack="True"></asp:DropDownList>

            <button type="submit" id="deleteItemBtn" runat="server" onserverclick="deleteItemClick">Delete</button>
        </form>
    </main>
</body>

</html>