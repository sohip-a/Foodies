<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="addmenuitem.aspx.cs" Inherits="Foodies.addmenuitem" %>

<!DOCTYPE html>
<html>

<head>
  <title>Add Menu Item</title>
  <link rel="stylesheet" href="ss.css">
  <style>
    /* Nav bar styling */
    header {
      background-color: #333;
      color: 333;
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
      background-color: #333;
      text-decoration: none;
      font-size: 18px;
      font-weight: bold;
      padding: 10px;
    }

    nav a:hover {
      background-color: black;
      color: white;
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
      border: 2px solid black;
      border-radius: 5px;
      margin-bottom: 20px;
      width: 100%;
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

    .container {
      width: 50%;
      margin: 50px auto;
    }

    form {
      border: 1px solid #ccc;
      padding: 20px;
      border-radius: 5px;
    }

    h1 {
      text-align: center;
      margin-bottom: 30px;
    }

    .form-group {
      margin-bottom: 20px;
    }

    label {
      display: block;
      font-weight: bold;
      margin-bottom: 5px;
    }

    select,
    input[type="text"],
    input[type="file"],
    input[type="number"] {
      display: block;
      width: 100%;
      padding: 10px;
      border: 1px solid #ccc;
      border-radius: 5px;
      font-size: 16px;
      outline: none;
    }

    select:focus,
    input[type="text"]:focus,
    input[type="file"]:focus,
    input[type="number"]:focus {
      border-color: #000;
    }

    button[type="button"] {
      background-color: #007bff;
      color: #fff;
      border: none;
      padding: 10px 20px;
      border-radius: 5px;
      font-size: 16px;
      cursor: pointer;
    }

    button[type="button"]:hover {
      background-color: #0062cc;
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

  <div class="container">
    <h1>Add Menu Item</h1>
    <form id="addMenuForm" runat="server">
      <div class="form-group">
        <label for="restaurantSelection">Select a restaurant:</label>
        <select id="restaurantSelection" runat="server">
          <option value="restaurant1">Restaurant 1</option>
          <option value="restaurant2">Restaurant 2</option>
          <option value="restaurant3">Restaurant 3</option>
        </select>
      </div>
      <div class="form-group">
        <label for="itemName">Item Name:</label>
        <input type="text" id="itemName" runat ="server">
      </div>
      <div class="form-group">
        <label for="itemPhoto">Item Photo Path:</label>
        <input type="text" id="itemPhoto" runat="server">
      </div>
      <div class="form-group">
        <label for="itemPrice">Item Price:</label>
        <input type="number" id="itemPrice" runat="server">
      </div>
      <div class="form-group">
        <button type="button" id="addItemBtn" runat="server" onserverclick="addItemClick">Add Item</button>
      </div>
    </form>
  </div>
  <script src="assets/js/script.js"></script>
</body>

</html>
