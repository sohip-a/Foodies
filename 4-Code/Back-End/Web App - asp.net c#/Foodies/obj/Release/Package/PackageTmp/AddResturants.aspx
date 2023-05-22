<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddResturants.aspx.cs" Inherits="Foodies.AddResturants" %>

<!DOCTYPE html>
<html>

<head>
  <meta charset="UTF-8">
  <title>Add Restaurant - Admin Page</title>
  <link rel="stylesheet" href="cs.css">
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
    <form id="addRestForm" runat="server">
      <label for="resturant-name">Restaurant Name:</label>
      <input type="text" id="restName" name="resturant-name" runat="server">

      <label for="resturant-logo">Logo storage path:</label>
      <input type="text" id="restLogo" name="resturant-logo" runat="server">

      <input type="submit" value="Add"  runat="server" onserverclick="addRestClick">
    </form>
  </main>
</body>

</html>
